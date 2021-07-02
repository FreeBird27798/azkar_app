import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';

class SignatureText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor;

  SignatureText({
    this.text = 'Flutter - GGateWay',
    this.textAlign = TextAlign.center,
    this.fontWeight= FontWeight.w300,
    this.textColor = AppColors.APP_PRIMARY_COLOR,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: SizeConfig.scaleHeight(20),
      // bottom: 20,
      child: AzkarAppText(
        text: text,
        textAlign: textAlign,
        fontWeight: fontWeight, //LIGHT
        textColor: textColor,
      ),
    );
  }
}
