part of 'content_details_screen_cubit.dart';

@immutable
abstract class ContentDetailsScreenState {}

class ContentDetailsScreenInitial extends ContentDetailsScreenState {}
class UpdateFavouriteFailed extends ContentDetailsScreenState {
  final String msg;

  UpdateFavouriteFailed(this.msg);
}
class UpdatingFavourite extends ContentDetailsScreenState {}
class AddedIntoFavourites extends ContentDetailsScreenState {}
class RemovedFromFavourites extends ContentDetailsScreenState {}


class UpdatingViewCount extends ContentDetailsScreenState {}
class ViewCountUpdated extends ContentDetailsScreenState {}
class UpdateViewCountFailed extends ContentDetailsScreenState {
  final String msg;

  UpdateViewCountFailed(this.msg);
}

class LoadingRecommendedContent extends ContentDetailsScreenState {}
class NoRecommendedContentFound extends ContentDetailsScreenState {}
class ReceivedRecommendContent extends ContentDetailsScreenState {
  final String title;
  final List<ContentModel> items;

  ReceivedRecommendContent(this.title, this.items);
}
class LoadRecommendedContentFailed extends ContentDetailsScreenState {
  final String msg;

  LoadRecommendedContentFailed(this.msg);
}

class UpdatingContentReview extends ContentDetailsScreenState {}
class ContentReviewUpdated extends ContentDetailsScreenState {}
class UpdateContentReviewFailed extends ContentDetailsScreenState {
  final String msg;

  UpdateContentReviewFailed(this.msg);
}

