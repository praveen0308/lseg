import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
/// id : "fsdfdfasd"
/// icon : ""
/// name : ""
/// is_active : true
/// order : 1

CategoryEntity categoryEntityFromJson(String str) => CategoryEntity.fromJson(json.decode(str));
String categoryEntityToJson(CategoryEntity data) => json.encode(data.toJson());
class CategoryEntity {
  CategoryEntity({
      String? id, 
      String? icon, 
      String? name, 
      bool? isActive, 
      num? order,}){
    _id = id;
    _icon = icon;
    _name = name;
    _isActive = isActive;
    _order = order;
}

  CategoryEntity.fromJson(dynamic json) {
    _id = json['id'] ?? "";
    _icon = (json as QueryDocumentSnapshot).data().toString().contains("icon") ? json['icon'] : "";
    _name = json['name'] ?? "";
    _isActive = (json).data().toString().contains("is_active") ? json['is_active'] : true;
    _order = (json).data().toString().contains("order") ? json['order'] : 0;
  }
  String? _id;
  String? _icon;
  String? _name;
  bool? _isActive;
  num? _order;
CategoryEntity copyWith({  String? id,
  String? icon,
  String? name,
  bool? isActive,
  num? order,
}) => CategoryEntity(  id: id ?? _id,
  icon: icon ?? _icon,
  name: name ?? _name,
  isActive: isActive ?? _isActive,
  order: order ?? _order,
);
  String? get id => _id;
  String? get icon => _icon;
  String? get name => _name;
  bool? get isActive => _isActive;
  num? get order => _order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['icon'] = _icon;
    map['name'] = _name;
    map['is_active'] = _isActive;
    map['order'] = _order;
    return map;
  }

}