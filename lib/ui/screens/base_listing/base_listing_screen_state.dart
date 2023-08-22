part of 'base_listing_screen_cubit.dart';

@immutable
abstract class BaseListingScreenState {}

class BaseListingScreenInitial extends BaseListingScreenState {}
class LoadingListing extends BaseListingScreenState {}
class NoData extends BaseListingScreenState {}
class LoadListingFailed extends BaseListingScreenState {
  final String msg;

  LoadListingFailed(this.msg);
}
class ReceivedContentListing extends BaseListingScreenState {
  final List<ContentModel> items;

  ReceivedContentListing(this.items);
}

class ReceivedCategoryListing extends BaseListingScreenState {
  final List<CategoryModel> items;

  ReceivedCategoryListing(this.items);
}

