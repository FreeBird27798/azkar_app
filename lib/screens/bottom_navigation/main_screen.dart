import 'package:azkar_app/change_notifiers/tasbeeh_change_notifier.dart';
import 'package:azkar_app/storage/app_pref_controller.dart';
import 'package:azkar_app/utils/app_colors.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:azkar_app/screens/bottom_navigation/settings_screen.dart';
import 'package:azkar_app/screens/bottom_navigation/tasbeeh_screen.dart';
import 'package:azkar_app/screens/bottom_navigation/azkar_screen/azkar_screen.dart';
import 'package:azkar_app/models/bottom_navigation_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:azkar_app/utils/azkar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedItemIndex = 0;
  String _title = 'الأذكار';

  List<BottomNavigationScreen> _screens = <BottomNavigationScreen>[
    BottomNavigationScreen(
        title: 'الأذكار', title_en: 'Prayers', widget: AzkarScreen()),
    BottomNavigationScreen(
        title: 'المسبحة', title_en: 'Rosary', widget: TasbeehScreen()),
    BottomNavigationScreen(
        title: 'الإعدادات',
        title_en: 'Settings',
        widget: SettingsScreen(AppPrefController().isShowing)),
  ];

  Future<bool> _onWillPop() async {
    return (await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            title: AzkarAppText(
              text: AppLocalizations.of(context)!.reminder,
              fontSize: SizeConfig.scaleTextFont(35),
              textColor: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            content: AzkarAppText(
              text: getRandomZeker(),
              fontSize: SizeConfig.scaleTextFont(24),
              textAlign: TextAlign.start,
            ),
            actions: <Widget>[
              SizedBox(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: AzkarAppText(
                    text: AppLocalizations.of(context)!.done,
                    textAlign: TextAlign.center,
                    fontSize: SizeConfig.scaleTextFont(25),
                    textColor: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                width: double.infinity,
              ),
            ],
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.white,
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: AppPrefController().isShowing ? _onWillPop : null,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              TasbeehChangeNotifier()
                  .getNavTitle(index: _selectedItemIndex, screens: _screens),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.GRADIENT_BEGIN_COLOR,
                          AppColors.GRADIENT_END_COLOR,
                        ]),
                  ),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.info,
                    color: AppColors.APP_PRIMARY_COLOR,
                  ),
                  title:
                      AzkarAppText(text: AppLocalizations.of(context)!.about),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.APP_PRIMARY_COLOR,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about_app_screen');
                  },
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedItemIndex,
            onTap: (int selectedItemIndex) {
              setState(() {
                _selectedItemIndex = selectedItemIndex;
              });

              setState(() {
                if (_selectedItemIndex == 0) {
                  _title = AppLocalizations.of(context)!.title_02;
                } else if (_selectedItemIndex == 1) {
                  _title = AppLocalizations.of(context)!.title_01;
                }
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.GRADIENT_BEGIN_COLOR,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            selectedItemColor: Colors.white,
            unselectedItemColor: AppColors.GRADIENT_END_COLOR,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme:
                IconThemeData(color: AppColors.GRADIENT_END_COLOR),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            elevation: 4,
            items: [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'images/ic_azkar.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.title_02),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage(
                      'images/ic_sobha.png',
                    ),
                  ),
                  label: AppLocalizations.of(context)!.title_01),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
          body: _screens.elementAt(_selectedItemIndex).widget),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
