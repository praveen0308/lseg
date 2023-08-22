part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}
class LoadingData extends HomePageState {}
class NoDataFound extends HomePageState {}
class HomeListingFailed extends HomePageState {
  final String msg;

  HomeListingFailed(this.msg);
}
class ReceivedHomeListing extends HomePageState {
  final List<HomeListing> data;

  ReceivedHomeListing(this.data);
}
