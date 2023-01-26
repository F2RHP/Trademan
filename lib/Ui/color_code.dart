import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorCode {

  static Color backgroundColor = const Color(0xFF53A687);
  static Color favouriteColor = const Color(0xFFF08484);
  static Color starColor = const Color(0xFFF2B885);
  static Color shadowColor = const Color(0xFF53A687);
  static Color lightBackground = const Color(0xFFE8FAF4);
  static Color darkYellow = const Color(0xFFC1D96C);
  static Color lightYellow = const Color(0xFFDEF294);
  static Color white = Colors.white;
}

class CommonCode {
  static BoxShadow shadowColor = BoxShadow(
    color: ColorCode.shadowColor.withAlpha(100),
    offset: const Offset(2, 8),
    blurRadius: 18.0,
  );
  static BoxShadow shadowRadiusColor = BoxShadow(
    color: ColorCode.shadowColor.withAlpha(100),
    offset: const Offset(2, 8),
    blurRadius: 8.0,
  );
}
