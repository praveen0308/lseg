part of 'profile_image_uploader_cubit.dart';

@immutable
abstract class ProfileImageUploaderState {}

class ProfileImageUploaderInitial extends ProfileImageUploaderState {}

class ProfileImageAvailable extends ProfileImageUploaderState {
  final File image; // To compressed and processed image will be provided here from cubit

  ProfileImageAvailable(this.image);
}

class ProfileImageUploading extends ProfileImageUploaderState {
  final double progress;

  ProfileImageUploading(this.progress);
}
class ImageUploadedSuccessfully extends ProfileImageUploaderState {
  final String url;
  final String localUrl;

  ImageUploadedSuccessfully(this.url, this.localUrl);

}
class UploadStarted extends ProfileImageUploaderState {}
class ImageUploadFailed extends ProfileImageUploaderState {}
