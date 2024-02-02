import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/exercises/exercises.dart';
import 'package:flutter/material.dart';

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: const TextStyle(fontSize: 30),
              ),
              titlePadding: const EdgeInsets.only(left: 50, bottom: 10),
            ),
            automaticallyImplyLeading: true,
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            final exercise = exercises.elementAt(index);
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
                onTap: () {},
              ),
            );
          }, childCount: exercises.length))
        ],
      ),
    );
  }
}
