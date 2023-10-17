import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

Future<void> showPasswordResetSentDialog(BuildContext context) {
  return showGenericDialog(
    context: context,
    title: context.loc.password_reset_dialog_prompt,
    content: context.loc.password_reset,
    optionBuilder: () => {
      context.loc.ok: null,
    },
  );
}
