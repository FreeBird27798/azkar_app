import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/utils/app_colors.dart';

class OnBoardingTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double fontSize;

  OnBoardingTextButton(
      {required this.text, this.onPressed, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: AzkarAppText(
        text: text,

          fontWeight: FontWeight.w500,
          textColor: AppColors.INDICATOR_SELECTED_COLOR,
          fontSize: SizeConfig.scaleTextFont(16),
          // fontSize: fontSize,
      ),
      onPressed: onPressed,
    );
  }
}
