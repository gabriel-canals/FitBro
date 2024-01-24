import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Column(
          children: [
            Text(
              context.loc.training,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                color: ternaryColor,
                fontSize: 40,
                letterSpacing: 0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainExerciseViewButton(
                  label: context.loc.training_history,
                  icon: Icons.schedule,
                ),
                const SizedBox(width: 25),
                MainExerciseViewButton(
                  label: context.loc.training_templates,
                  icon: Icons.list_alt,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainExerciseViewButton(
                  label: context.loc.exercises,
                  icon: Icons.fitness_center_sharp,
                ),
                const SizedBox(width: 25),
                MainExerciseViewButton(
                  label: context.loc.training_goals,
                  icon: Icons.flag_circle,
                ),
              ],
            ),
            const SizedBox(height: 60),
            NewTrainingButton(label: context.loc.new_training),
          ],
        ),
      ],
    );
  }
}

class MainExerciseViewButton extends StatelessWidget {
  const MainExerciseViewButton(
      {super.key, required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(historyRoute);
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 70,
              color: Colors.white,
            ),
            const SizedBox(height: 15),
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
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
      height: MediaQuery.of(context).size.height / 12,
      width: (MediaQuery.of(context).size.width / 3 * 2 + 25),
      child: TextButton(
        onPressed: null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(secondaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(width: 10),
            FloatingActionButton.small(
              onPressed: () {
                // Add your onPressed code here!
              },
              backgroundColor: mainColor2,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
