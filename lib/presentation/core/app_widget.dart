import 'package:base_de_projet/presentation/auth/auth_connexion/auth_connexion.dart';
import 'package:base_de_projet/presentation/auth/auth_init/auth_init.dart';
import 'package:base_de_projet/presentation/auth/auth_register/auth_register.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:base_de_projet/presentation/home/home.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:flutter/material.dart';

import 'package:base_de_projet/presentation/auth/sign_in/sign_in.dart';
import 'package:base_de_projet/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      title: 'Base de Projet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Color.fromARGB(255, 230, 230, 230),
            filled: true,
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          textTheme: theme.textTheme.copyWith(
            headline2: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline3: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            button: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: buttonMain,
          )),
      initialRoute: AppRouter.defaultPath,
      routes: {
        AppRouter.defaultPath: (context) => const SplashPage(),
        AppRouter.signIn: (context) => const SignInPage(),
        AppRouter.authInit: (context) => const AuthInitPage(),
        AppRouter.authConnexion: (context) => const AuthConnexionPage(),
        AppRouter.authRegister: (context) => const AuthRegisterPage(),
        AppRouter.home: (context) => const HomePage(),
      },
    );
  }
}
