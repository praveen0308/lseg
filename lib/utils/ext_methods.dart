import 'dart:io';
import 'dart:math';

import 'package:form_validator/form_validator.dart';

extension ListExtentions<T> on List<T> {
  String listToString() => join(',').toString();

}

extension CustomValidationBuilder on ValidationBuilder {
  password() => add((value) {
    if (value == 'password') {
      return 'Password should not "password"';
    }
    return null;
  });
}

extension FileExtensions on File{
  String getFileSizeString({int decimals = 0}) {
    const suffixes = ["b", "kb", "mb", "gb", "tb"];
    var i = (log(lengthSync()) / log(1024)).floor();
    return ((lengthSync() / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }

  String getFileName(){
    return path.split('/').last;
  }
}