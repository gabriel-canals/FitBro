import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/utilities/main_navbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(configRoute,
                    arguments: context.read<AuthBloc>());
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
      body: NavigationBarApp(context: context),
    );
  }
}
