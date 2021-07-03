import 'package:azkar_app/models/zeker.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZekerScreen extends StatefulWidget {
  List<Zeker> list;
  final String title;

  ZekerScreen(this.list, this.title);

  @override
  _ZekerScreenState createState() => _ZekerScreenState();
}

class _ZekerScreenState extends State<ZekerScreen> {
  int _currentPage = 0;
  int _counter = 0;
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
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (int selectedPage) {
          _pageController.addListener(() {
            setState(() {
              _currentPage = selectedPage;
              _counter = 0;
            });
          });
        },
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsetsDirectional.all(20),
            child: Column(
              children: [
                Expanded(
                    child: Scrollbar(
                      thickness: 2,
                      child: SingleChildScrollView(
                        child: AzkarAppText(
                        textAlign: TextAlign.start,
                        text: '{{ ${widget.list[index].zekerText} }}',
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.scaleTextFont(30),
                        textColor: AppColors.GRADIENT_END_COLOR,
                        height: 2,
                      ),
                    ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: AzkarAppText(
                          text: ' ${widget.list[index].count}',
                          fontSize: SizeConfig.scaleTextFont(50),
                          textColor: AppColors.GRADIENT_END_COLOR,
                          fontFamily: 'Technology',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_currentPage + 1 != widget.list.length) {
                                ++_counter;
                                if (_counter == widget.list[index].count) {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeIn,
                                  );
                                }
                              } else if (_counter != widget.list[index].count) {
                                _counter++;
                              }
                            });
                          },
                          child: CircleAvatar(
                            child: AzkarAppText(
                              text: '$_counter',
                              fontSize: SizeConfig.scaleTextFont(35),
                              fontWeight: FontWeight.w700,
                              textColor: AppColors.APP_PRIMARY_COLOR_SHADE_50,
                              fontFamily: 'Technology',
                            ),
                            minRadius: 50,
                            backgroundColor: AppColors.GRADIENT_BEGIN_COLOR,
                          ),
                        ),
                      ),
                      Expanded(
                        child: AzkarAppText(
                          text: '${widget.list.length} - ${_currentPage + 1}',
                          fontSize: SizeConfig.scaleTextFont(35),
                          textColor: AppColors.GRADIENT_END_COLOR,
                          fontFamily: 'Technology',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
