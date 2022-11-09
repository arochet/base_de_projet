import 'package:base_de_projet/presentation/core/_core/router.gr.dart';
import 'package:base_de_projet/presentation/core/_core/theme_colors.dart';
import 'package:base_de_projet/presentation/core/_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'none_transition_builder.dart';
import 'router.dart';

final _appRouter = AppRouter();

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp.router(
      title: 'Base de Projet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: colorpanel(900),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: colorpanel(700),
          filled: true,
          focusColor: Colors.red,
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.macOS: NonePageTransitionsBuilder(),
          TargetPlatform.windows: NonePageTransitionsBuilder(),
          TargetPlatform.linux: NonePageTransitionsBuilder(),
        }),
        textTheme: theme.textTheme.copyWith(
          headline2: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline3: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline5: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          headline6: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: colorpanel(50),
          ),
          subtitle1: TextStyle(
            color: colorpanel(50),
          ),
          button: TextStyle(
            color: colorpanel(50),
          ),
          bodyText1: TextStyle(
            color: colorpanel(50),
          ),
        ),
      ),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
