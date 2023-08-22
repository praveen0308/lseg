part of 'categories_screen_cubit.dart';

@immutable
abstract class CategoriesScreenState {}

class CategoriesScreenInitial extends CategoriesScreenState {}

class LoadingCategories extends CategoriesScreenState {}

class NoCategoriesFound extends CategoriesScreenState {}

class LoadCategoriesFailed extends CategoriesScreenState {
  final String msg;

  LoadCategoriesFailed(this.msg);
}

class ReceivedCategories extends CategoriesScreenState {
  final List<CategoryModel> categories;

  ReceivedCategories(this.categories);
}
