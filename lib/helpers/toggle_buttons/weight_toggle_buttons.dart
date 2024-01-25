import 'package:fitbro/constants/colors.dart';
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
  List<Widget> weight = <Widget>[const Text(kiloUnit), const Text(poundUnit)];

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
      selectedBorderColor: quaternaryColor,
      selectedColor: myBlackColor,
      fillColor: ternaryColor,
      color: myBlackColor,
      textStyle: const TextStyle(fontWeight: FontWeight.w700),
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height / 20,
        minWidth: MediaQuery.of(context).size.width / 10,
      ),
      isSelected: _selectedweight,
      children: weight,
    );
  }
}
