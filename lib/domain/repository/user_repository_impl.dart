import 'package:flutter/foundation.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/data/remote/services/content_service.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/mapper/content_entity_mapper.dart';
import 'package:lseg/domain/models/pair.dart';
import 'package:lseg/local/app_storage.dart';

class UserRepositoryImpl extends UserRepository {
  final AppStorage _appStorage;
  final UserService _userService;
  final ContentService _contentService;

  UserRepositoryImpl(this._appStorage, this._userService, this._contentService);

  Future<ContentEntityMapper> getContentEntityMapper() async {
    var mapper = ContentEntityMapper(_appStorage);
    await mapper.initMapper();
    return mapper;
  }

  @override
  Future<UserModel?> fetchUserData() async {
    try {
      var userData = await _appStorage.getUserData();
      return UserEntityMapper().toDomain(userData);
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<void> updateUserProfile(UserModel userModel) async {
    try {
      var entity = UserEntityMapper().fromDomain(userModel);
      await _userService.updateUserProfile(entity!);
      _appStorage.updateUserData(entity);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> addIntoFavourites(String contentId) async {
    try {
      var userId = await _appStorage.getUserID();
      var favourites = await _appStorage.getFavourites();
      favourites.add(contentId);
      await _userService.updateFavourites(userId, favourites);
      await _appStorage.updateFavourites(favourites);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<void> removeFromFavourites(String contentId) async {
    try {
      var userId = await _appStorage.getUserID();
      var favourites = await _appStorage.getFavourites();
      favourites.remove(contentId);
      await _userService.updateFavourites(userId, favourites);
      await _appStorage.updateFavourites(favourites);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<Pair<UserModel, List<ContentModel>>?> fetchCreatorProfile(
      String creatorId) async {
    try {
      var rUser = await _userService.getCreatorDetails(creatorId);
      var rContents = await _contentService.getContentByCreator(creatorId);
      if (rContents != null) {
        var mapper = await getContentEntityMapper();
        return Pair(UserEntityMapper().toDomain(rUser)!,
            rContents.map((e) => mapper.toDomain(e)).toList());
      } else {
        return Pair(UserEntityMapper().toDomain(rUser)!, List.empty());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
