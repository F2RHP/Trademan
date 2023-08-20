import 'package:trader_app/env/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trader_app/screens/shared_widgets/custom_richText.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double spacing;
  final double height;
  final bool? isRequired;
  final Color color;
  final TextAlign align;
  final FontWeight weight;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  const CustomText({
    required this.text,
    this.fontSize,
    this.spacing = 0,
    this.height = 1,
    this.color = Colors.black,
    this.align = TextAlign.center,
    this.weight = FontWeight.normal,
    this.overflow,
    this.textDirection,
    Key? key,
    this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isRequired != null
        ? CustomRichText(
            text: text,
            children: (isRequired!)
                ? [
                    const TextSpan(
                      text: " *",
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ]
                : [],
          )
        : Text(
            text,
            maxLines: 1,
            overflow: overflow ?? TextOverflow.ellipsis,
            textDirection: textDirection ?? TextDirection.ltr,
            textAlign: align,
            style: GoogleFonts.nunito(
              color: color,
              fontSize: fontSize ?? Dimensions.calcH(18),
              fontWeight: weight,
              letterSpacing: spacing,
              height: height,
            ),
          );
  }
}
