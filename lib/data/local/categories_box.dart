import 'package:hive/hive.dart';
import 'package:lseg/data/data.dart';

class CategoriesBox {
  CategoriesBox();

  static String boxName = "categories";

  Future<void> addAll(List<CategoryEntity> categories) async {
    final box = await Hive.openBox(boxName);
    categories.forEach((element) async {
      await box.put(element.id.toString(), element.toJson());
    });

    await box.close();
  }

  Future<List<CategoryEntity>> readAll() async {
    final box = await Hive.openBox(boxName);

    var categories = box.values.map((e) => CategoryEntity.fromCacheJson(e)).toList();

    await box.close();
    return categories;
  }

  Future<void> clear() async {
    final box = await Hive.openBox(boxName);
    await box.clear();
    await box.close();
  }
}
