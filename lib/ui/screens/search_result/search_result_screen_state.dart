part of 'search_result_screen_cubit.dart';

@immutable
abstract class SearchResultScreenState {}

class SearchResultScreenInitial extends SearchResultScreenState {}

class LoadingContents extends SearchResultScreenState {}
class NoContents extends SearchResultScreenState {}
class LoadContentsFailed extends SearchResultScreenState {
  final String msg;

  LoadContentsFailed(this.msg);
}
class ReceivedContents extends SearchResultScreenState {
  final List<ContentModel> contents;

  ReceivedContents(this.contents);
}

