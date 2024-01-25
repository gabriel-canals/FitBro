import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/extensions/buildcontext/navbar_settings.dart';
import 'package:fitbro/homepage.dart';
import 'package:fitbro/services/auth/bloc/auth_bloc.dart';
import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/tools/settings/settings.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preferences.settingsInit();
  String lang = await preferences.getLanguage();
  runApp(
    MyMaterialApp(languageCode: lang),
  );
}

class MyMaterialApp extends StatelessWidget {
  MyMaterialApp({
    super.key,
    this.languageCode = 'en',
  });

  String languageCode;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale.fromSubtags(languageCode: languageCode),
      debugShowCheckedModeBanner: false,
      title: 'FitBro',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: mainColor2,
            titleTextStyle: TextStyle(
              color: ternaryColor,
              fontWeight: FontWeight.w600,
            )),
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
        configRoute: (context) => const SettingsMenu(),
        historyRoute: (context) => const HistoryView(),
        templatesRoute: (context) => const TemplatesView(),
        goalsRoute: (context) => const GoalsView(),
        exercisesRoute: (context) => const ExerciseView()
      },
    );
  }
}
