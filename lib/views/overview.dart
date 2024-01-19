import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        ),
        SizedBox(
          child: TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(
                    const LogOutAuthEvent(),
                  );
            },
            child: const Text("data"),
          ),
        ),
      ],
    );
  }
}
