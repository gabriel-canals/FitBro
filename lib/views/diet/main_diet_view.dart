import 'package:flutter/material.dart';

class DietView extends StatefulWidget {
  const DietView({super.key});

  @override
  State<DietView> createState() => _DietViewState();
}

class _DietViewState extends State<DietView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [],
        ),
        body: const Center(
          child: Text("Diet"),
        ));
  }
}
