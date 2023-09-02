import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable{
  CategoryModel({
    this.id,
    this.icon,
    this.name,
    this.isActive,
    this.order,
  });

  String? id;
  String? icon;
  String? name;
  bool? isActive;
  num? order;

  @override
  String toString() {
    return name.toString();
  }

  CategoryModel copyWith({
    String? id,
    String? icon,
    String? name,
    bool? isActive,
    num? order,
  }) =>
      CategoryModel(
        id: id ?? this.id,
        icon: icon ?? this.icon,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        order: order ?? this.order,
      );

  @override
  List<Object?> get props => [id];
}
