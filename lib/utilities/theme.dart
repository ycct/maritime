import 'package:flutter/material.dart';

class CustomThemeData {
  static Color primaryColor = const Color(0xff000633);
  static Color primaryColorDark = const Color(0xff0B5CA4);
  static Color unselectedColor = const Color(0xff0279A7);
  static Color disabledColorDark = const Color(0xffF2F2F2);
  static Color iconColor = const Color(0xff60CB65);
  static Color dialogBackgroundColor = const Color(0xffFFFFFF);
  static Color disabledColor = const Color(0xffB8B8B8);
  static Color blackColor = const Color(0xff000000);
  static Color blackColorLight = const Color(0xff1e1e1e);
  static Color scaffoldBackgroundColor = const Color(0xff000633);
  static ThemeData customLightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    secondaryHeaderColor: iconColor,
    hintColor: disabledColorDark,
    dialogBackgroundColor: dialogBackgroundColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: blackColor,
      displayColor: blackColor,
    ),
  );
}
