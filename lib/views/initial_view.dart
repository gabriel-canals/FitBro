import 'package:fitbro/utilities/main_navbar.dart';

import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: const FractionalOffset(0.05, 0),
          child: Text(
            context.loc.overview,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pushNamed(configRoute);
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: NavigationBarApp(context: context),
    );
  }
}