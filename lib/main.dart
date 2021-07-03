import 'package:azkar_app/screens/bottom_navigation/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/about_app_screen.dart';
import 'screens/bottom_navigation/main_screen.dart';
import 'screens/launch_screen.dart';
import 'screens/on_boarding/on_boarding_screen.dart';
import 'package:azkar_app/storage/app_pref_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefController().initSharedPref();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static void changeLanguage({
    required BuildContext context,
    required Locale locale,
  }) {
    _MyAppState _myAppState = context.findAncestorStateOfType<_MyAppState>()!;
    _myAppState.changeLanguage(locale);
  }

  static void isShowingReminder({
    required BuildContext context,
    required bool isShowingReminder,
  }) {
    _MyAppState _myAppState = context.findAncestorStateOfType<_MyAppState>()!;
    _myAppState.isShowingReminder(isShowingReminder);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _appLocale = Locale(AppPrefController().languageCode);
  bool _isShowingReminder = AppPrefController().isShowing;

  void changeLanguage(Locale locale) {
    setState(() {
      _appLocale = locale;
    });
  }

  void isShowingReminder(bool isShowingReminder) {
    setState(() {
      _isShowingReminder = isShowingReminder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        // MultiProvider(
        // providers: [
        //   Provider<TasbeehChangeNotifier>(create: (_) => TasbeehChangeNotifier()),
        // ],
        // child:
        MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.APP_PRIMARY_COLOR_SHADE_50,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3,
          backgroundColor: AppColors.GRADIENT_BEGIN_COLOR,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              headline6: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          )),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //Routing
      initialRoute: '/launch_screen',
      routes: {
        '/main_screen': (context) => MainScreen(),
        '/about_app_screen': (context) => AboutAppScreen(),
        '/on_boarding_screen': (context) => OnBoardingScreen(),
        '/launch_screen': (context) => LaunchScreen(),
        '/settings_screen': (context) => SettingsScreen(_isShowingReminder),
      },
      // Localizations
      locale: _appLocale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("ar", "SA"),
        Locale("en", "US"),
      ],
    );
    // );
  }
}
