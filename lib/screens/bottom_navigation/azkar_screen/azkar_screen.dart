import 'package:azkar_app/screens/bottom_navigation/azkar_screen/azkar_sub_screen.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/azkar.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      padding: EdgeInsetsDirectional.only(start: 15, end: 15, top: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        // childAspectRatio:SizeConfig.scaleWidth(1440/2560),
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AzkarSubScreen(
                      categories[index].list, categories[index].catName),
                ));
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.asset(
                      'images/${categories[index].imagePath}' + '.png',
                      color: AppColors.GRADIENT_BEGIN_COLOR,
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey.shade600,
                  height: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: AzkarAppText(
                      text: '${categories[index].catName}',
                      fontSize: SizeConfig.scaleTextFont(18),
                      fontWeight: FontWeight.bold,
                      height: 0.9,
                    ),
                  ),
                ),

                AzkarAppText(
                  text: AppLocalizations.of(context)!.count_of_prayers +
                      '${categories[index].list.length}',
                  textColor: AppColors.GRADIENT_BEGIN_COLOR,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}