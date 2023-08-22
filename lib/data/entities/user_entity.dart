import 'dart:convert';

/// added_on : 4554545454
/// bio : ""
/// city : ""
/// contents : ["","",""]
/// country : ""
/// course : ""
/// current_balance : 1411.02
/// dob : "dd-MM-yyyy"
/// email : "example@gamil.com"
/// favourites : ["","",""]
/// gender : "MALE"
/// is_active : true
/// occupation : ""
/// payment_details : ""
/// phone : "77474878787"
/// profile_url : ""
/// school : ""
/// state : ""
/// updated_on : 5455445454
/// user_id : ""
/// user_name : ""
/// website : ""

UserEntity userEntityFromJson(String str) =>
    UserEntity.fromJson(json.decode(str));

String userEntityToJson(UserEntity data) => json.encode(data.toJson());

class UserEntity {
  UserEntity(
      {num? addedOn,
      String? bio,
      String? city,
      List<String>? contents,
      String? country,
      String? course,
      num? currentBalance,
      String? dob,
      String? email,
      List<String>? favourites,
      String? gender,
      bool? isActive,
      String? occupation,
      String? paymentDetails,
      String? phone,
      String? profileUrl,
      String? school,
      String? state,
      num? updatedOn,
      String? userId,
      String? userName,
      String? website,
      String? name,
      String? localProfile,
      }) {
    _addedOn = addedOn;
    _bio = bio;
    _city = city;
    _contents = contents;
    _country = country;
    _course = course;
    _currentBalance = currentBalance;
    _dob = dob;
    _email = email;
    _favourites = favourites;
    _gender = gender;
    _isActive = isActive;
    _occupation = occupation;
    _paymentDetails = paymentDetails;
    _phone = phone;
    _profileUrl = profileUrl;
    _school = school;
    _state = state;
    _updatedOn = updatedOn;
    _userId = userId;
    _userName = userName;
    _website = website;
    _name = name;
    _localProfile = localProfile;
  }

  UserEntity.fromJson(dynamic json) {
    _addedOn = json['added_on'];
    _bio = json['bio'];
    _city = json['city'];
    _contents = json['contents'] != null ? json['contents'].cast<String>() : [];
    _country = json['country'];
    _course = json['course'];
    _currentBalance = json['current_balance'];
    _dob = json['dob'];
    _email = json['email'];
    _favourites =
        json['favourites'] != null ? json['favourites'].cast<String>() : [];
    _gender = json['gender'];
    _isActive = json['is_active'];
    _occupation = json['occupation'];
    _paymentDetails = json['payment_details'];
    _phone = json['phone'];
    _profileUrl = json['profile_url'];
    _school = json['school'];
    _state = json['state'];
    _updatedOn = json['updated_on'];
    _userId = json['user_id'];
    _userName = json['user_name'];
    _website = json['website'];
    _name = json['name'];
  }

  num? _addedOn;
  String? _bio;
  String? _city;
  List<String>? _contents;
  String? _country;
  String? _course;
  num? _currentBalance;
  String? _dob;
  String? _email;
  List<String>? _favourites;
  String? _gender;
  bool? _isActive;
  String? _occupation;
  String? _paymentDetails;
  String? _phone;
  String? _profileUrl;
  String? _school;
  String? _state;
  num? _updatedOn;
  String? _userId;
  String? _userName;
  String? _website;
  String? _name;
  String? _localProfile;

  UserEntity copyWith({
    num? addedOn,
    String? bio,
    String? city,
    List<String>? contents,
    String? country,
    String? course,
    num? currentBalance,
    String? dob,
    String? email,
    List<String>? favourites,
    String? gender,
    bool? isActive,
    String? occupation,
    String? paymentDetails,
    String? phone,
    String? profileUrl,
    String? school,
    String? state,
    num? updatedOn,
    String? userId,
    String? userName,
    String? website,
    String? name,
  }) =>
      UserEntity(
        addedOn: addedOn ?? _addedOn,
        bio: bio ?? _bio,
        city: city ?? _city,
        contents: contents ?? _contents,
        country: country ?? _country,
        course: course ?? _course,
        currentBalance: currentBalance ?? _currentBalance,
        dob: dob ?? _dob,
        email: email ?? _email,
        favourites: favourites ?? _favourites,
        gender: gender ?? _gender,
        isActive: isActive ?? _isActive,
        occupation: occupation ?? _occupation,
        paymentDetails: paymentDetails ?? _paymentDetails,
        phone: phone ?? _phone,
        profileUrl: profileUrl ?? _profileUrl,
        school: school ?? _school,
        state: state ?? _state,
        updatedOn: updatedOn ?? _updatedOn,
        userId: userId ?? _userId,
        userName: userName ?? _userName,
        website: website ?? _website,
        name: name ?? _name,
      );

  num? get addedOn => _addedOn;

  String? get bio => _bio;

  String? get city => _city;

  List<String>? get contents => _contents;

  String? get country => _country;

  String? get course => _course;

  num? get currentBalance => _currentBalance;

  String? get dob => _dob;

  String? get email => _email;

  List<String>? get favourites => _favourites;

  String? get gender => _gender;

  bool? get isActive => _isActive;

  String? get occupation => _occupation;

  String? get paymentDetails => _paymentDetails;

  String? get phone => _phone;

  String? get profileUrl => _profileUrl;

  String? get school => _school;

  String? get state => _state;

  num? get updatedOn => _updatedOn;

  String? get userId => _userId;

  String? get userName => _userName;

  String? get website => _website;

  String? get name => _name;
  String? get localProfile => _localProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['added_on'] = _addedOn;
    map['bio'] = _bio;
    map['city'] = _city;
    map['contents'] = _contents;
    map['country'] = _country;
    map['course'] = _course;
    map['current_balance'] = _currentBalance;
    map['dob'] = _dob;
    map['email'] = _email;
    map['favourites'] = _favourites;
    map['gender'] = _gender;
    map['is_active'] = _isActive;
    map['occupation'] = _occupation;
    map['payment_details'] = _paymentDetails;
    map['phone'] = _phone;
    map['profile_url'] = _profileUrl;
    map['school'] = _school;
    map['state'] = _state;
    map['updated_on'] = _updatedOn;
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['website'] = _website;
    map['name'] = _name;
    return map;
  }
}
