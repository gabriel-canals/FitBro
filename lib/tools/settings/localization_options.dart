import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/helpers/toggle_buttons/distance_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/first_day_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/height_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/language_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/weight_toggle_buttons.dart';
import 'package:flutter/material.dart';

class LocSettings extends StatelessWidget {
  const LocSettings({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 3,
      primary: false,
      children: <Widget>[
        SettingText(title: context.loc.setting_weight_unit),
        const WeightToggleButtons(),
        SettingText(title: context.loc.setting_distance_unit),
        const DistanceToggleButtons(),
        SettingText(title: context.loc.setting_height_unit),
        const HeightToggleButtons(),
        SettingText(title: context.loc.setting_language),
        const LanguageToggleButtons(),
        SettingText(title: context.loc.setting_week_first_day),
        const FirstDayToggleButtons(),
      ],
    );
  }
}

class SettingText extends StatelessWidget {
  const SettingText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 10),
      Align(
        alignment: const Alignment(-1, 0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ]);
  }
}
