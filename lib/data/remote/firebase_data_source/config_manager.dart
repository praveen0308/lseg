import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:lseg/domain/domain.dart';

class ConfigManager{
  static final ConfigManager instance = ConfigManager._internal();
  factory ConfigManager() => instance;
  ConfigManager._internal();

  final remoteConfig = FirebaseRemoteConfig.instance;

  final _keyAppBanners = "app_banners";
  final _keyFaqs = "faqs";
  final _keyPrivacyPolicy = "privacy_policy";
  final _keyTermsNConditions = "terms_n_conditions";
  final _keyContactUs = "contact_us";

  List<String> fetchBanners(){
    var result = jsonDecode(remoteConfig.getString(_keyAppBanners));
    return List<String>.from(result);
  }

  List<FAQModel> fetchFaqs(){
    var result = jsonDecode(remoteConfig.getString(_keyFaqs));
    var faqs = List<FAQModel>.empty(growable: true);
    for(var e in result){
      faqs.add(FAQModel.fromMap(e));
    }
    return faqs;
  }

  ContactUsModel getContactUs(){
    var result = jsonDecode(remoteConfig.getString(_keyContactUs));
    return ContactUsModel.fromJson(result);
  }

  String getTermsNConditions(){
    var result = remoteConfig.getString(_keyTermsNConditions);
    return result;
  }
  String getPrivacyPolicy(){
    var result = remoteConfig.getString(_keyPrivacyPolicy);
    return result;
  }
}