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
           Text(context.loc.email_text_field_placeholder),
          WeightToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.email_text_field_placeholder),
          DistanceToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.email_text_field_placeholder),
          HeightToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.email_text_field_placeholder),
          LanguageToggleButtons(),
        ]),
        Row(children: [
           Text(context.loc.email_text_field_placeholder),
          FirstDayToggleButtons(),
        ]),
      ],
    );
  }
}
