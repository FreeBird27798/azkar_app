import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';

class OnBoardingContent extends StatelessWidget {
  final String image;
  final String message;
  final String title;
  final TextAlign titleTextAlign;
  final TextAlign messageTextAlign;
  final double marginHorizantol;

  OnBoardingContent({
    required this.image,
    required this.message,
    required this.title,
    this.titleTextAlign = TextAlign.center,
    this.messageTextAlign = TextAlign.center,
    this.marginHorizantol = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.scaleHeight(208)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: SizeConfig.scaleHeight(15),
              end: SizeConfig.scaleHeight(15),
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  spreadRadius: 2,
                )
              ],
              border: Border.all(color: AppColors.APP_PRIMARY_COLOR, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.asset(
              'images/$image.jpg',
            ),
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(15),
          ),
          AzkarAppText(
            text: title,
            textAlign: titleTextAlign,

            fontSize: SizeConfig.scaleTextFont(30),
            // fontSize: 30,
          ),
          SizedBox(
            height: SizeConfig.scaleHeight(21),
            // height: 21,
          ),
          AzkarAppText(
            text: message,
            textAlign: messageTextAlign,
            fontWeight: FontWeight.w300,
            fontSize: SizeConfig.scaleTextFont(17),
            // fontSize: 17,
          ),
        ],
      ),
    );
  }
}
