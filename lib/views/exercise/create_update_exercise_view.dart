import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/exercises/default_exercises.dart';
import 'package:fitbro/utilities/exercises/exercise_class.dart';
import 'package:fitbro/utilities/exercises/exercises.dart';
import 'package:fitbro/utilities/text_fields.dart';
import 'package:flutter/material.dart';

class CreateUpdateExerciseView extends StatefulWidget {
  final Exercise? givenExercise;
  const CreateUpdateExerciseView({super.key, this.givenExercise});
  @override
  State<CreateUpdateExerciseView> createState() =>
      _CreateUpdateExerciseViewState();
}

class _CreateUpdateExerciseViewState extends State<CreateUpdateExerciseView> {
  late final TextEditingController _titleController;

  @override
  void initState() {
    _titleController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.givenExercise == null
        ? _titleController.text
        : widget.givenExercise!.name;
    bool custom = true;
    if (widget.givenExercise != null &&
        defaultExercises.contains(widget.givenExercise)) custom = false;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          readOnly: true,
          maxLines: 1,
          controller: _titleController,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            overflow: TextOverflow.ellipsis,
          ),
          decoration: InputDecoration(
            hintText: context.loc.exercise,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ExerciseNameTextField(
                titleController: _titleController, custom: custom),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (widget.givenExercise == null) {
            var newExercise = Exercise(_titleController.text, "Cardio",
                "Cardio", 500 + exercises.length - defaultExercises.length);
            exercises.add(newExercise);
          } else {
            widget.givenExercise!.name = _titleController.text;
          }
          Navigator.pop(context);
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
