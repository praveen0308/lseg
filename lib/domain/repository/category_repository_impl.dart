import 'package:lseg/data/local/categories_box.dart';
import 'package:lseg/data/remote/services/category_service.dart';
import 'package:lseg/data/repository/category_repository.dart';
import 'package:lseg/domain/mapper/category_entity_mapper.dart';
import 'package:lseg/domain/models/category_model.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryService _categoryService;
  final CategoriesBox _categoriesBox;

  CategoryRepositoryImpl(this._categoryService, this._categoriesBox);

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      var cats = await _categoriesBox.readAll();
      if(cats.isNotEmpty){
        return cats.map((e) => CategoryEntityMapper().toDomain(e)).toList();
      }else{
        var response = await _categoryService.getCategories();
        await _categoriesBox.addAll(response);
        return response.map((e) => CategoryEntityMapper().toDomain(e)).toList();
      }

    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<void> addNewCategory(CategoryModel categoryModel) {
    String iconName = categoryModel.name!.toLowerCase().trim().replaceAll(" ", "_");
    categoryModel.icon = "icons/category/ic_$iconName.png";
    return _categoryService.addNewCategory(CategoryEntityMapper().fromDomain(categoryModel));
  }

  @override
  Future<List<CategoryModel>> getRecommendedCategories({int limit = 10}) async {
    try {
      var response = await _categoryService.getRecommendedCategories(limit: limit);
      return response.map((e) => CategoryEntityMapper().toDomain(e)).toList();
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }
}
