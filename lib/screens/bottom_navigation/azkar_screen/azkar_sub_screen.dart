import 'package:azkar_app/models/sub_category.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'zeker_screen.dart';

class AzkarSubScreen extends StatefulWidget {
  List<SubCategory> list;
  final String title;

  AzkarSubScreen(this.list, this.title);

  @override
  _AzkarSubScreenState createState() => _AzkarSubScreenState();
}

class _AzkarSubScreenState extends State<AzkarSubScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
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
      body: ListView.builder(
        itemCount: widget.list.length,
        padding: EdgeInsetsDirectional.all(15),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              goToZeker(index);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.scaleWidth(10),
                  vertical: SizeConfig.scaleHeight(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: AzkarAppText(
                        textAlign: TextAlign.start,
                        text: '${widget.list[index].subCatName}',
                        fontSize: SizeConfig.scaleTextFont(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        goToZeker(index);
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.APP_PRIMARY_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void goToZeker(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ZekerScreen(
                widget.list[index].zekerList,
                widget.list[index].subCatName!,
              )),
    );
  }
}