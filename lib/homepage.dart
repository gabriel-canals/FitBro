import 'dart:async';

import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/helpers/loading/loading_screen.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
import 'package:fitbro/utilities/main_navbar.dart';
import 'package:fitbro/views/auth/forgot_password_view.dart';
import 'package:fitbro/views/auth/login_view.dart';
import 'package:fitbro/views/auth/register_view.dart';
import 'package:fitbro/views/auth/verify_email_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Fitbro's HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// Initialize AuthService.
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
        /// BLoC builder depending on the state of the AuthService.
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is LoggedInAuthState) {
              /// Auth granted. User can access FitBro.
              return NavigationBarApp(context: context);
            } else if (state is RegisteringAuthState) {
              return const RegisterView();
            } else if (state is LoggedOutAuthState) {
              return const LoginView();
            } else if (state is ForgotPasswordAuthState) {
              return const ForgotPasswordView();
            } else if (state is NeedsVerificationAuthState) {
              /// User registered but email not verified.
              return const VerifyEmailView();
            } else {
              /// Loading screen in case no other AuthState provided.
              final text0 = StreamController<String>();
              text0.add(context.loc.waiting);
              Size size = MediaQuery.of(context).size;
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: mainColor,
                ),
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
