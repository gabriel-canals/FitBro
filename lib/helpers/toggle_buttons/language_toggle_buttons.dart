import 'package:country_flags/country_flags.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:flutter/material.dart';

class LanguageToggleButtons extends StatefulWidget {
  const LanguageToggleButtons({super.key});

  @override
  State<LanguageToggleButtons> createState() => _LanguageToggleButtonsState();
}

class _LanguageToggleButtonsState extends State<LanguageToggleButtons> {
  final List<bool> _selectedDistance = <bool>[true, false, false];
  List<Widget> distance = <Widget>[
    CountryFlag.fromLanguageCode(
      'es',
      height: 48,
      width: 62,
      borderRadius: 8,
    ),
    CountryFlag.fromLanguageCode(
      'en',
      height: 48,
      width: 62,
      borderRadius: 8,
    ),
    CountryFlag.fromLanguageCode(
      'it',
      height: 48,
      width: 62,
      borderRadius: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedDistance.length; i++) {
            _selectedDistance[i] = i == index;
          }
          Settings().setLanguage(lang: index);
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      selectedBorderColor: Colors.red[700],
      selectedColor: Colors.white,
      fillColor: Colors.red[200],
      color: Colors.red[400],
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: _selectedDistance,
      children: distance,
    );
  }
}
