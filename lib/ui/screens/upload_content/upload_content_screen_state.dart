part of 'upload_content_screen_cubit.dart';

@immutable
abstract class UploadContentScreenState {}

class UploadContentScreenInitial extends UploadContentScreenState {}

class UploadingContent extends UploadContentScreenState {}
class ContentUploadedSuccessfully extends UploadContentScreenState {}
class UploadContentFailure extends UploadContentScreenState {}
