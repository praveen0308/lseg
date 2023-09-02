import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/ui/screens/core/base_cubit.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'edit_content_screen_state.dart';

class EditContentScreenCubit extends Cubit<EditContentScreenState>
    with BaseCubit {
  final ContentRepositoryImpl _contentRepositoryImpl;
  final CategoryRepositoryImpl _categoryRepositoryImpl;

  EditContentScreenCubit(
      this._contentRepositoryImpl, this._categoryRepositoryImpl)
      : super(LoadingContent());

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

  Future<void> initContentData(ContentModel data) async {
    contentModel = data;
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      var response = await _categoryRepositoryImpl.getCategories();
      emit(ContentLoaded(
          data: contentModel!,
          categories: response,
          activePage: 0,
          status: SubmissionStatus.idle));
    } catch (e) {
      logger.e(e);
      emit(NoContentData());
    }
  }

  Future<void> submitContentBasicDetails(
      {String? title,
      String? subTitle,
      String? description,
      CategoryModel? category,
      String? format}) async {
    var previousState = state as ContentLoaded;
    var newState = previousState.copyWith(
        data: previousState.data.copyWith(
            title: title,
            subtitle: subTitle,
            description: description,
            categoryId: category?.id,
            category: category?.name,
            format: format),
        activePage: 1);


    emit(newState);
  }

  Future<void> submitContentMoreDetails(
      {String? courseType, String? priceAmount}) async {
    var previousState = state as ContentLoaded;
    var newState = previousState.copyWith(
        data: previousState.data.copyWith(
          isPaid: courseType?.contains("Paid"),
          price: double.tryParse(priceAmount.toString()) ?? 0.0,
        ),
        status: SubmissionStatus.inProgress, activePage: 2);

    emit(newState);
  }

  void navigateToPage(int index) {
    var previousState = state as ContentLoaded;
    var newState = previousState.copyWith(
        activePage: index, status: SubmissionStatus.idle);

    emit(newState);
  }

  Future<void> updateContent() async {
    var previousState = state as ContentLoaded;

    var tasks = List<Future<SubmissionResult>>.empty(growable: true);
    tasks.add(updateContentData());
    if(previousState.pdf!=null){
      tasks.add(uploadContentPdf());
    }
    if(previousState.thumbnail!=null){
      tasks.add(uploadContentThumbnail());
    }
    var results = await Future.wait(tasks);

    emit(previousState.copyWith(status: SubmissionStatus.success,results: results));
  }

  Future<SubmissionResult> updateContentData() async {
    try {
      await _contentRepositoryImpl.updateContentDetails((state as ContentLoaded).data);
      return SubmissionResult(true, "Data Updated Successfully!!!");
    } catch (e) {
      logger.e(e);
      return SubmissionResult(false, "Data Update failed!!!");
    }
  }

  void pickContentPdf(File file) {
    var previousState = state as ContentLoaded;
    var newState = previousState.copyWith(pdf: file, activePage: 1);
    emit(newState);
  }

  void pickContentThumbnail(File file) {
    var previousState = state as ContentLoaded;
    var newState = previousState.copyWith(thumbnail: file, activePage: 1);
    emit(newState);
  }

  Future<SubmissionResult> uploadContentPdf() async {
    var currentState = state as ContentLoaded;

    try {
      await storageRef
          .child(contentModel!.contentData!.contentPath!)
          .putFile(currentState.pdf!, pdfMetadata);
      return SubmissionResult(true, "PDF Updated Successfully!!!");
    } catch (e) {
      logger.e(e);
      return SubmissionResult(false, "PDF Update failed!!!");
    }
  }

  Future<SubmissionResult> uploadContentThumbnail() async {
    var currentState = state as ContentLoaded;
    var compressResultFile =
        await compressContentThumbnailFile(currentState.thumbnail!);

    try {
      await storageRef
          .child(contentModel!.contentData!.thumbnailPath!)
          .putFile(compressResultFile, thumbnailMetadata);
      return SubmissionResult(true, "Thumbnail Updated Successfully!!!");
    } catch (e) {
      logger.e(e);
      return SubmissionResult(false, "Thumbnail Update failed!!!");
    }
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
