import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/services/auth/auth_exceptions.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
import 'package:fitbro/utilities/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fitbro/utilities/dialogs/error_dialog.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart' show AuthBloc;

/// The user will see this view when their is logged out.
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(

        /// Checking errors is needed in case a bad email/password provided.
        listener: errorChecker,
        child: Scaffold(
          appBar: AppBar(
            title: Text(context.loc.login),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(context.loc.login_view_prompt),

                  /// Text field to introduce the user's email address.
                  emailTextField(context, _email),

                  /// Text field to introduce the user's password.
                  passwordTextField(context, _password),
                  Center(
                    child: Column(
                      /// On click, this button will try to log the user in
                      /// with the given email and password.
                      children: [
                        loginButton(context),
                        notRegisteredButton(context),
                        forgottenPasswordButton(context),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  /// In case the user has forgotten their passsword.
  TextButton forgottenPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBloc>().add(
              const ForgottenPasswordAuthEvent(),
            );
      },
      child: Text(context.loc.login_view_forgot_password),
    );
  }

  /// In case the user is not registered yet.
  TextButton notRegisteredButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBloc>().add(
              const ShouldRegisterAuthEvent(),
            );
      },
      child: Text(context.loc.login_view_not_registered_yet),
    );
  }

  /// Checks if there is an error in the current state and displays it.
  void errorChecker(context, state) async {
    if (state is LoggedOutAuthState) {
      if (state is UserNotFoundAuthException) {
        await showErrorDialog(context, context.loc.login_user_not_found_error);
      } else if (state is WrongPasswordAuthException) {
        await showErrorDialog(context, context.loc.login_wrong_password_error);
      } else if (state is GenericAuthException) {
        await showErrorDialog(context, context.loc.login_generic_error);
      }
    }
  }

  /// On click, this button will try to log a user into their account.
  TextButton loginButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final email = _email.text;
        final password = _password.text;

        /// Calls the Register event in the Authentication Provider.
        context.read<AuthBloc>().add(LogInAuthEvent(
              email,
              password,
            ));
      },
      child: Text(context.loc.login),
    );
  }
}
