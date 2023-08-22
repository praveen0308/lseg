
import 'package:lseg/data/data.dart';

abstract class AuthService{

  Stream<UserEntity?> userLoggedIn();

  Future<UserEntity?> signInWithGoogle();

  Future<UserEntity?> checkUserExists(String uid);

  Future<void> registerUser(UserEntity userEntity);
}