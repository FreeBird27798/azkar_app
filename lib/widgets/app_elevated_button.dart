import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';

class AppElevatedButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final double marginStart;
  final double marginEnd;
  final FontWeight fontWeight;
  final Color textColor;
  final Color backgroundColor;
  final void Function()? onPressed;

  AppElevatedButton({
    required this.text,
    this.onPressed,
    // this.fontSize = SizeConfig.scaleTextFont(20),
    this.fontSize = 20,
    this.marginStart = 0,
    this.marginEnd = 0,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.APP_PRIMARY_COLOR,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: marginStart, end: marginEnd),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(26),
            ),
          ),
          minimumSize: Size.fromHeight(SizeConfig.scaleHeight(53)),
        ),
        child: AzkarAppText(
          text:text,
            textColor: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
