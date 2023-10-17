import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/helpers/loading/loading_screen.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
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
          LoadingScreen().show(context: context, text: state.loadingText ?? context.loc.waiting);
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return const RegisterView();
           // switch (state) {
           //   case LoggedInAuthState:
           //     return const MainView();
           //   case LoggedOutAuthState:
           //     return const LoginView();
           //   case 
           // }
          },
        );
      },
    );
  }
}