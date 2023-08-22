part of 'favourites_screen_cubit.dart';

@immutable
abstract class FavouritesScreenState {}

class FavouritesScreenInitial extends FavouritesScreenState {}

class LoadingContents extends FavouritesScreenState {}
class NoContents extends FavouritesScreenState {}
class LoadContentsFailed extends FavouritesScreenState {
  final String msg;

  LoadContentsFailed(this.msg);
}
class ReceivedContents extends FavouritesScreenState {
  final List<ContentModel> contents;

  ReceivedContents(this.contents);
}
