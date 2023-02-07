// ignore_for_file: must_be_immutable

import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String label;
  final Function() action;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double? height;
  const CustomBtn({
    required this.label,
    required this.action,
    this.color,
    this.width,
    this.height,
    this.textColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: action,
      splashColor: AppColors.kPrimaryLight,
      color: color ?? AppColors.kPrimaryLight,
      elevation: 0,
      height: height ?? 30,
      minWidth: width ?? Dimensions.calcH(120),
      shape: RoundedRectangleBorder(
        borderRadius: CustomBorderRadius.borderRadius8,
      ),
      child: CustomText(
        text: label.toUpperCase(),
        color: textColor ?? AppColors.kPrimaryDark,
        weight: FontWeight.bold,
        fontSize: Dimensions.calcH(17),
      ),
    );
  }
}
