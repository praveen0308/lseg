part of 'my_content_screen_cubit.dart';

@immutable
abstract class MyContentScreenState {}

class MyContentScreenInitial extends MyContentScreenState {}
class DeletingContent extends MyContentScreenState {}
class DeletedSuccessfully extends MyContentScreenState {}
class DeletionFailed extends MyContentScreenState {}
class LoadingContents extends MyContentScreenState {}
class NoContents extends MyContentScreenState {}
class LoadContentsFailed extends MyContentScreenState {
  final String msg;

  LoadContentsFailed(this.msg);
}
class ReceivedContents extends MyContentScreenState {
  final List<ContentModel> contents;

  ReceivedContents(this.contents);
}
