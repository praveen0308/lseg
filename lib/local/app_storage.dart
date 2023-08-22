import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';
import 'package:lseg/local/app_login_state.dart';
import 'package:lseg/utils/utils.dart';

class AppStorage {
  final _storage = const FlutterSecureStorage();

  final _keyOnBoardingDone = "onBoardingDone";
  final _keyIsLoggedIn = "isLoggedIn";
  final _keyIsRegistered = "isRegistered";

  // UserData
  final _keyUserId = "userId";
  final _keyUserName = "userName";
  final _keyName = "name";
  final _keyPhone = "phone";
  final _keyEmail = "email";
  final _keyProfileUrl = "profileUrl";
  final _keyLocalProfilePath = "localProfilePath";
  final _keyFavourites = "favourites";
  final _keyContents = "contents";

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

  Future updateUserId(String? userId) async {
    await _storage.write(key: _keyUserId, value: userId);
  }

  Future<String> getUserID() async {
    var readData = await _storage.read(key: _keyUserId);
    return readData ?? "";
  }

  Future updateUserName(String? userName) async {
    await _storage.write(key: _keyUserName, value: userName);
  }

  Future<String> getUserName() async {
    var readData = await _storage.read(key: _keyUserName);
    return readData ?? "";
  }

  Future updateName(String? name) async {
    await _storage.write(key: _keyName, value: name);
  }

  Future<String> getName() async {
    var readData = await _storage.read(key: _keyName);
    return readData ?? "";
  }

  Future updateEmail(String? email) async {
    await _storage.write(key: _keyEmail, value: email);
  }

  Future<String> getEmail() async {
    var readData = await _storage.read(key: _keyEmail);
    return readData ?? "";
  }

  Future updatePhone(String? phone) async {
    await _storage.write(key: _keyPhone, value: phone);
  }

  Future<String> getPhone() async {
    var readData = await _storage.read(key: _keyPhone);
    return readData ?? "";
  }

  Future updateProfileUrl(String? url) async {
    await _storage.write(key: _keyProfileUrl, value: url);
  }

  Future<String> getProfileUrl() async {
    var readData = await _storage.read(key: _keyProfileUrl);
    return readData ?? "";
  }

  Future updateLocalProfilePath(String? url) async {
    await _storage.write(key: _keyLocalProfilePath, value: url);
  }

  Future<String> getLocalProfilePath() async {
    var readData = await _storage.read(key: _keyLocalProfilePath);
    return readData ?? "";
  }

// Favourite
  Future updateFavourites(List<String> ids) async {
    await _storage.write(key: _keyFavourites, value: ids.join(","));
  }

  Future addToFavourite(String id) async {
    var existingFavourites = await getFavourites();
    existingFavourites.add(id);
    await updateFavourites(existingFavourites);
  }

  Future removeFavourite(String id) async {
    var existingFavourites = await getFavourites();
    existingFavourites.removeWhere((item) => item == id);
    await updateFavourites(existingFavourites);
  }

  Future clearFavourites() async {
    await updateFavourites(List.empty());
  }

  Future<List<String>> getFavourites() async {
    var readData = await _storage.read(key: _keyFavourites);
    return readData?.split(",") ?? List.empty();
  }

  // Content

  Future updateContents(List<String> ids) async {
    await _storage.write(key: _keyContents, value: ids.join(","));
  }

  Future addIntoContents(String id) async {
    var existingContents = await getContents();
    existingContents.add(id);
    await updateContents(existingContents);
  }

  Future removeContent(String id) async {
    var existingContents = await getContents();
    existingContents.removeWhere((item) => item == id);
    await updateContents(existingContents);
  }

  Future clearContents() async {
    await updateContents(List.empty());
  }

  Future<List<String>> getContents() async {
    var readData = await _storage.read(key: _keyContents);
    return readData?.split(",") ?? List.empty();
  }

  Future<void> updateUserData(UserEntity user) async {
    await updateUserId(user.userId);
    await updateUserName(user.userName);
    await updateName(user.name);
    await updateEmail(user.email);
    await updatePhone(user.phone);
    await updateProfileUrl(user.profileUrl);
    await updateLocalProfilePath(user.localProfile);
    await updateFavourites(user.favourites ?? List.empty());
    await updateContents(user.contents ?? List.empty());
  }

  Future<UserEntity> getUserData() async {
    var localProfile = await getLocalProfilePath();
    var profileUrl = await getProfileUrl();

    UserEntity userModel = UserEntity(
      userId : await getUserID(),
      userName : await getUserName(),
      name : await getName(),
      email : await getEmail(),
      phone : await getPhone(),
      profileUrl : profileUrl,
      localProfile: localProfile,
      favourites : await getFavourites(),
      contents : await getContents(),
    );


    return userModel;
  }

  Future<AppLoginState> getUserLoginState() async {
    var userId = await _storage.read(key: _keyUserId) ?? "";
    var onBoardingDone = await getOnBoardingDoneState();
    var loggedIn = await getLoginState();
    var registered = await getRegistrationState();

    return AppLoginState(userId, onBoardingDone, loggedIn, registered);
  }
}
