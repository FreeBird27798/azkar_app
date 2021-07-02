import 'package:azkar_app/storage/app_pref_controller.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:azkar_app/widgets/sigunature_text.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LaunchScreen extends StatefulWidget {
  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.GRADIENT_BEGIN_COLOR,
                  AppColors.GRADIENT_END_COLOR,
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AzkarAppText(
                text: AppLocalizations.of(context)!.azkar_app_name,
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.scaleTextFont(25),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
        SignatureText(
          textColor: Colors.white,
        ),
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (AppPrefController().isFirstTime) {
        Navigator.pushReplacementNamed(context, '/on_boarding_screen');
      } else {
        Navigator.pushReplacementNamed(context, '/main_screen');
      }
    });
  }
}
