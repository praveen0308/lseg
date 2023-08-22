import 'dart:convert';
/// user_id : ""
/// name : ""
/// comment : ""
/// rating : 5
/// rated_on : 45454544545454

ReviewEntity reviewEntityFromJson(String str) => ReviewEntity.fromJson(json.decode(str));
String reviewEntityToJson(ReviewEntity data) => json.encode(data.toJson());
class ReviewEntity {
  ReviewEntity({
      String? userId, 
      String? name, 
      String? comment, 
      num? rating, 
      num? ratedOn,}){
    _userId = userId;
    _name = name;
    _comment = comment;
    _rating = rating;
    _ratedOn = ratedOn;
}

  ReviewEntity.fromJson(dynamic json) {
    _userId = json['user_id'];
    _name = json['name'];
    _comment = json['comment'];
    _rating = json['rating'];
    _ratedOn = json['rated_on'];
  }
  String? _userId;
  String? _name;
  String? _comment;
  num? _rating;
  num? _ratedOn;
ReviewEntity copyWith({  String? userId,
  String? name,
  String? comment,
  num? rating,
  num? ratedOn,
}) => ReviewEntity(  userId: userId ?? _userId,
  name: name ?? _name,
  comment: comment ?? _comment,
  rating: rating ?? _rating,
  ratedOn: ratedOn ?? _ratedOn,
);
  String? get userId => _userId;
  String? get name => _name;
  String? get comment => _comment;
  num? get rating => _rating;
  num? get ratedOn => _ratedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['name'] = _name;
    map['comment'] = _comment;
    map['rating'] = _rating;
    map['rated_on'] = _ratedOn;
    return map;
  }

}