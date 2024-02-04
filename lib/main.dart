// ignore_for_file: must_be_immutable

import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/navbar_settings.dart';
import 'package:fitbro/homepage.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/tools/settings/settings.dart';
import 'package:fitbro/views/exercise/exercises_view.dart';
import 'package:fitbro/views/exercise/goals_view.dart';
import 'package:fitbro/views/exercise/history_view.dart';
import 'package:fitbro/views/exercise/templates_view.dart';
import 'package:fitbro/views/view_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/routes.dart';

/// FitBro's main function.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Start user's preferences and get preferred language.
  await preferences.settingsInit();
  String lang = await preferences.getLanguage();
  runApp(
    MyMaterialApp(languageCode: lang),
  );
}

/// Fitbro's MaterialApp.
class MyMaterialApp extends StatelessWidget {
  /// By default, the starting language is English **(temp)**.
  MyMaterialApp({
    super.key,
    this.languageCode = 'en',
  });

  /// Language identifier following ISO 639.
  String languageCode;

  @override
  Widget build(BuildContext context) {
    /// Fitbro only allows vertical orientation.
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      /// Initialization of AppLocalizations services.
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale.fromSubtags(languageCode: languageCode),
      debugShowCheckedModeBanner: false,
      title: 'FitBro',
      theme: ThemeData(
        /// FitBro's main text font.
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: mainColor2,
            titleTextStyle: TextStyle(
              color: ternaryColor,
              fontWeight: FontWeight.w600,
            )),

        colorScheme: fitbroColorScheme(),
        useMaterial3: true,
        primarySwatch: preferences.getMainColor(),
        navigationBarTheme: defaultNavBarSettings(),
      ),
      home: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const HomePage(),
      ),
      routes: fitbroRoutes,
    );
  }

  /// Routes for Navigation purposes.
  ///
  /// This route can be found in `fitbro/lib/constants/routes.dart`.
  /// 
  /// - [configRoute]: route to the Settings menu.
  /// - [historyRoute]: route to the training history.
  /// - [templatesRoute]: route to the training goals menu.
  /// - [exercisesRoute]: route to the Exercise list.
  Map<String, WidgetBuilder> get fitbroRoutes {
    return {
      configRoute: (context) => const SettingsMenu(),
      historyRoute: (context) => const HistoryView(),
      templatesRoute: (context) => const TemplatesView(),
      goalsRoute: (context) => const GoalsView(),
      exercisesRoute: (context) => const ExercisesView()
    };
  }

  /// Colors used in Fitbro **(temp)**.
  ///
  /// This colors are defined in `fitbro/lib/constants/colors.dart`.
  ColorScheme fitbroColorScheme() {
    return ColorScheme(
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
        onSurface: secondaryColor);
  }
}