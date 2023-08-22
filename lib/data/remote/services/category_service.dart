import 'package:lseg/data/data.dart';

abstract class CategoryService{
  Future<List<CategoryEntity>> getCategories();
  Future<List<CategoryEntity>> getRecommendedCategories();
  Future<void> updateCategory(CategoryEntity entity);
  Future<void> addNewCategory(CategoryEntity entity);
  Future<void> deleteCategory(String categoryId);
}