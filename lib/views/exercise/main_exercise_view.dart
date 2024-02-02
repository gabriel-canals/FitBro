import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuExerciseView extends StatefulWidget {
  const MenuExerciseView({super.key});

  @override
  State<MenuExerciseView> createState() => _MenuExerciseViewState();
}

class _MenuExerciseViewState extends State<MenuExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: Column(
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
                      route: historyRoute,
                    ),
                    const SizedBox(width: 25),
                    MainExerciseViewButton(
                      label: context.loc.training_templates,
                      icon: Icons.list_alt,
                      route: templatesRoute,
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
                      route: exercisesRoute,
                    ),
                    const SizedBox(width: 25),
                    MainExerciseViewButton(
                      label: context.loc.training_goals,
                      icon: Icons.flag_circle,
                      route: goalsRoute,
                    ),
                  ],
                ),
                const SizedBox(height: 60),
                NewTrainingButton(label: context.loc.new_training),
              ],
            ),
          ],
        ));
  }
}

class MainExerciseViewButton extends StatelessWidget {
  const MainExerciseViewButton({
    super.key,
    required this.label,
    required this.icon,
    required this.route,
  });

  final String label;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
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
                Navigator.of(context).pushNamed(historyRoute);
              },
              heroTag: "new_training",
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
