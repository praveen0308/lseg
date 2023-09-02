import 'package:lseg/domain/domain.dart';

abstract class CategoryRepository{
  Future<List<CategoryModel>> getCategories();
  Future<List<CategoryModel>> getRecommendedCategories({int limit = 10});
  Future<void> addNewCategory(CategoryModel categoryModel);
}