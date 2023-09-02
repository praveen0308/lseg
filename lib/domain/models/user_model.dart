class UserModel {
  num? addedOn;
  String? bio;
  String? city;
  List<String>? contentIds;
  String? country;
  String? course;
  num? currentBalance;
  DateTime? dob;
  String? email;
  List<String>? favourites;
  String? gender;
  bool? isActive;
  String? occupation;
  String? paymentDetails;
  String? phone;
  String? profileUrl;
  String? localProfile;
  String? school;
  String? state;
  num? updatedOn;
  String? userId;
  String? userName;
  String? website;
  String? name;

//<editor-fold desc="Data Methods">
  UserModel({
    this.addedOn,
    this.bio,
    this.city,
    this.contentIds,
    this.country,
    this.course,
    this.currentBalance,
    this.dob,
    this.email,
    this.favourites,
    this.gender,
    this.isActive,
    this.occupation,
    this.paymentDetails,
    this.phone,
    this.profileUrl,
    this.localProfile,
    this.school,
    this.state,
    this.updatedOn,
    this.userId,
    this.userName,
    this.website,
    this.name,
  });

  @override
  String toString() {
    return 'UserModel{' +
        ' addedOn: $addedOn,' +
        ' bio: $bio,' +
        ' city: $city,' +
        ' contentIds: $contentIds,' +
        ' country: $country,' +
        ' course: $course,' +
        ' currentBalance: $currentBalance,' +
        ' dob: $dob,' +
        ' email: $email,' +
        ' favourites: $favourites,' +
        ' gender: $gender,' +
        ' isActive: $isActive,' +
        ' occupation: $occupation,' +
        ' paymentDetails: $paymentDetails,' +
        ' phone: $phone,' +
        ' profileUrl: $profileUrl,' +
        ' localProfile: $localProfile,' +
        ' school: $school,' +
        ' state: $state,' +
        ' updatedOn: $updatedOn,' +
        ' userId: $userId,' +
        ' userName: $userName,' +
        ' website: $website,' +
        ' name: $name,' +
        '}';
  }

  UserModel copyWith({
    num? addedOn,
    String? bio,
    String? city,
    List<String>? contentIds,
    String? country,
    String? course,
    num? currentBalance,
    DateTime? dob,
    String? email,
    List<String>? favourites,
    String? gender,
    bool? isActive,
    String? occupation,
    String? paymentDetails,
    String? phone,
    String? profileUrl,
    String? localProfile,
    String? school,
    String? state,
    num? updatedOn,
    String? userId,
    String? userName,
    String? website,
    String? name,
  }) {
    return UserModel(
      addedOn: addedOn ?? this.addedOn,
      bio: bio ?? this.bio,
      city: city ?? this.city,
      contentIds: contentIds ?? this.contentIds,
      country: country ?? this.country,
      course: course ?? this.course,
      currentBalance: currentBalance ?? this.currentBalance,
      dob: dob ?? this.dob,
      email: email ?? this.email,
      favourites: favourites ?? this.favourites,
      gender: gender ?? this.gender,
      isActive: isActive ?? this.isActive,
      occupation: occupation ?? this.occupation,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      phone: phone ?? this.phone,
      profileUrl: profileUrl ?? this.profileUrl,
      localProfile: localProfile ?? this.localProfile,
      school: school ?? this.school,
      state: state ?? this.state,
      updatedOn: updatedOn ?? this.updatedOn,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      website: website ?? this.website,
      name: name ?? this.name,
    );
  }

}
