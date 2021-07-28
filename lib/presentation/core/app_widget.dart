import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_de_projet/application/auth/auth_bloc.dart';
import 'package:base_de_projet/injection.dart';
import 'package:base_de_projet/presentation/notes/note_form/note_form_page.dart';
import 'package:base_de_projet/presentation/notes/notes_overview/notes_overview_page.dart';

import 'package:base_de_projet/presentation/sign_in/sign_in.dart';
import 'package:base_de_projet/presentation/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
        )
      ],
      child: MaterialApp(
        title: 'Note',
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
          '/note-overview': (context) => const NotesOverviewPage(),
          '/note-form-page': (context) => const NoteFormPage(),
        },
      ),
    );
  }
}
