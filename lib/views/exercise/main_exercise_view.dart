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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("data"),
            ),
            const TextButton(onPressed: null, child: Text("data")),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: null, child: Text("data")),
            TextButton(onPressed: null, child: Text("data")),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: null, child: Text("data")),
            TextButton(onPressed: null, child: Text("data")),
          ],
        ),
      ],
    );
  }
}
