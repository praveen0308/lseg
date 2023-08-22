import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/models/content_model.dart';

abstract class ContentRepository{
  Future<ContentModel?> uploadNewContent(ContentModel contentModel);

  Future<void> updateContentDetails(ContentModel contentModel);

  Future<void> deleteContent(String contentId);

  Future<List<ContentModel>> getContentByCategory(String categoryId);

  Future<List<ContentModel>> getTrendingContents();

  Future<List<ContentModel>> getPopularContents();

  Future<List<ContentModel>> getRecommendedContent(String userId);
  Future<List<ContentModel>> getRecommendedContentOfCategory(String categoryId);

  Future<List<ContentModel>> getContentByCreator({String? userId});

  Future<List<ContentModel>> getContentByQuery(String query);

  Future<List<ContentModel>> getFavourites();
  Future<List<ContentModel>> getPurchasedContents();

  Future<ContentModel?> getContentDetails(String contentId);
  Future<void> updateViewCount(String contentId);
  Future<void> updateContentReview(String contentId,ReviewModel review);

}