import 'package:fitbro/constants/colors.dart';
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: TextButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: MaterialStateProperty.all(mainColor),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.abc),
                    Text(
                      "objetivos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: TextButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: MaterialStateProperty.all(mainColor),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.abc),
                    Text(
                      "objetivos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: TextButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: MaterialStateProperty.all(mainColor),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.abc),
                    Text(
                      "objetivos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 25),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: TextButton(
                onPressed: null,
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
                  backgroundColor: MaterialStateProperty.all(mainColor),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.abc),
                    Text(
                      "objetivos",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
          width: (MediaQuery.of(context).size.width / 2.5 * 2 + 25),
          child: TextButton(
            onPressed: null,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0))),
              backgroundColor: MaterialStateProperty.all(mainColor),
            ),
            child: const Column(
              children: [
                Icon(Icons.abc),
                Text(
                  "objetivos",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
