import 'package:base_de_projet/presentation/home/home.dart';
import 'package:flutter/material.dart';

import 'package:base_de_projet/presentation/sign_in/sign_in.dart';
import 'package:base_de_projet/presentation/splash/splash_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //final auth = watch(authNotifierProvider.notifier);
    //context.read(authNotifierProvider.notifier).authCheckRequested();
    print("Check Initial Request");

    //REMPLACER RIVERPOD ??
    return /* MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: */
        MaterialApp(
      title: 'Base de Projet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.green[800],
        accentColor: Colors.blueAccent,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[900],
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => const SignInPage(),
        '/home': (context) => const HomePage(),
      },
      /* ), */
    );
  }
}
