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
