import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({Key? key}) : super(key: key);

  @override
  _TasbeehScreenState createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int _counter = 0;
  String _alZeker = 'أستغفر الله';

  @override
  Widget build(BuildContext context) {
    // _alZeker = AppLocalizations.of(context)!.forgiveness_from_allah;
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: SizeConfig.scaleWidth(15),
        end: SizeConfig.scaleWidth(15),
      ),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsetsDirectional.only(
                top: SizeConfig.scaleHeight(15),
                bottom: SizeConfig.scaleHeight(15),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.GRADIENT_END_COLOR,
                  width: SizeConfig.scaleWidth(2),
                ),
                shape: BoxShape.rectangle,
              ),
              child: AzkarAppText(
                text: _alZeker,
                fontSize: SizeConfig.scaleTextFont(30),
              ),
            ),
            SizedBox(
              height: SizeConfig.scaleHeight(20),
            ),
            GestureDetector(
              onTap: () {
                increaseCounter();
              },
              child: Container(
                width: SizeConfig.scaleWidth(200),
                height: SizeConfig.scaleHeight(200),
                decoration: BoxDecoration(
                  color: AppColors.GRADIENT_BEGIN_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$_counter',
                   style:TextStyle(
                     fontSize: SizeConfig.scaleTextFont(70),
                     color: AppColors.GRADIENT_END_COLOR,
                     fontFamily: 'Technology',
                     fontWeight: FontWeight.w700,
                   )
                  ),
                ),
                // ),
              ),
            ),

            SizedBox(
              height: SizeConfig.scaleHeight(20),
            ),
          ],
        ),
        PositionedDirectional(
            child: PopupMenuButton<int>(
          iconSize: SizeConfig.scaleWidth(30),
          tooltip: AppLocalizations.of(context)!.change_prayer,
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: AppColors.APP_PRIMARY_COLOR,
          ),
          onSelected: (int selectedItem) {
            switch (selectedItem) {
              case 1:
                changeContent(AppLocalizations.of(context)!.forgiveness_from_allah);
                break;
              case 2:
                changeContent(AppLocalizations.of(context)!.glory_to_allah);
                break;
              case 3:
                changeContent(AppLocalizations.of(context)!.praise_allah);
                break;
              case 4:
                changeContent(AppLocalizations.of(context)!.no_god_but_allah);
                break;
              case 5:
                changeContent(AppLocalizations.of(context)!.allah_is_the_greatest);
                break;
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: AzkarAppText(
                  text: AppLocalizations.of(context)!.forgiveness_from_allah,
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
                value: 1,
              ),
              PopupMenuItem(
                child: AzkarAppText(
                  text: AppLocalizations.of(context)!.glory_to_allah,
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
                value: 2,
              ),
              PopupMenuItem(
                child: AzkarAppText(
                  text: AppLocalizations.of(context)!.praise_allah,
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
                value: 3,
              ),
              PopupMenuItem(
                child: AzkarAppText(
                  text: AppLocalizations.of(context)!.no_god_but_allah,
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
                value: 4,
              ),
              PopupMenuItem(
                child: AzkarAppText(
                  text: AppLocalizations.of(context)!.allah_is_the_greatest,
                  fontSize: SizeConfig.scaleTextFont(20),
                ),
                value: 5,
              ),
            ];
          },
        )),
        PositionedDirectional(
          end: SizeConfig.scaleWidth(5),
          top: SizeConfig.scaleHeight(5),
          child: IconButton(
            tooltip: AppLocalizations.of(context)!.reset_counter,
            iconSize: SizeConfig.scaleWidth(30),
            onPressed: () => resetCounter(),
            icon: Icon(
              Icons.autorenew,
              color: Colors.amber,
            ),
          ),
        ),
      ]),
    );
  }

  void changeContent(String content) {
    if (_alZeker != content) {
      setState(() {
        _alZeker = content;
        _counter = 0;
      });
    }
  }

  void increaseCounter() {
    setState(() {
      ++_counter;
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
}
