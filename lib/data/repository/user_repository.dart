import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/models/pair.dart';

abstract class UserRepository{
  Future<UserModel?> fetchUserData();
  Future<void> updateUserProfile(UserModel userModel);
  Future<void> addIntoFavourites(String contentId);
  Future<void> removeFromFavourites(String contentId);
  Future<Pair<UserModel, List<ContentModel>>?> fetchCreatorProfile(String creatorId);
}