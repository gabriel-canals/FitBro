import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// The user will insert their email here.
TextField emailTextField(BuildContext context, TextEditingController email) {
  return TextField(
    controller: email,
    enableSuggestions: true,
    autocorrect: false,
    autofocus: true,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      hintText: context.loc.email_text_field_placeholder,
    ),
  );
}

/// The user will insert their password here.
TextField passwordTextField(
    BuildContext context, TextEditingController password) {
  return TextField(
    controller: password,
    obscureText: true,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
      hintText: context.loc.password_text_field_placeholder,
    ),
  );
}

/// The user will insert their username here.
TextFormField usernameTextField(
    BuildContext context, TextEditingController username) {
  return TextFormField(
    controller: username,
    enableSuggestions: true,
    autocorrect: false,
    autofocus: true,
    keyboardType: TextInputType.name,
    maxLength: 32,
    decoration: InputDecoration(
      hintText: context.loc.username_text_field_placeholder,
    ),
    inputFormatters: <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z 0-9_]+$')),
    ],
  );
}

class ExerciseNameTextField extends StatelessWidget {
  const ExerciseNameTextField(
      {super.key,
      required TextEditingController titleController,
      required this.custom})
      : _titleController = titleController;

  final TextEditingController _titleController;
  final bool custom;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: custom,
      controller: _titleController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      cursorColor: Colors.grey,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      decoration: InputDecoration(
        helperText: "Default",
        helperStyle: TextStyle(fontSize: custom ? 0 : 12, color: Colors.white),
        labelText: "Exercise name",
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
