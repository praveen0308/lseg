part of 'search_page_cubit.dart';

@immutable
abstract class SearchPageState {}

class SearchPageInitial extends SearchPageState {}
class LoadingRecommendedCategories extends SearchPageState {}
class ReceivedCategories extends SearchPageState {
  final List<CategoryModel> categories;

  ReceivedCategories(this.categories);
}
class LoadRecommendedCategoriesFailed extends SearchPageState {
  final String msg;

  LoadRecommendedCategoriesFailed(this.msg);
}
