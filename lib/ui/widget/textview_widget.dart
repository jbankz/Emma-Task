import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextView extends StatelessWidget {
  final String text;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final Color? color;
  final double? fontSize;
  final double? lineHeight;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final List<Shadow>? shadows;
  final String? fontFamily;
  final double? wordSpacing;
  final double? letterSpacing;
  final bool disable;

  const TextView(
      {super.key,
      required this.text,
      this.textOverflow,
      this.textAlign,
      this.color,
      this.fontSize,
      this.lineHeight,
      this.fontWeight,
      this.fontStyle,
      this.onTap,
      this.maxLines,
      this.textStyle,
      this.decoration,
      this.decorationStyle,
      this.decorationThickness,
      this.shadows,
      this.fontFamily,
      this.wordSpacing,
      this.letterSpacing,
      this.disable = false});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: disable ? null : onTap,
        child: Text(
          text,
          style: textStyle ??
              GoogleFonts.lato(
                color: color,
                shadows: shadows,
                decoration: decoration,
                decorationStyle: decorationStyle,
                decorationThickness: decorationThickness,
                fontWeight: fontWeight,
                fontSize: fontSize?.sp,
                fontStyle: fontStyle,
                height: lineHeight,
                wordSpacing: wordSpacing,
                letterSpacing: letterSpacing,
              ),
          textAlign: textAlign,
          overflow: textOverflow,
          maxLines: maxLines,
        ),
      );
}
