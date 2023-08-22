import 'package:flutter/foundation.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/app_storage.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AppStorage appStorage;
  final AuthService _authService;

  AuthRepositoryImpl(this.appStorage, this._authService);

  @override
  Future<String?> loginUser() async {
    try {
      var response = await _authService.signInWithGoogle();
      appStorage.updateLoginState(true);
      if(response!=null){
        appStorage.updateUserData(response);
      }

      return response?.userId;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel?> registerUser(UserModel userModel) async {
    try {
      var entity = UserEntityMapper().fromDomain(userModel);
      await _authService.registerUser(entity!);

      appStorage.updateRegistrationState(true);
      appStorage.updateUserData(entity);

      return userModel;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Future<UserModel?> userExists(String uid) async {
    try {
      var response = await _authService.checkUserExists(uid);
      var userModel = UserEntityMapper().toDomain(response);
      if (response != null) {
        appStorage.updateRegistrationState(true);
        appStorage.updateUserData(response);
      }
      return userModel;
    } catch (e) {
      throw Future.error(e);
    }
  }

  @override
  Stream<String?> userLoggedIn() {
    return _authService.userLoggedIn().map((event) {
      appStorage.updateLoginState(true);
      if(event!=null) appStorage.updateUserData(event);
      event;
    });
  }
}
