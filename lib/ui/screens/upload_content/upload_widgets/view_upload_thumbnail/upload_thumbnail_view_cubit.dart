import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:lseg/local/local.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

part 'upload_thumbnail_view_state.dart';

class UploadThumbnailViewCubit extends Cubit<UploadThumbnailViewState> {
  final AppStorage _appStorage;
  UploadThumbnailViewCubit(this._appStorage) : super(UploadThumbnailViewInitial());

  // Create the file metadata
  final metadata = SettableMetadata(contentType: "image/jpeg");

// Create a reference to the Firebase Storage bucket
  final storageRef = FirebaseStorage.instance.ref();

// Upload file and metadata to the path 'images/mountains.jpg'
  UploadTask? uploadTask;
  String? userId;

  Future<void> uploadProfileImage(File file) async {
    userId = await _appStorage.getUserID();
    var contentId = "4545454545";
    var compressResultFile = await compressFile(file);
    emit(UploadStarted());
    uploadTask = storageRef.child("contents/thumbnails/picture_${userId}_$contentId.jpg").putFile(compressResultFile, metadata);
    uploadTask?.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          emit(FileUploading(progress));
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
          emit(FileUploadFailed());
          break;
        case TaskState.success:

          var downloadUrl = await taskSnapshot.ref.getDownloadURL();
          /*_appStorage.updateProfileUrl(downloadUrl);
          _appStorage.updateLocalProfilePath(compressResultFile.path);*/
          emit(FileUploadedSuccessfully(downloadUrl,compressResultFile.path));
          break;
      }
    });
  }

  Future<File> compressFile(File file) async {
    final appDocDir = await getApplicationDocumentsDirectory();
    print(appDocDir);
    print(appDocDir.path);
    print(appDocDir.absolute);
    print(appDocDir.absolute.path);
    final filePath = "${appDocDir.absolute.path}/profileImage.jpg";
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      filePath,
      quality: 50,
    );

    print(result);
    var resultFile = File(result!.path);
    print(file.lengthSync());
    print(resultFile.lengthSync());
    print("Result file stored at : ${resultFile.path}");
    return resultFile;
  }

  void selectImage(File file) {
    emit(FileAvailable(file));
  }
}


/*
enum AppContentType {
  profile(metadataType: "image/jpeg",filePath: "profile/"),
  thumbnail(),
  contentDoc();

  const AppContentType({
    required this.metadataType,
    required this.filePath,
    required this.maxSize,
});

  final String metadataType;
  final String filePath;
  final num maxSize;

}*/
