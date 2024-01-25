import 'package:country_flags/country_flags.dart';
import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:fitbro/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

class LanguageToggleButtons extends StatefulWidget {
  const LanguageToggleButtons({super.key});

  @override
  State<LanguageToggleButtons> createState() => _LanguageToggleButtonsState();
}

class _LanguageToggleButtonsState extends State<LanguageToggleButtons> {
  List<bool> _selectedLanguage = [];
  List<Widget> language = <Widget>[
    CountryFlag.fromLanguageCode(
      'es',
      height: 40,
      width: 30,
      borderRadius: 8,
    ),
    CountryFlag.fromLanguageCode(
      'en',
      height: 40,
      width: 30,
      borderRadius: 8,
    ),
    CountryFlag.fromLanguageCode(
      'it',
      height: 40,
      width: 30,
      borderRadius: 8,
    ),
  ];

  void getSelected() {
    switch (Settings().getLanguage()) {
      case "es":
        _selectedLanguage = [true, false, false];
        break;
      case "it":
        _selectedLanguage = [false, false, true];
        break;
      case "en":
      default:
        _selectedLanguage = [false, true, false];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    getSelected();
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedLanguage.length; i++) {
            _selectedLanguage[i] = i == index;
          }
          switch (index) {
            case 0:
              Settings().setLanguage(lang: "es");
              break;
            case 1:
              Settings().setLanguage(lang: "en");
              break;
            case 2:
              Settings().setLanguage(lang: "it");
              break;
          }
          showGenericDialog(
            context: context,
            title: context.loc.language_changed,
            content: context.loc.restart_app,
            optionBuilder: () => {
              /// Ok option will be enough.
              context.loc.ok: null,
            },
          );
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: quaternaryColor,
      selectedColor: myBlackColor,
      fillColor: ternaryColor,
      color: myBlackColor,
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 20,
        minWidth: MediaQuery.of(context).size.width / 10,
      ),
      isSelected: _selectedLanguage,
      children: language,
    );
  }
}
