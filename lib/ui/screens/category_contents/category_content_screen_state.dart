part of 'category_content_screen_cubit.dart';

@immutable
abstract class CategoryContentScreenState {}

class CategoryContentScreenInitial extends CategoryContentScreenState {}

class LoadingContents extends CategoryContentScreenState {}
class NoContents extends CategoryContentScreenState {}
class LoadContentsFailed extends CategoryContentScreenState {
  final String msg;

  LoadContentsFailed(this.msg);
}
class ReceivedContents extends CategoryContentScreenState {
  final List<ContentModel> contents;

  ReceivedContents(this.contents);
}

