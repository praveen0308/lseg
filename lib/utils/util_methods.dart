import 'dart:math';


import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilMethods {
  static showToast(String msg, ToastType type) {
    var bgColor = Colors.grey;
    var txtColor = Colors.black;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        txtColor = Colors.white;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        txtColor = Colors.white;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        txtColor = Colors.white;
        break;
      case ToastType.info:
        bgColor = Colors.grey;
        txtColor = Colors.black;
        break;
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: txtColor,
        fontSize: 16.0);
  }

  static int generateRandomNo(int noOfDigits){
    var rng = Random();
    var code = rng.nextInt(9*pow(10, noOfDigits-1).toInt()) + pow(10, noOfDigits).toInt();

    return code;
  }

}

extension ExtMethos on State {
  showToast(String msg, ToastType type) {
    var bgColor = Colors.white12;
    var txtColor = Colors.black;

    switch (type) {
      case ToastType.success:
        bgColor = Colors.green;
        txtColor = Colors.white;
        break;
      case ToastType.error:
        bgColor = Colors.red;
        txtColor = Colors.white;
        break;
      case ToastType.warning:
        bgColor = Colors.orange;
        txtColor = Colors.white;
        break;
      case ToastType.info:
        bgColor = Colors.white;
        txtColor = Colors.black;
        break;
    }

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: bgColor,
        textColor: txtColor,
        fontSize: 16.0);
  }


}
bool validateEmail(String email){
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}


enum ToastType { success, error, warning, info }


class LauncherUtils {

  static Future<void> openMap(String address) async {
    Uri uri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);

    } else {
      throw 'Could not open the map.';
    }
  }

  static Future<void> openSMS(String msg) async {
    Uri uri = Uri.parse('sms:$msg');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);

    } else {
      throw 'Could not perform sms.';
    }
  }

  static Future<void> openPhone(String number) async {
    Uri uri = Uri.parse('tel:$number');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);

    } else {
      throw 'Could not call.';
    }
  }

  static Future<void> openEmail(String emailId,String subject,String body) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailId,
      query: encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );
    Uri uri = Uri.parse('mailto:$emailId?subject=$subject&body=$body');
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);

    } else {
      throw 'Could not open the email.';
    }
  }

  static String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  static Future<void> openWebsite(String url) async {
    Uri uri = Uri.parse('https://$url');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);

    } else {
      throw 'Could not open the website.';
    }
  }



}
extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but the callback has index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(int i,E e) f) {
    var i = 0;
    forEach((e) => f(i++,e));
  }
}