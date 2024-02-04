import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbro/constants/routes.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// User's overview.
///
/// This is the first screen the user will see when logged in.
/// Contains a summary of the user's training history and goals **(to be implemented)**.
class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          /// Access to the Settings menu.
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(configRoute,
                    arguments: context.read<AuthBloc>());

                /// Change state of the Overview view when exiting the Settings menu.
                setState(() {});
              },
              icon: const Icon(Icons.settings)),
        ],
      ),

      /// Current placeholder.
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              title: Text(
                FirebaseAuth.instance.currentUser!.displayName!,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
