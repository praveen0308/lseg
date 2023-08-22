import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';

class CategoryEntityMapper extends Mapper<CategoryEntity, CategoryModel> {
  @override
  CategoryEntity fromDomain(CategoryModel domain) {
    return CategoryEntity(
        id: domain.id,
        name: domain.name,
        icon: domain.icon,
        isActive: domain.isActive,
        order: domain.order);
  }

  @override
  CategoryModel toDomain(CategoryEntity entity) {
    return CategoryModel(
        id: entity.id,
        name: entity.name,
        icon: entity.icon,
        isActive: entity.isActive,
        order: entity.order);
  }
}
