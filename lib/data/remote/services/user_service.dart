import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/domain/models/pair.dart';

abstract class UserService {
  Future<void> updateUserProfile(UserEntity userEntity);

  Future<List<String>> addIntoFavourites(String userId, String contentId);

  Future<List<String>> removeFromFavourites(String userId, String contentId);

  Future<void> updateFavourites(String userId, List<String> favourites);

  Future<UserEntity> getCreatorDetails(
      String userId);
}
