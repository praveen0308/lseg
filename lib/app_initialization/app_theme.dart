import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lseg/res/res.dart';


class AppTheme{
  static ThemeData getAppTheme(){
    return ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white

      ),
      textTheme: GoogleFonts.dmSansTextTheme(),
      primarySwatch: AppColors.primarySwatchColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.btnTextColor),
            backgroundColor:
            MaterialStateProperty.all<Color>(AppColors.primary),
            textStyle: MaterialStateProperty.all<TextStyle>(
                GoogleFonts.dmSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.btnTextColor)),
            fixedSize: MaterialStateProperty.all<Size>(
                const Size(double.maxFinite, 50)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(

        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            textStyle: MaterialStateProperty.all<TextStyle>(
                GoogleFonts.dmSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,)),
            fixedSize: MaterialStateProperty.all<Size>(
                const Size(double.maxFinite, 50)),
            side: MaterialStateProperty.all(
                const BorderSide(color: AppColors.primary,
                    width: 2)
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),

                ))),
      ),
    );
  }
}