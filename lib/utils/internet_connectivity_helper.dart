import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class InternetConnectivityHelper {
  static Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
