part of 'upload_thumbnail_view_cubit.dart';

@immutable
abstract class UploadThumbnailViewState {}

class UploadThumbnailViewInitial extends UploadThumbnailViewState {}

class FileAvailable extends UploadThumbnailViewState {
  final File file; // To compressed and processed image will be provided here from cubit

  FileAvailable(this.file);
}

class FileUploading extends UploadThumbnailViewState {
  final double progress;

  FileUploading(this.progress);
}
class FileUploadedSuccessfully extends UploadThumbnailViewState {
  final String url;
  final String localUrl;

  FileUploadedSuccessfully(this.url, this.localUrl);

}
class UploadStarted extends UploadThumbnailViewState {}
class FileUploadFailed extends UploadThumbnailViewState {}

