import 'package:flutter/material.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/constants/strings.dart';

class CustomBorderRadius {
  static BorderRadius borderRadius5 = BorderRadius.circular(5.0);
  static BorderRadius borderRadius8 = BorderRadius.circular(8.0);
  static BorderRadius borderRadius10 = BorderRadius.circular(10.0);
  static BorderRadius borderRadius12 = BorderRadius.circular(12.0);
  static BorderRadius borderRadius13 = BorderRadius.circular(13.0);
  static BorderRadius borderRadius14 = BorderRadius.circular(14.0);
  static BorderRadius borderRadius15 = BorderRadius.circular(15.0);
  static BorderRadius borderRadius16 = BorderRadius.circular(16.0);
  static BorderRadius borderRadius18 = BorderRadius.circular(18.0);
  static BorderRadius borderRadius20 = BorderRadius.circular(20.0);
}

class CustomPadding {
  static EdgeInsets padding5 = const EdgeInsets.all(5.0);
  static EdgeInsets padding8 = const EdgeInsets.all(8.0);
  static EdgeInsets padding10 = const EdgeInsets.all(10.0);
  static EdgeInsets padding12 = const EdgeInsets.all(12.0);
  static EdgeInsets padding13 = const EdgeInsets.all(13.0);
  static EdgeInsets padding14 = const EdgeInsets.all(14.0);
  static EdgeInsets padding15 = const EdgeInsets.all(15.0);
  static EdgeInsets padding17 = const EdgeInsets.all(17.0);
  static EdgeInsets padding18 = const EdgeInsets.all(18.0);
  static EdgeInsets padding20 = const EdgeInsets.all(20.0);
  static EdgeInsets padding22 = const EdgeInsets.all(22.0);
  static EdgeInsets padding24 = const EdgeInsets.all(24.0);
  static EdgeInsets padding25 = const EdgeInsets.all(25.0);
}

class AppTextFormFiled extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final bool autoValidator;
  final String? Function(String?)? validator;
  const AppTextFormFiled({
    Key? key,
    required this.hintText,
    required this.autoValidator,
    this.errorText,
    this.validator,
    // this.autoValidator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: autoValidator ?
          (value) {
            if (value!.trim().isEmpty) {
              return errorText;
            }
            return null;
          }: validator,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
          ),
          border: OutlineInputBorder(
            borderRadius: CustomBorderRadius.borderRadius8,
            borderSide: BorderSide(
              color: AppColors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: CustomBorderRadius.borderRadius8,
          )),
    );
  }
}
