import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Main menu for the Training section.
///
/// The user will access this view via the [NavigationAppBar].
/// It contains several buttons to access the different Training sections:
///
/// - [History]: A list of the trainings completed by the user.
/// - [Templates]: A list of routines the user can create/edit/delete for new trainings.
/// - [Exercises]: A list of exercises (default and custom) and the user's statistics for each one.
/// - [Goals]: The goals set by the user. They is able to edit these goals.
/// - [New training]: A new training starts from a template routing or from a blank one.
class MenuExerciseView extends StatefulWidget {
  const MenuExerciseView({super.key});

  @override
  State<MenuExerciseView> createState() => _MenuExerciseViewState();
}

class _MenuExerciseViewState extends State<MenuExerciseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const SizedBox(height: 60),
            Column(
              children: [
                /// Section title.
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

                /// Row containing two buttons, aligned to the center.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// History section button.
                    MainExerciseViewButton(
                      label: context.loc.training_history,
                      icon: Icons.schedule,
                      route: historyRoute,
                    ),
                    const SizedBox(width: 25),

                    /// Templates section button.
                    MainExerciseViewButton(
                      label: context.loc.training_templates,
                      icon: Icons.list_alt,
                      route: templatesRoute,
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                /// Row containing two buttons, aligned to the center.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// Exercises section button.
                    MainExerciseViewButton(
                      label: context.loc.exercises,
                      icon: Icons.fitness_center_sharp,
                      route: exercisesRoute,
                    ),
                    const SizedBox(width: 25),

                    /// Goals section button.
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

/// Button template for the [MainExerciseView].
///
/// History, Templates, Exercises and Goals buttons use this template.
/// It requires a [label] (text to display), an [icon] (image to show) and a [route] to the respective section.
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
      /// The button is a sixth of the screen high and a third of the screen wide.
      height: MediaQuery.of(context).size.height / 6,
      width: MediaQuery.of(context).size.width / 3,

      /// It navigates to the given route when is pressed.
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },

        /// Style of the button.
        ///
        /// Rectangular border and color changes on press.
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor2),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0))),
        ),

        /// The icon is displayed and occupies a large part of the button.
        /// On the bottom of the button the label is displayed.
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

/// Button to start a new training.
///
/// A [label] is required as the l10n requires previous context.
class NewTrainingButton extends StatelessWidget {
  const NewTrainingButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      /// The new training button occupies as much width as an upper row and as much height as half height as an upper button.
      height: MediaQuery.of(context).size.height / 12,
      width: (MediaQuery.of(context).size.width / 3 * 2 + 25),
      /// On press, a new training will start (using a template or not). **(to be implemented)**
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
              /// Hero tag modified to avoid replication as several [FloatingActionButton] are being used.
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
