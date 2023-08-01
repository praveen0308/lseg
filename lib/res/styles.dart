import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import 'dimens.dart';
import 'colors.dart';
import 'fonts.dart';

class AppStyle{
  static TextStyle primaryBtnTextStyle = TextStyle(
    fontFamily: AppFonts.dmSans,
    fontSize: AppDimens.btnTextSize,
    fontWeight: FontWeight.bold,
    color: AppColors.btnTextColor
  );

  static TextStyle secondaryBtnTextStyle = TextStyle(
      fontFamily: AppFonts.dmSans,
      fontSize: AppDimens.btnTextSize,
      fontWeight: FontWeight.bold,
      color: AppColors.btnTextColor
  );

}