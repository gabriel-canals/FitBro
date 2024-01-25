import 'package:flutter/material.dart';

class SettingsSection {
  String title;
  final Widget? settings;
  bool isExpanded = false;

  void expand() {
    isExpanded = !isExpanded;
  }

  ExpansionPanel toPanel() {
    return ExpansionPanel(
      headerBuilder: (context, isExpanded) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        );
      },
      isExpanded: isExpanded,
      body: SizedBox(height: 320, width: double.infinity, child: settings),
    );
  }

  SettingsSection({
    this.title = '',
    required this.settings,
    this.isExpanded = false,
  });
}

/// Section for logging in users.
class SignOutSettingsSection extends SettingsSection {
  final String email;
  final String password;

  SignOutSettingsSection({
    required this.email,
    required this.password,
    required super.title,
    required super.settings,
  });
}

/// Section if the user wants to change their password.
class AccountSettingsSection extends SettingsSection {
  AccountSettingsSection({
    required super.title,
    required super.settings,
  });
}

/// Section if the user wants to delete their account.
class DeleteAccountSettingsSection extends SettingsSection {
  final String email;
  final String password;
  DeleteAccountSettingsSection({
    required super.title,
    required this.email,
    required this.password,
    required super.settings,
  });
}

/* 
/// Section if the user wants to change the email linked to their account.
class ChangeEmailSettingsSection extends SettingsSection {
  final String? email;
  const ChangeEmailSettingsSection({
    this.email,
  });
}

/// Section in case the user wants to change the app's language.
class ChangeLanguageSettingsSection extends SettingsSection {
  const ChangeLanguageSettingsSection();
}

/// Section in case the user wants to change the app's theme.
class ChangeThemeSettingsSection extends SettingsSection {
  const ChangeThemeSettingsSection();
}

/// Section in case the user wants to switch from metric to imperial system.
class ChangeWeightUnitSettingsSection extends SettingsSection {
  const ChangeWeightUnitSettingsSection();
}

/// Section in case the user wants to switch from metric to imperial system.
class ChangeDistanceUnitSettingsSection extends SettingsSection {
  const ChangeDistanceUnitSettingsSection();
}

/// Section in case the user wants to switch from metric to imperial system.
class ChangeHeightUnitSettingsSection extends SettingsSection {
  const ChangeHeightUnitSettingsSection();
}

/// Section in case the user wants to set the first day of the week.
class WeekFirstDaySettingsSection extends SettingsSection {
  const WeekFirstDaySettingsSection();
}

/// Section in case the user wants to change the default timer properties.
class DefaultTimerSettingsSection extends SettingsSection {
  const DefaultTimerSettingsSection();
} */
