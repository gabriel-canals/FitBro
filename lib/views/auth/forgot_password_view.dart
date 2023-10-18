import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';
import 'package:fitbro/utilities/dialogs/error_dialog.dart';
import 'package:fitbro/utilities/dialogs/password_reset_email_sent_dialog.dart';
import 'package:fitbro/utilities/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is ForgotPasswordAuthState) {
          if (state.hasSentEmail) {
            _textEditingController.clear();
            await showPasswordResetSentDialog(context);
          }
          if (state.exception != null) {
            await showErrorDialog(context, context.loc.forgot_password_view_generic_error);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.loc.forgot_password),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(context.loc.forgot_password_view_prompt),
                emailTextField(context, _textEditingController),
                TextButton(
                  onPressed: () {
                    final email = _textEditingController.text;
                    context.read<AuthBloc>().add(ForgottenPasswordAuthEvent(email: email));
                  },
                  child: Text(context.loc.forgot_password_send_me_reset),
                ),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(const LogOutAuthEvent());
                  },
                  child: Text(context.loc.forgot_password_back_to_login),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
