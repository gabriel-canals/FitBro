import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/views/initial_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  late TextEditingController _username;

  /// Initializes the attributes.
  @override
  void initState() {
    _username = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc =
        ModalRoute.of(context)!.settings.arguments as AuthBloc;

    return GridView.count(
      crossAxisCount: 1,
      childAspectRatio: 3,
      primary: false,
      children: <Widget>[
        TextFormField(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
          controller: _username
            ..text = FirebaseAuth.instance.currentUser!.displayName!,
          enableSuggestions: true,
          autocorrect: false,
          autofocus: true,
          keyboardType: TextInputType.name,
          maxLength: 32,
          decoration: InputDecoration(
            hintText: context.loc.username_text_field_placeholder,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z 0-9_]+$')),
          ],
        ),

        TextButton(
            onPressed: () {
              FirebaseAuthProvider().changeUsername(username: _username.text);
              InitialView();
            },
            style: ButtonStyle(
                minimumSize: MaterialStatePropertyAll(
                  Size(MediaQuery.of(context).size.width / 1.4, 1),
                ),
                backgroundColor: const MaterialStatePropertyAll(Colors.blue),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                    side: BorderSide.none))),
            child: Text(
              context.loc.logout,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 16),
            )),
        SettingText(title: context.loc.email_text_field_placeholder),
        SettingText(title: context.loc.password_reset),
        SettingText(title: context.loc.email_text_field_placeholder),
        // Nombre de usuario
        // Cambiar email
        // Cambiar contraseña
        // Borrar cuenta
      ],
    );
  }
}

class SettingText extends StatelessWidget {
  const SettingText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const SizedBox(width: 10),
      Align(
        alignment: const Alignment(-1, 0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ]);
  }
}
