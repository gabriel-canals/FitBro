import 'dart:async';

import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/helpers/loading/loading_screen.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
import 'package:fitbro/views/login_view.dart';
import 'package:fitbro/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const InitializeAuthEvent());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? context.loc.waiting,
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoggedInAuthState) {
              return const LoginView();
            } else if (state is RegisteringAuthState) {
              return const RegisterView();
            } else {
              final text0 = StreamController<String>();
              text0.add(context.loc.waiting);
              Size size = MediaQuery.of(context).size;
              return Scaffold(
                backgroundColor: mainColor.withAlpha(95),
                body: LoadingScreen().loadingOverlay(size, text0),
              );
            }
          },
        );
      },
    );
  }
}
