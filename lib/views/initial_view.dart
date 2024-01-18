//applocalizations
import 'package:fitbro/constants/colors.dart';
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
        backgroundColor: mainColor,
        title: Text(context.loc.overview),
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
