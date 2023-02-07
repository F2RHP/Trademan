// ignore_for_file: camel_case_types

import 'package:trader_app/Ui/Common_Codes/common_codes.dart';
import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/screens/shared_widgets/custom_richText.dart';
import 'package:flutter/material.dart';
import 'package:trader_app/screens/shared_widgets/sized_box.dart';

class TitleWithTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String titleText;
  final String? hintText;
  final bool isRequired;
  final double? height;
  const TitleWithTextFormField({
    required this.titleText,
    this.controller,
    this.type,
    this.height,
    this.hintText,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomRichText(
          text: titleText,
          children: (isRequired)
              ? [
                  const TextSpan(
                    text: " *",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ]
              : [],
        ),
        AppSizedBox.sizedBoxH8,
        TextFormField(
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: CustomBorderRadius.borderRadius8,
              borderSide: BorderSide(
                color: AppColors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: CustomBorderRadius.borderRadius8,
              borderSide: BorderSide(
                color: AppColors.grey,
              ),
            ),
            fillColor: AppColors.kSecondaryColor,
            filled: true,
          ),
        ),
        AppSizedBox.sizedBoxH20,
      ],
    );
  }
}
