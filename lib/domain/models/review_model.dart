class ReviewModel {
  ReviewModel({
      this.userId, 
      this.name, 
      this.comment, 
      this.rating, 
      this.ratedOn,});

  String? userId;
  String? name;
  String? comment;
  num? rating;
  num? ratedOn;
ReviewModel copyWith({  String? userId,
  String? name,
  String? comment,
  num? rating,
  num? ratedOn,
}) => ReviewModel(  userId: userId ?? this.userId,
  name: name ?? this.name,
  comment: comment ?? this.comment,
  rating: rating ?? this.rating,
  ratedOn: ratedOn ?? this.ratedOn,
);

}