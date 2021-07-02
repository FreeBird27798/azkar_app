import 'package:azkar_app/storage/app_pref_controller.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/app_elevated_button.dart';
import 'package:azkar_app/widgets/on_boarding_content.dart';
import 'package:azkar_app/widgets/on_boarding_indicator.dart';
import 'package:azkar_app/widgets/on_boarding_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.scaleWidth(30)),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int selectedPage) {
                setState(() {
                  _currentPage = selectedPage;
                });
              },
              children: [
                OnBoardingContent(
                  image: 'on_boarding_01',
                  title: AppLocalizations.of(context)!.title_01,
                  message: AppLocalizations.of(context)!.message_01,
                ),
                OnBoardingContent(
                  image: 'on_boarding_02',
                  title: AppLocalizations.of(context)!.title_02,
                  message: AppLocalizations.of(context)!.message_02,
                ),
                OnBoardingContent(
                  image: 'on_boarding_03',
                  title: AppLocalizations.of(context)!.reminder_title,
                  message: AppLocalizations.of(context)!.message_03,
                ),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: SizeConfig.scaleHeight(154),
              // bottom: 154,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  OnBoardingIndicator(
                    selected: _currentPage == 0,
                  ),
                  OnBoardingIndicator(
                    selected: _currentPage == 1,
                  ),
                  OnBoardingIndicator(
                    selected: _currentPage == 2,
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              // right: SizeConfig.scaleWidth(30),
              // top: 76,
              top: SizeConfig.scaleHeight(76),
              end: 0,
              child: Visibility(
                visible: _currentPage != 2,
                child: OnBoardingTextButton(
                  text:AppLocalizations.of(context)!.skip,
                  fontSize: SizeConfig.scaleTextFont(25),
                  onPressed: () => _pageController.jumpToPage(2),
                ),
                replacement: OnBoardingTextButton(
                  fontSize: SizeConfig.scaleTextFont(25),
                  text:AppLocalizations.of(context)!.start,
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/main_screen'),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: SizeConfig.scaleHeight(62),
              // bottom: 62,

              child: Visibility(
                visible: _currentPage != 2,
                replacement: AppElevatedButton(
                  text: AppLocalizations.of(context)!.start,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/main_screen');
                    AppPrefController().setIsFirstTime(false);
                  },
                ),
                child: SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
