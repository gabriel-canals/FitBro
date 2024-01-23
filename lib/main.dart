import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/navbar_settings.dart';
import 'package:fitbro/homepage.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:fitbro/views/view_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'constants/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.settingsInit();
  runApp(
    MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      title: 'FitBro',
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: secondaryColor,
            onPrimary: secondaryColor,
            secondary: ternaryColor,
            onSecondary: ternaryColor,
            error: Colors.red,
            onError: Colors.red,
            background: mainColor,
            onBackground: mainColor,
            surface: secondaryColor,
            onSurface: secondaryColor),
        useMaterial3: true,
        primarySwatch: preferences.getMainColor(),
        navigationBarTheme: defaultNavBarSettings(),
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        configRoute: (context) => SettingsMenu(),
      },
    ),
  );
}
