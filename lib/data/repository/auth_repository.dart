import 'package:lseg/data/entities/user_entity.dart';
import 'package:lseg/domain/models/models.dart';

abstract class AuthRepository{
  Stream<String?> userLoggedIn();
  Future<String?> loginUser();
  Future<UserModel?> userExists(String uid);
  Future<UserModel?> registerUser(UserModel userModel);
}