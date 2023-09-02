import 'dart:async';

import 'package:lseg/data/data.dart';

abstract class ContentService {
  Future<ContentEntity?> uploadNewContent(ContentEntity contentEntity);

  Future<void> updateContentDetails(ContentEntity contentEntity);

  Future<void> deleteContent(String contentId);

  Future<List<ContentEntity>?> getContentByCategory(String categoryId);

  Future<List<ContentEntity>?> getTrendingContents({int limit = 10});

  Future<List<ContentEntity>?> getPopularContents({int limit = 10});

  Future<List<ContentEntity>?> getRecommendedContent(String userId);

  Future<List<ContentEntity>?> getRecommendedContentOfCategory(String categoryId,{int limit = 10});

  Future<List<ContentEntity>?> getContentByCreator(String userId);

  Future<List<ContentEntity>?> getContentByQuery(String query);

  Future<List<ContentEntity>?> getFavourites(List<String> ids);

  Future<List<ContentEntity>?> getPurchasedContents(List<String> ids);

  Future<ContentEntity?> getContentDetails(String contentId);

  Future<void> updateViewCount(String contentId);

  Future<void> updateContentReview(String contentId,ReviewEntity review);

  // TODO implement review content
  // TODO implement update purchase count
}
