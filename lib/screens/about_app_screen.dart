import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/about_card.dart';
import 'package:azkar_app/widgets/sigunature_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  _AboutAppScreenState createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.about,
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: SizeConfig.scaleWidth(16),
          right: SizeConfig.scaleHeight(16),
          top: SizeConfig.scaleHeight(32),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: AppColors.APP_PRIMARY_COLOR,
                      width: SizeConfig.scaleWidth(5)),
                  // width: 5),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(16),
                  vertical: SizeConfig.scaleHeight(16),
                ),
                // horizontal: 60,
                // vertical: 30),
                child: AboutCard(),
              ),
            ),
            SignatureText(),
          ],
        ),
      ),
    );
  }
}



