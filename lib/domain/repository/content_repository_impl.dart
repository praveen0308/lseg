import 'package:lseg/data/data.dart';
import 'package:lseg/data/remote/services/content_service.dart';
import 'package:lseg/domain/mapper/content_entity_mapper.dart';
import 'package:lseg/domain/mapper/review_entity_mapper.dart';
import 'package:lseg/domain/models/content_model.dart';
import 'package:lseg/domain/models/review_model.dart';
import 'package:lseg/local/local.dart';

class ContentRepositoryImpl extends ContentRepository {
  final ContentService _contentService;
  final AppStorage _appStorage;

  ContentRepositoryImpl(this._contentService, this._appStorage);

  Future<ContentEntityMapper> getContentEntityMapper() async {
    var mapper = ContentEntityMapper(_appStorage);
    await mapper.initMapper();
    return mapper;
  }

  @override
  Future<void> deleteContent(String contentId) async {
    try {
      await _contentService.deleteContent(contentId);
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<List<ContentModel>> getContentByCategory(String categoryId) async {
    try {
      var response = await _contentService.getContentByCategory(categoryId);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getContentByCreator({String? userId}) async {
    userId ??= await _appStorage.getUserID();
    try {
      var response = await _contentService.getContentByCreator(userId);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getContentByQuery(String query) async {
    try {
      var response = await _contentService.getContentByQuery(query);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<ContentModel?> getContentDetails(String contentId) {
    // TODO: implement getContentDetails
    throw UnimplementedError();
  }

  @override
  Future<List<ContentModel>> getFavourites() async {
    try {
      var favourites = await _appStorage.getFavourites();
      var response = await _contentService.getFavourites(favourites);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getPurchasedContents() async {
    try {
      var contents = await _appStorage.getContents();
      var response = await _contentService.getPurchasedContents(contents);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }


  @override
  Future<List<ContentModel>> getRecommendedContent(String userId) async {
    try {
      var response = await _contentService.getRecommendedContent(userId);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getRecommendedContentOfCategory(
      String categoryId,{int limit = 10}) async {
    try {
      var response =
          await _contentService.getRecommendedContentOfCategory(categoryId,limit: limit);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getTrendingContents({int limit = 10}) async {
    try {
      var response = await _contentService.getTrendingContents(limit: limit);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<List<ContentModel>> getPopularContents({int limit = 10}) async {
    try {
      var response = await _contentService.getPopularContents(limit: limit);
      if (response != null) {
        var mapper = await getContentEntityMapper();
        return response.map((e) => mapper.toDomain(e)).toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      print(e);
      return List.empty();
    }
  }

  @override
  Future<void> updateContentDetails(ContentModel contentModel) async {
    try {
      await _contentService.updateContentDetails(
          ContentEntityMapper(_appStorage).fromDomain(contentModel));
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<ContentModel?> uploadNewContent(ContentModel contentModel) async {
    try {
      var userData = await _appStorage.getUserData();
      contentModel.creator = userData.name;
      contentModel.creatorId = userData.userId;
      contentModel.creatorUsername = userData.userName;
      contentModel.addedOn = DateTime.now().millisecondsSinceEpoch;
      contentModel.updatedOn = DateTime.now().millisecondsSinceEpoch;
      contentModel.views = 0;
      contentModel.purchaseCount = 0;
      contentModel.watchTime = 0;
      contentModel.isActive = true;
      var mapper = ContentEntityMapper(_appStorage);
      await mapper.initMapper();
      var response = await _contentService.uploadNewContent(
          mapper.fromDomain(contentModel));

      return mapper.toDomain(response);
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<void> updateViewCount(String contentId) async {
    try {
      return await _contentService.updateViewCount(contentId);
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Future<void> updateContentReview(String contentId, ReviewModel review) async {
    try {

      review.userId = await _appStorage.getUserID();
      review.name = await _appStorage.getName();
      review.ratedOn = DateTime.now().millisecondsSinceEpoch;
      await _contentService.updateContentReview(contentId,ReviewEntityMapper().fromDomain(review));
    } catch (e) {
      throw Future.error(e);
    }
  }
}
