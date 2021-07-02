import 'package:azkar_app/storage/app_pref_controller.dart';
import 'package:azkar_app/utils/size_config.dart';
import 'package:azkar_app/widgets/azkar_app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../main.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen(this._remindersStatus);
  bool _remindersStatus = AppPrefController().isShowing;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _remindersStatus = AppPrefController().isShowing;
  String _lang = AppPrefController().languageCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            AzkarAppText(
              text: AppLocalizations.of(context)!.general_settings,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              fontSize: SizeConfig.scaleTextFont(18),
            ),
            SwitchListTile(
              value: _remindersStatus,
              onChanged: (bool selected) {
                setState(() {
                  print('$selected');
                  _remindersStatus = selected;
                  showHideReminder(_remindersStatus);
                });
              },
              title: AzkarAppText(
                text: AppLocalizations.of(context)!.reminder_title,
                textAlign: TextAlign.start,
                fontSize: SizeConfig.scaleTextFont(18),
                fontWeight: FontWeight.bold,
              ),
              subtitle: AzkarAppText(
                text: AppLocalizations.of(context)!.reminder_sub_title,
                textAlign: TextAlign.start,
              ),
            ),
            AzkarAppText(
              text: AppLocalizations.of(context)!.language,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
              fontSize: SizeConfig.scaleTextFont(18),
            ),
            RadioListTile<String>(
              title: AzkarAppText(
                text: 'عربي',
                textAlign: TextAlign.start,
              ),
              value: 'ar',
              groupValue: _lang,
              onChanged: (String? value) {
                print('Language => Value: $value');
                if (value != null)
                  setState(() {
                    _lang = value;
                    changeLang(_lang);
                  });
              },
            ),
            RadioListTile<String>(
              title: AzkarAppText(
                text: 'English',
                textAlign: TextAlign.start,
              ),
              value: 'en',
              groupValue: _lang,
              onChanged: (String? value) {
                if (value != null)
                  setState(() {
                    _lang = value;
                    changeLang(_lang);
                  });
                print('Language => Value: $value');
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeLang(String newLocaleLanguage) {
    AppPrefController().setLanguage(newLocaleLanguage);
    MyApp.changeLanguage(context: context, locale: Locale(newLocaleLanguage));
  }

  void showHideReminder(bool isShowing) {
    AppPrefController().setIsShowingReminder(isShowing);
    MyApp.isShowingReminder(context: context, isShowingReminder: isShowing);
  }
}
