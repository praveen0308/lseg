import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lseg/local/app_login_state.dart';


class AppStorage {
  final _storage = const FlutterSecureStorage();

  final _keyUserId = "onBoardingDone";
  final _keyOnBoardingDone = "onBoardingDone";
  final _keyIsLoggedIn = "isLoggedIn";
  final _keyIsRegistered = "isRegistered";


  final _mTrue = "1";
  final _mFalse = "0";

  Future updateOnBoardingDoneState(bool status) async {
    await _storage.write(key: _keyOnBoardingDone, value: status ? "1" : "0");
  }

  Future<bool> getOnBoardingDoneState() async {
    var readData = await _storage.read(key: _keyOnBoardingDone);
    return readData == _mTrue;
  }

  Future updateLoginState(bool status) async {
    await _storage.write(key: _keyIsLoggedIn, value: status ? "1" : "0");
  }

  Future<bool> getLoginState() async {
    var readData = await _storage.read(key: _keyIsLoggedIn);
    return readData == _mTrue;
  }

  Future updateRegistrationState(bool status) async {
    await _storage.write(key: _keyIsRegistered, value: status ? "1" : "0");
  }

  Future<bool> getRegistrationState() async {
    var readData = await _storage.read(key: _keyIsRegistered);
    return readData == _mTrue;
  }


  Future<AppLoginState> getUserLoginState() async {
    var userId = await _storage.read(key: _keyUserId) ?? "";
    var onBoardingDone = await getOnBoardingDoneState();
    var loggedIn = await getLoginState();
    var registered = await getRegistrationState();

    return AppLoginState(userId, onBoardingDone, loggedIn, registered);
  }
}
