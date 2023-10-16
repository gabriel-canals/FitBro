import 'package:fitbro/extensions/buildcontext/loc.dart';
import 'package:fitbro/utilities/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';

/// Dialog in case a generic error occurs.
Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
      context: context,
      title: context.loc.generic_error,
      content: text,
      optionBuilder: () => {
            /// Ok option will be enough.
            context.loc.ok: null,
          });
}
