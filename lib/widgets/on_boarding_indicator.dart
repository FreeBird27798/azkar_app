import 'package:azkar_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/utils/app_colors.dart';

class OnBoardingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  OnBoardingIndicator({
    this.marginEnd = 0,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        end: SizeConfig.scaleWidth(14),
        // end: marginEnd,
      ),
      width: SizeConfig.scaleWidth(18),
      height: SizeConfig.scaleHeight(4),
      decoration: BoxDecoration(
        color: selected
            ? AppColors.INDICATOR_SELECTED_COLOR
            : AppColors.INDICATOR_DEFAULT_COLOR,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
