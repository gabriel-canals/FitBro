import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/exercises/exercises.dart';
import 'package:fitbro/views/exercise/create_update_exercise_view.dart';
import 'package:flutter/material.dart';

class ExercisesView extends StatefulWidget {
  const ExercisesView({super.key});

  @override
  State<ExercisesView> createState() => _ExercisesViewState();
}

class _ExercisesViewState extends State<ExercisesView> {
  @override
  Widget build(BuildContext context) {
    var exerciseList = exercises;
    exerciseList.sort((a, b) {
      return a.name.toLowerCase().compareTo(b.name.toLowerCase());
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: mainColor,
            surfaceTintColor: mainColor,
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                context.loc.exercises,
                style: TextStyle(
                    fontSize: 25,
                    color: secondaryColor,
                    fontWeight: FontWeight.bold),
              ),
              titlePadding: const EdgeInsets.only(left: 50, bottom: 10),
            ),
            automaticallyImplyLeading: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final exercise = exerciseList.elementAt(index);
                return Container(
                  height: 75,
                  margin: const EdgeInsets.only(bottom: 10),
                  color: mainColor,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 0.75),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: const Icon(Icons.fitness_center),
                    title: Text(
                      exercise.getName,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "${exercise.bodyPart} | ${exercise.category}",
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CreateUpdateExerciseView(givenExercise: exercise),
                        ),
                      );
                      setState(
                        () {
                          exerciseList = exercises;
                          exerciseList.sort((a, b) => a.name.compareTo(b.name));
                        },
                      );
                    },
                  ),
                );
              },
              childCount: exercises.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreateUpdateExerciseView(),
            ),
          );
          setState(
            () {
              exerciseList = exercises;
              exerciseList.sort((a, b) {
                return a.name.toLowerCase().compareTo(b.name.toLowerCase());
              });
            },
          );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
