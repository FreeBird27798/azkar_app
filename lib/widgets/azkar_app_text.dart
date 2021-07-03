import 'package:azkar_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AzkarAppText extends StatelessWidget {
  final String text;

  final String fontFamily;
  final FontWeight fontWeight;
  final double fontSize;
  final double height;
  final TextAlign textAlign;
  final Color textColor;

  AzkarAppText({
    required this.text,
    this.fontFamily = 'Cairo',
    this.fontWeight = FontWeight.normal,
    this.fontSize = 14,
    this.height = 1,
    this.textAlign = TextAlign.center,
    this.textColor = AppColors.APP_PRIMARY_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: TextOverflow.fade,
      // maxLines: 1,
      style: TextStyle(
          color: textColor,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          fontSize: fontSize,
          height: height),
    );
  }
}
