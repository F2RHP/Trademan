// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppColors {
  static Color kPrimaryColor = Color(0xFF4fc1b3);
  static Color kSecondaryColor = Color(0xFFf3f5f5);
  static Color kPrimaryLight = Color.fromARGB(255, 142, 221, 211);
  static Color kPrimaryDark = Color(0xFF1f302d);
  static Color red = Color(0xFFf2535b);
  static Color grey = Colors.grey;
  static Color greyLight = Colors.grey.shade300;
  static Color white = Colors.white;
  static Color blue = Colors.blue;
  static Color blueAccentShade700 = Colors.blueAccent.shade700;
  static Color black = Colors.black;
  static Color yellowDark = Color(0xFFFFB700);
}

class AppColorCode{
  static const MaterialColor appColorCode = MaterialColor(appColorCodePrimaryValue, <int, Color>{
    50: Color(0xFFEAF8F6),
    100: Color(0xFFCAECE8),
    200: Color(0xFFA7E0D9),
    300: Color(0xFF84D4CA),
    400: Color(0xFF69CABE),
    500: Color(appColorCodePrimaryValue),
    600: Color(0xFF48BBAC),
    700: Color(0xFF3FB3A3),
    800: Color(0xFF36AB9A),
    900: Color(0xFF269E8B),
  });
  static const int appColorCodePrimaryValue = 0xFF4FC1B3;

  static const MaterialColor appColorCodeAccent = MaterialColor(_appcolorcodeAccentValue, <int, Color>{
    100: Color(0xFFDDFFF9),
    200: Color(_appcolorcodeAccentValue),
    400: Color(0xFF77FFE8),
    700: Color(0xFF5DFFE3),
  });
  static const int _appcolorcodeAccentValue = 0xFFAAFFF0;
}
