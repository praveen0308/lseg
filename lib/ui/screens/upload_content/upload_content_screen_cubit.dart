import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'upload_content_screen_state.dart';

class UploadContentScreenCubit extends Cubit<UploadContentScreenState>
    with BaseCubit {
  final ContentRepositoryImpl _contentRepositoryImpl;
  final CategoryRepositoryImpl _categoryRepositoryImpl;

  UploadContentScreenCubit(this._contentRepositoryImpl, this._categoryRepositoryImpl)
      : super(UploadContentScreenInitial());

  // Create the file metadata
  final thumbnailMetadata = SettableMetadata(contentType: "image/jpeg");
  final pdfMetadata = SettableMetadata(contentType: "document/pdf");

// Create a reference to the Firebase Storage bucket
  final storageRef = FirebaseStorage.instance.ref();

  UploadTask? uploadPdfTask;
  UploadTask? uploadThumbnailTask;

  int activeStep = 0;

  UserModel? userModel;
  ContentModel? contentModel;
  File? selectedContentPdf;
  File? selectedContentThumbnail;

  Future<void> initContentData() async {
    contentModel = ContentModel();
  }
  Future<void> loadCategories() async {
    emit(LoadingCategories());
    try{
      var response = await _categoryRepositoryImpl.getCategories();
      emit(ReceivedCategories(response));
    }catch(e){
      logger.e(e);
    }

  }

  Future<void> uploadContent() async {
    emit(CreatingContent());
    try{
      var response = await _contentRepositoryImpl.uploadNewContent(contentModel!);
      if(response!=null){
        contentModel = response;
      }
      emit(ContentUploadedSuccessfully());
    }catch(e){
      logger.e(e);
    }

  }

  Future<void> submitContentBasicDetails(
      {String? title,
      String? subTitle,
      String? description,
      CategoryModel? category,
      String? format}) async {
    emit(SubmittingBasicDetails());
    try {
      contentModel?.title = title;
      contentModel?.subtitle = subTitle;
      contentModel?.description = description;
      contentModel?.categoryId = category?.id;
      contentModel?.category = category?.name;
      contentModel?.format = format;
      emit(BasicDetailsSubmitted());
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  Future<void> submitContentMoreDetails(
      {String? courseType, String? priceAmount}) async {
    emit(SubmittingBasicDetails());
    try {
      contentModel?.isPaid = courseType?.contains("Paid");
      contentModel?.price = double.tryParse(priceAmount.toString()) ?? 0.0;

      emit(StartContentUpload());
    } on Exception catch (e) {
      logger.e(e);
    }
  }

  Future<void> backNavigate() async {
    emit(UploadContentScreenInitial());
  }

  void validateBasicDetails() => emit(ValidateBasicDetails());

  void validateMoreDetails() => emit(ValidateMoreDetails());

  void pickContentPdf(File file) {
    selectedContentPdf = file;
    emit(ContentPdfAvailable(file));
  }

  void pickContentThumbnail(File file) {
    selectedContentThumbnail = file;
    emit(ContentThumbnailAvailable(file));
  }

  Future<void> uploadContentPdf() async {
    emit(UploadingContentPdf(0));
    uploadPdfTask = storageRef
        .child(contentModel!.contentData!.contentPath!)
        .putFile(selectedContentPdf!, pdfMetadata);
    uploadPdfTask?.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Pdf Upload is $progress% complete.");
          emit(UploadingContentPdf(progress));
          break;
        case TaskState.paused:
          print("Pdf Upload is paused.");
          break;
        case TaskState.canceled:
          print("Pdf Upload was canceled");
          break;
        case TaskState.error:
          emit(ContentPdfUploadFailed());
          break;
        case TaskState.success:
          var downloadUrl = await taskSnapshot.ref.getDownloadURL();
          contentModel!.contentData?.contentUrl = downloadUrl;
          emit(ContentPdfUploadedSuccessfully());

          break;
      }
    });
  }

  Future<void> uploadContentThumbnail() async {
    var compressResultFile =
        await compressContentThumbnailFile(selectedContentThumbnail!);
    emit(UploadingContentThumbnail(0));
    uploadThumbnailTask = storageRef
        .child(contentModel!.contentData!.thumbnailPath!)
        .putFile(compressResultFile, thumbnailMetadata);
    uploadThumbnailTask?.snapshotEvents
        .listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Thumbnail Upload is $progress% complete.");
          emit(UploadingContentThumbnail(progress));
          break;
        case TaskState.paused:
          print("Thumbnail Upload is paused.");
          break;
        case TaskState.canceled:
          print("Thumbnail Upload was canceled");
          break;
        case TaskState.error:
          emit(ContentThumbnailUploadFailed());
          break;
        case TaskState.success:
          var downloadUrl = await taskSnapshot.ref.getDownloadURL();
          contentModel!.contentData?.thumbnailUrl = downloadUrl;
          emit(ContentThumbnailUploadedSuccessfully());
          break;
      }
    });
  }

  Future<File> compressContentThumbnailFile(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();

    final filePath =
        "${appDocDir.absolute.path}/contentThumbnail${DateTime.now().millisecondsSinceEpoch}.jpg";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      filePath,
      quality: 50,
    );

    var resultFile = File(result!.path);
    return resultFile;
  }
}
