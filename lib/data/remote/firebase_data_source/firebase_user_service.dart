import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lseg/data/data.dart';

import 'firestore_config.dart';

class FirebaseUserService extends UserService {
  final users = FirebaseFirestore.instance.collection(userCollection);

  @override
  Future<void> updateUserProfile(UserEntity userEntity) {
    return users
        .doc(userEntity.userId)
        .update(userEntity.toJson())
        .then((value) => print("User profile updated successfully!!!"));
  }

  @override
  Future<List<String>> addIntoFavourites(String userId, String contentId) async{
    try {
      var response = await users.doc(userId).get();
      var user = UserEntity.fromJson(response);
      List<String> favourites = user.favourites ?? [];
      favourites.add(contentId);
      await users.doc(userId).update({"favourites" : favourites});
      return favourites;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<String>> removeFromFavourites(String userId, String contentId) async {
    try {
      var response = await users.doc(userId).get();
      var user = UserEntity.fromJson(response);
      List<String> favourites = user.favourites ?? [];
      favourites.remove(contentId);
      await users.doc(userId).update({"favourites" : favourites});
      return favourites;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> updateFavourites(String userId, List<String> favourites) async {
    try {
      await users.doc(userId).update({"favourites" : favourites});
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserEntity> getCreatorDetails(String userId) async {
    try {
      var response = await users.doc(userId).get();
      var user = UserEntity.fromJson(response);
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

}
