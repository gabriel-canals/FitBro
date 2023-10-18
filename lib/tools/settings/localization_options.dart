import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/helpers/toggle_buttons/distance_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/first_day_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/height_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/language_toggle_buttons.dart';
import 'package:fitbro/helpers/toggle_buttons/weight_toggle_buttons.dart';
import 'package:flutter/material.dart';

class LocSettings extends StatelessWidget {
  LocSettings({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
           Text(context.loc.setting_weight_unit),
          const WeightToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.setting_distance_unit),
          const DistanceToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.setting_height_unit),
          const HeightToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.setting_language),
          const LanguageToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.setting_week_first_day),
          const FirstDayToggleButtons(),
        ]),
      ],
    );
  }
}
