import 'dart:convert';

import 'package:lseg/data/entities/content_data_entity.dart';
import 'package:lseg/data/entities/review_entity.dart';
/// title : "Course 110"
/// subtitle : "Course 110"
/// format : "Computerized/Handwritten"
/// category_id : "112544"
/// category : "Category 1"
/// content_id : "abccedfsa"
/// creator_id : "Course 110"
/// creator : "User Name"
/// creator_username : "@username"
/// description : "Course 110"
/// is_paid : true
/// price : 1000.0
/// content_url : "pdf link"
/// audio_url : "audio_link"
/// thumbnail_url : "thumnail_link"
/// reviews : [{"user_id":"","name":"","comment":"","rating":5,"rated_on":45454544545454}]
/// added_on : 454545454
/// updated_on : 445445454
/// purchase_count : 555
/// views : 55
/// watch_time : 4545454545454
/// is_active : true

ContentEntity contentEntityFromJson(String str) => ContentEntity.fromJson(json.decode(str));
String contentEntityToJson(ContentEntity data) => json.encode(data.toJson());
class ContentEntity {
  ContentEntity({
      String? title, 
      String? subtitle, 
      String? format, 
      String? categoryId, 
      String? category, 
      String? contentId, 
      String? creatorId, 
      String? creator, 
      String? creatorUsername, 
      String? description, 
      bool? isPaid, 
      num? price,
      ContentDataEntity? contentData,
      List<ReviewEntity>? reviews,
      num? addedOn, 
      num? updatedOn, 
      num? purchaseCount, 
      num? views, 
      num? watchTime, 
      bool? isActive,}){
    _title = title;
    _subtitle = subtitle;
    _format = format;
    _categoryId = categoryId;
    _category = category;
    _contentId = contentId;
    _creatorId = creatorId;
    _creator = creator;
    _creatorUsername = creatorUsername;
    _description = description;
    _isPaid = isPaid;
    _price = price;
    _contentData = contentData;
    _reviews = reviews;
    _addedOn = addedOn;
    _updatedOn = updatedOn;
    _purchaseCount = purchaseCount;
    _views = views;
    _watchTime = watchTime;
    _isActive = isActive;
}

  ContentEntity.fromJson(dynamic json) {
    _title = json['title'];
    _subtitle = json['subtitle'];
    _format = json['format'];
    _categoryId = json['category_id'];
    _category = json['category'];
    _contentId = json['content_id'];
    _creatorId = json['creator_id'];
    _creator = json['creator'];
    _creatorUsername = json['creator_username'];
    _description = json['description'];
    _isPaid = json['is_paid'];
    _price = json['price'];
    _contentData = ContentDataEntity.fromJson(json['content_data']);
    if(json.data().toString().contains("review")){
      if (json['reviews'] != null) {
        _reviews = [];
        json['reviews'].forEach((v) {
          _reviews?.add(ReviewEntity.fromJson(v));
        });
      }
    }

    _addedOn = json['added_on'];
    _updatedOn = json['updated_on'];
    _purchaseCount = json['purchase_count'];
    _views = json['views'];
    _watchTime = json['watch_time'];
    _isActive = json['is_active'];
  }
  String? _title;
  String? _subtitle;
  String? _format;
  String? _categoryId;
  String? _category;
  String? _contentId;
  String? _creatorId;
  String? _creator;
  String? _creatorUsername;
  String? _description;
  bool? _isPaid;
  num? _price;
  ContentDataEntity? _contentData;
  List<ReviewEntity>? _reviews;
  num? _addedOn;
  num? _updatedOn;
  num? _purchaseCount;
  num? _views;
  num? _watchTime;
  bool? _isActive;
ContentEntity copyWith({  String? title,
  String? subtitle,
  String? format,
  String? categoryId,
  String? category,
  String? contentId,
  String? creatorId,
  String? creator,
  String? creatorUsername,
  String? description,
  bool? isPaid,
  num? price,
  ContentDataEntity? contentData,
  List<ReviewEntity>? reviews,
  num? addedOn,
  num? updatedOn,
  num? purchaseCount,
  num? views,
  num? watchTime,
  bool? isActive,
}) => ContentEntity(  title: title ?? _title,
  subtitle: subtitle ?? _subtitle,
  format: format ?? _format,
  categoryId: categoryId ?? _categoryId,
  category: category ?? _category,
  contentId: contentId ?? _contentId,
  creatorId: creatorId ?? _creatorId,
  creator: creator ?? _creator,
  creatorUsername: creatorUsername ?? _creatorUsername,
  description: description ?? _description,
  isPaid: isPaid ?? _isPaid,
  price: price ?? _price,
  contentData: contentData ?? _contentData,
  reviews: reviews ?? _reviews,
  addedOn: addedOn ?? _addedOn,
  updatedOn: updatedOn ?? _updatedOn,
  purchaseCount: purchaseCount ?? _purchaseCount,
  views: views ?? _views,
  watchTime: watchTime ?? _watchTime,
  isActive: isActive ?? _isActive,
);
  String? get title => _title;
  String? get subtitle => _subtitle;
  String? get format => _format;
  String? get categoryId => _categoryId;
  String? get category => _category;
  String? get contentId => _contentId;
  String? get creatorId => _creatorId;
  String? get creator => _creator;
  String? get creatorUsername => _creatorUsername;
  String? get description => _description;
  bool? get isPaid => _isPaid;
  num? get price => _price;
  ContentDataEntity? get contentData => _contentData;
  List<ReviewEntity>? get reviews => _reviews;
  num? get addedOn => _addedOn;
  num? get updatedOn => _updatedOn;
  num? get purchaseCount => _purchaseCount;
  num? get views => _views;
  num? get watchTime => _watchTime;
  bool? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['subtitle'] = _subtitle;
    map['format'] = _format;
    map['category_id'] = _categoryId;
    map['category'] = _category;
    map['content_id'] = _contentId;
    map['creator_id'] = _creatorId;
    map['creator'] = _creator;
    map['creator_username'] = _creatorUsername;
    map['description'] = _description;
    map['is_paid'] = _isPaid;
    map['price'] = _price;
    if(_contentData!=null){
      map['content_data'] = _contentData!.toJson();
    }

    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['added_on'] = _addedOn;
    map['updated_on'] = _updatedOn;
    map['purchase_count'] = _purchaseCount;
    map['views'] = _views;
    map['watch_time'] = _watchTime;
    map['is_active'] = _isActive;
    return map;
  }

}
