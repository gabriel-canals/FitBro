import 'package:flutter/material.dart';

typedef DialogOptionBuilder<T> = Map<String, T?> Function();

/// Represents a generic dialog.
Future<T?> showGenericDialog<T>({
  /// In a certain context.
  required BuildContext context,
  /// It will require a title.
  required String title,
  /// And some content.
  required String content,
  /// Some options will be provided in every situation.
  required DialogOptionBuilder optionBuilder,
}) {
  final options = optionBuilder();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: options.keys.map((optionTitle) {
          final value = options[optionTitle];
          /// For every option, a button will be displayed.
          return TextButton(onPressed: () {
            if (value != null) {
              Navigator.of(context).pop(value);
            } else {
              /// Closes the dialog and does nothing.
              Navigator.of(context).pop();
            }
          }, child: Text(optionTitle));
        }).toList(),
      );
    },
  );
}
