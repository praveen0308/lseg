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

  UserModel(
      {this.addedOn,
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
      this.name});
}
