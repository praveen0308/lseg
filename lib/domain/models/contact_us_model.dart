class ContactUsModel {
  ContactUsModel({
      this.phone, 
      this.email, 
      this.instagram, 
      this.twitter, 
      this.linkedin,});

  ContactUsModel.fromJson(dynamic json) {
    phone = json['phone'];
    email = json['email'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
  }
  String? phone;
  String? email;
  String? instagram;
  String? twitter;
  String? linkedin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['instagram'] = instagram;
    map['twitter'] = twitter;
    map['linkedin'] = linkedin;
    return map;
  }

}