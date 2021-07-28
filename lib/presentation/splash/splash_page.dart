import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_de_projet/application/auth/auth_bloc.dart';
import 'package:base_de_projet/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.map(
          initial: (_) => Navigator.pushNamed(context, '/'),
          authenticated: (_) =>
              Navigator.pushReplacementNamed(context, '/note-overview'),
          unauthenticated: (_) =>
              Navigator.pushReplacementNamed(context, '/sign-in'),
        );
      },
      child: const Scaffold(
          body: Center(
        child: CircularProgressIndicator(),
      )),
    );
  }
}
