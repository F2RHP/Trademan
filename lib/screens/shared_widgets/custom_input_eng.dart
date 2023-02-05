// ignore_for_file: camel_case_types

import 'package:trader_app/constants/colors.dart';
import 'package:trader_app/env/dimensions.dart';
import 'package:trader_app/screens/shared_widgets/custom_richText.dart';
import 'package:flutter/material.dart';

class CustomInput_eng extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String label;
  final bool isRequired;
  final double? height;
  const CustomInput_eng({
    required this.label,
    required this.controller,
    this.type,
    this.height,
    this.isRequired = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.calcH(0.25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            text: label,
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
          SizedBox(
            height: Dimensions.calcH(3),
          ),
          
          Container(
            color: AppColors.kSecondaryColor,
            height: height,
            margin: EdgeInsets.only(
              right: Dimensions.calcW(10),
            ),
            child: TextFormField(
              controller: controller,
              keyboardType: type,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
                fillColor: AppColors.kSecondaryColor,
                filled: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
