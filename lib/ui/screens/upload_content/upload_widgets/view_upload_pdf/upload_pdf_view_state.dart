part of 'upload_pdf_view_cubit.dart';

@immutable
abstract class UploadPdfViewState {}

class UploadPdfViewInitial extends UploadPdfViewState {}

class FileAvailable extends UploadPdfViewState {
  final File file; // To compressed and processed image will be provided here from cubit

  FileAvailable(this.file);
}

class FileUploading extends UploadPdfViewState {
  final double progress;

  FileUploading(this.progress);
}

class FileUploadedSuccessfully extends UploadPdfViewState {
  final String url;
  final String localUrl;

  FileUploadedSuccessfully(this.url, this.localUrl);
}

class UploadStarted extends UploadPdfViewState {}

class FileUploadFailed extends UploadPdfViewState {}
