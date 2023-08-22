import 'package:lseg/data/entities/review_entity.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/models/review_model.dart';

class ReviewEntityMapper extends Mapper<ReviewEntity,ReviewModel>{
  @override
  ReviewEntity fromDomain(ReviewModel domain) {
    return ReviewEntity(
      userId: domain.userId,
      name: domain.name,
      comment: domain.comment,
      rating: domain.rating,
      ratedOn: domain.ratedOn
    );
  }

  @override
  ReviewModel toDomain(ReviewEntity entity) {
    return ReviewModel(
      userId: entity.userId,
      name: entity.name,
      comment: entity.comment,
      rating: entity.rating,
      ratedOn: entity.ratedOn
    );
  }
}