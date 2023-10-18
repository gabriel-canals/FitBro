import 'package:fitbro/constants/physic_units.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:flutter/material.dart';

class WeightToggleButtons extends StatefulWidget {
  const WeightToggleButtons({super.key});

  @override
  State<WeightToggleButtons> createState() => _WeightToggleButtonsState();
}

class _WeightToggleButtonsState extends State<WeightToggleButtons> {
  final List<bool> _selectedweight = <bool>[true, false];
  List<Widget> weight = <Widget>[const Text(kilo), const Text(pound)];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < _selectedweight.length; i++) {
            _selectedweight[i] = i == index;
            Settings().setWeightSystem(imperial: index == 1);
          }
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
      isSelected: _selectedweight,
      children: weight,
    );
  }
}
