import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:flutter/material.dart';

class FirstDayToggleButtons extends StatefulWidget {
  const FirstDayToggleButtons({super.key});

  @override
  State<FirstDayToggleButtons> createState() => _FirstDayToggleButtonsState();
}

class _FirstDayToggleButtonsState extends State<FirstDayToggleButtons> {
  final List<bool> _selectedDistance = <bool>[true, false, false];
  late List<Widget> distance = <Widget>[
    Text(context.loc.monday),
    Text(context.loc.saturday),
    Text(context.loc.sunday),
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
          Settings().setFirstDay(day: index);
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
      isSelected: _selectedDistance,
      children: distance,
    );
  }
}
