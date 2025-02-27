import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:sizer/sizer.dart';

import '../extensions/string_extensions.dart';
import '../prefs/pref_manager.dart';
import 'colors.dart';

class AppStyles {
  static LinearGradient linearColor = const LinearGradient(
    colors:
    [
      Color(0xFF4F2B7C),
      Color(0xFF52BEED),
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );
  static LinearGradient linearColor2 = const LinearGradient(
    colors: [
      Color(0xFF4F2B7C),
      Color(0xFFF8B817),
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );
  static LinearGradient linearColor3 = const LinearGradient(
    colors: [
      Color(0xFF4F2B7C),
      Color(0xFF34C759),
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );
  static LinearGradient linearColor4 = const LinearGradient(
    colors: [
      Color(0xFFEC6425),
      Color(0xFF34C759),
    ],
    stops: [0.0, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );
  static LinearGradient linearColor5 = LinearGradient(
    colors: [
      Colors.black.withOpacity(0.9),
      Colors.white.withOpacity(0.1),
    ],
    // stops: [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static LinearGradient linearColor6 = const LinearGradient(
    colors: [
      Color(0xFF4F2B7C),
      Color(0xFF7CDFEC),
      Color(0xFF52BEED),
    ],
    stops: [0.0, 0.5, 1.0],
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
  );




  static TextStyle get kTextStyle9 => TextStyle(
    color: Colors.black,
    fontSize:  9.sp,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle7 => TextStyle(
      color: Colors.black,
      fontSize:  7.sp ,
      fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle8 => TextStyle(
      color: Colors.black,
      fontSize:  8.sp,
      fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle10 => TextStyle(
    color: Colors.black,
    fontSize:  9.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle11 => TextStyle(
    color: Colors.black,
    fontSize: 10.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle12 => TextStyle(
    color: Colors.black,
    fontSize:   11.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle13 => TextStyle(
    color: Colors.black,
    fontSize:  12.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle14 => TextStyle(
    color: Colors.black,
    fontSize:   14.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle15 => TextStyle(
        color: Colors.black,
        fontSize: 15.sp  ,
        fontWeight: FontWeight.w400,
        fontFamily: "Taga"
      );
  static TextStyle get kTextStyle16 => TextStyle(
        color: Colors.black,
        fontSize: 16.sp ,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get kTextStyle18 => TextStyle(
        color: Colors.black,
        fontSize:  18.sp ,
        fontWeight: FontWeight.w400,
        fontFamily: "Taga"
  );
  static TextStyle get kTextStyle20 => TextStyle(
  color: Colors.black,
    fontSize:  20.sp ,
    fontWeight: FontWeight.w400,
        fontFamily: "Taga"

      );
  static TextStyle get kTextStyle22 => TextStyle(
        color: Colors.black,
        fontSize:  22.sp ,
        fontWeight: FontWeight.w400,
      fontFamily: "Taga"
      );
  static TextStyle get kTextStyle25 => TextStyle(
        color: Colors.black,
        fontSize:  25.sp,
        fontWeight: FontWeight.w400,
      fontFamily: "Taga"
      );
  static TextStyle get kTextStyle30 => TextStyle(
    color: Colors.black,
    fontSize:30.sp ,
    fontWeight: FontWeight.w400,
      fontFamily: "Taga"
  );
  static TextStyle get kTextStyle50 => TextStyle(
        color: Colors.black,
        fontSize: 50.sp,
        fontWeight: FontWeight.w400,
      fontFamily: "Taga"
      );
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: "Cairo",
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      scaffoldBackgroundColor:
          isDarkTheme ? const Color.fromRGBO(18, 18, 18, 1) : Colors.white,
      indicatorColor:
          isDarkTheme ? const Color(0xff0E1D36) : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor:
          isDarkTheme ? const Color(0xff372901) : const Color(0xffFCE192),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.light : Brightness.dark,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Colors.black : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
          fontWeight: FontWeight.w500,
          fontFamily: "Cairo",
          fontSize: 16.sp,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: (PrefManager.isDarkTheme ?? false)
              ? Brightness.light
              : Brightness.dark,
          statusBarColor:
              (PrefManager.isDarkTheme ?? false) ? Colors.black : Colors.white,
        ),
      ),
    );
  }
  static Theme getDatePickerTheme(child) => Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.kMainColor,
          colorScheme: const ColorScheme.light(
            primary: AppColors.kMainColor,
          ),
          buttonTheme: const ButtonThemeData(
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        child: child,
      );
}
