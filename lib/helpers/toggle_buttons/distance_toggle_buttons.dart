import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/physic_units.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:flutter/material.dart';

class DistanceToggleButtons extends StatefulWidget {
  const DistanceToggleButtons({super.key});

  @override
  State<DistanceToggleButtons> createState() => _DistanceToggleButtonsState();
}

class _DistanceToggleButtonsState extends State<DistanceToggleButtons> {
  final List<bool> _selectedDistance = <bool>[true, false];
  List<Widget> distance = <Widget>[
    const Text(metricUnit),
    const Text(imperialUnit),
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedDistance.length; i++) {
            _selectedDistance[i] = i == index;
            Settings().setDistanceSystem(imperial: index == 1);
          }
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
