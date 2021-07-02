import 'package:shared_preferences/shared_preferences.dart';

class AppPrefController {
  final String isFirstTimeKey = 'isFirstTime';
  final String langCodeKey = 'language_code';
  final String isShowingKey = 'isShowing';

  static final AppPrefController _instance =
      AppPrefController._internal();
  late SharedPreferences _sharedPreferences;

  AppPrefController._internal();

  factory AppPrefController() {
    return _instance;
  }

  Future<void> initSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  SharedPreferences get pref => _sharedPreferences;

  Future<bool> setIsFirstTime(bool isFirstTime) async {
    return await _sharedPreferences.setBool(isFirstTimeKey, isFirstTime);
  }

  bool get isFirstTime => _sharedPreferences.getBool(isFirstTimeKey) ?? true;

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }

  Future<bool> setLanguage(String languageCode) async{
    return await _sharedPreferences.setString(langCodeKey, languageCode);
  }

  String get languageCode {
    return _sharedPreferences.getString(langCodeKey) ?? 'ar';
  }

  Future<bool> setIsShowingReminder(bool isShowing) async {
    return await _sharedPreferences.setBool(isShowingKey,isShowing);
  }

  bool get isShowing => _sharedPreferences.getBool(isShowingKey) ?? true;

}
