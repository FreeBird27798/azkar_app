import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.APP_PRIMARY_COLOR,
          backgroundImage: AssetImage(
            'images/logo.png',
          ),
          radius: 50,
        ),
        SizedBox(
          height: SizeConfig.scaleHeight(12),
        ),
        AzkarAppText(
          text: AppLocalizations.of(context)!.description,
          fontWeight: FontWeight.w400,
          fontSize: SizeConfig.scaleTextFont(18),
          textAlign: TextAlign.justify,
          height: 1.5,
        ),

      ],
    );
  }
}
