import 'package:fitbro/services/auth/auth_exceptions.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
import 'package:fitbro/utilities/dialogs/error_dialog.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// View when a user is creating their account.
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  /// Initializes the attributes.
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  /// Removes the object.
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      /// Check error in current state.
      listener: errorChecker,
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.register),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.loc.register_view_prompt),

                /// Text field to introduce the user's email address.
                emailTextField(context, _email),

                /// Text field to introduce the user's password.
                passwordTextField(context, _password),
                Center(
                  child: Column(
                    /// On click, this button will try to create a new user
                    /// with the given email and password.
                    children: [registerButton(context), alreadyRegisteredButton(context)],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// On click, this button will send the user to the LogInView.
  TextButton alreadyRegisteredButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.read<AuthBloc>().add(const LogOutAuthEvent());
      },
      child: Text(context.loc.register_view_already_registered),
    );
  }

  /// On click, this button will try to create a new user
  /// with the given email and password.
  TextButton registerButton(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final email = _email.text;
        final password = _password.text;

        /// Calls the Register event in the Authentication Provider.
        context.read<AuthBloc>().add(RegisterAuthEvent(
              email,
              password,
            ));
      },
      child: Text(context.loc.register),
    );
  }

  /// Checks if there is an error in the current state and displays it.
  void errorChecker(context, state) async {
    if (state is RegisteringAuthState) {
      if (state.exception is WeakPasswordAuthException) {
        await showErrorDialog(context, context.loc.register_weak_password_error);
      } else if (state.exception is AlreadyInUseEmailAuthException) {
        await showErrorDialog(context, context.loc.register_email_in_use_error);
      } else if (state.exception is InvalidEmailAuthException) {
        await showErrorDialog(context, context.loc.register_invalid_email_error);
      } else if (state.exception is GenericAuthException) {
        await showErrorDialog(context, context.loc.register_generic_error);
      }
    }
  }
}
