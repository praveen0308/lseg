part of 'purchased_content_screen_cubit.dart';

@immutable
abstract class PurchasedContentScreenState {}

class PurchasedContentScreenInitial extends PurchasedContentScreenState {}
class LoadingContents extends PurchasedContentScreenState {}
class NoContents extends PurchasedContentScreenState {}
class LoadContentsFailed extends PurchasedContentScreenState {
  final String msg;

  LoadContentsFailed(this.msg);
}
class ReceivedContents extends PurchasedContentScreenState {
  final List<ContentModel> contents;

  ReceivedContents(this.contents);
}
