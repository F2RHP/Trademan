// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trader_app/env/dimensions.dart';

class CustomRichText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double spacing;
  final double height;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  final List<TextSpan> children;
  final TextDirection? direction;
  const CustomRichText({
    Key? key,
    required this.text,
    this.children = const <TextSpan>[],
    this.fontSize,
    this.direction,
    this.spacing = 0,
    this.height = 1,
    this.color = Colors.black,
    this.align = TextAlign.center,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align,
      textDirection: direction,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: text,
        style: GoogleFonts.nunito(
          color: color,
          fontSize: fontSize ?? Dimensions.calcH(18),
          fontWeight: fontWeight,
          letterSpacing: spacing,
          height: height,
        ),
        children: [
          ...children.toList(),
        ],
      ),
    );
    // return Text(
    //   text,
    //   textAlign: TextAlign.center,
    //   style: GoogleFonts.nunito(
    //       color: color,
    //       fontSize: fontSize ?? Dimensions.calcH(18),
    //       fontWeight: weight),
    // );
  }
}
