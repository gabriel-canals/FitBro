import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Exercise",
          style: TextStyle(
            color: Colors.black,
            fontSize: 70,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainExerciseViewButton(label: context.loc.training_history),
            const SizedBox(width: 25),
            MainExerciseViewButton(label: context.loc.training_templates),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainExerciseViewButton(label: context.loc.exercises),
            const SizedBox(width: 25),
            MainExerciseViewButton(label: context.loc.training_goals),
          ],
        ),
        const SizedBox(height: 25),
        NewTrainingButton(label: context.loc.new_training),
      ],
    );
  }
}

class MainExerciseViewButton extends StatelessWidget {
  const MainExerciseViewButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width / 2.5,
      child: TextButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
        ),
        child: Column(
          children: [
            const Icon(Icons.abc),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class NewTrainingButton extends StatelessWidget {
  const NewTrainingButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      width: (MediaQuery.of(context).size.width / 2.5 * 2 + 25),
      child: TextButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
        ),
        child: Column(
          children: [
            const Icon(Icons.abc),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
