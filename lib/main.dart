import 'package:fitbro/homepage.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:fitbro/views/config/settings_menu_view.dart';
import 'package:fitbro/views/oveview_view.dart';
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
        primarySwatch: preferences.getMainColor(),
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: {
        overviewPageRoute: (context) => const OverviewView(),
        configRoute: (context) => SettingsMenu(),
      },
    ),
  );
}
