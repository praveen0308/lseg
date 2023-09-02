import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/data/entities/category_entity.dart';
import 'package:lseg/data/remote/services/category_service.dart';
import 'package:lseg/utils/utils.dart';

import 'firestore_config.dart';

class FirebaseCategoryServiceImpl extends CategoryService {
  final categories = FirebaseFirestore.instance.collection(categoryCollection);
  final contents = FirebaseFirestore.instance.collection(contentCollection);
  final storageRef = FirebaseStorage.instance.ref();

  Future<List<CategoryEntity>> getCategoryWithRealUrls(
      List<CategoryEntity> items) async {
    List<CategoryEntity> newItems = [];
    await Future.forEach(items, (element) async {
      var iconUrl = await storageRef.child(element.icon!).getDownloadURL();

      newItems.add(element.copyWith(icon: iconUrl));
    });
    return newItems;
  }

  @override
  Future<void> addNewCategory(CategoryEntity entity) {
    // TODO: implement addNewCategory
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategory(String categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      var response = await categories.get();
      var items = response.docs
          .map((e) => CategoryEntity.fromJson(e))
          .toList(growable: true);
      return items;
      /*List<CategoryEntity> newItems = [];
      await Future.forEach(items, (element)async{
        var iconUrl = await storageRef.child(element.icon!).getDownloadURL();

         newItems.add(element.copyWith(icon: iconUrl));
      });
      return newItems;*/
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateCategory(CategoryEntity entity) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<List<CategoryEntity>> getRecommendedCategories({int limit = 10}) async {
    try {
      var response =
          await contents.orderBy('views', descending: true).limit(limit).get();
      var items = response.docs
          .map((e) => ContentEntity.fromJson(e))
          .toList(growable: true);
      var categoryIds = items.map((e) => e.categoryId).toSet().toList();

      var rCategoryList =
          await categories.where("id", whereIn: categoryIds).get();
      var categoryList = rCategoryList.docs
          .map((e) => CategoryEntity.fromJson(e))
          .toList(growable: true);
      return categoryList;
      // return getCategoryWithRealUrls(categoryList);
    } catch (e) {
      throw Exception(e);
    }
  }
}
