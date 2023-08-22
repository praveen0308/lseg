part of 'upload_content_screen_cubit.dart';

@immutable
abstract class UploadContentScreenState {}

class UploadContentScreenInitial extends UploadContentScreenState {}
class LoadingCategories extends UploadContentScreenState {}
class ReceivedCategories extends UploadContentScreenState {
  final List<CategoryModel> categories;

  ReceivedCategories(this.categories);
}
class ContentPdfAvailable extends UploadContentScreenState {
  final File file;

  ContentPdfAvailable(this.file);
}
class ContentThumbnailAvailable extends UploadContentScreenState {
  final File file;
  ContentThumbnailAvailable(this.file);
}

// first step
class ValidateBasicDetails extends UploadContentScreenState {}
class SubmittingBasicDetails extends UploadContentScreenState {}
class BasicDetailsSubmitted extends UploadContentScreenState {}

// second step
class ValidateMoreDetails extends UploadContentScreenState {}
class StartContentUpload extends UploadContentScreenState {}

// third step
class UploadingContentPdf extends UploadContentScreenState {
  final double progress;

  UploadingContentPdf(this.progress);
}
class ContentPdfUploadedSuccessfully extends UploadContentScreenState {}
class ContentPdfUploadFailed extends UploadContentScreenState {}

// fourth step
class UploadingContentThumbnail extends UploadContentScreenState {
  final double progress;

  UploadingContentThumbnail(this.progress);
}
class ContentThumbnailUploadedSuccessfully extends UploadContentScreenState {}
class ContentThumbnailUploadFailed extends UploadContentScreenState {}

// fifth step
class CreatingContent extends UploadContentScreenState {}
class ContentUploadedSuccessfully extends UploadContentScreenState {}
class UploadContentFailure extends UploadContentScreenState {}
