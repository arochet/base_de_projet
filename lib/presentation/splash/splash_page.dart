import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authNotifierProvider);

    print("splash screen $authState");

    if (authState is AuthAuthenticated) {
      Future.delayed(Duration.zero, () async {
        Navigator.pushReplacementNamed(context, '/home');
      });
    } else if (authState is AuthUnauthenticated) {
      Future.delayed(Duration.zero, () async {
        Navigator.pushReplacementNamed(context, '/sign-in');
      });
    }
    /* else if (authState is AuthInital) {
      Future.delayed(Duration.zero, () async {
        //Navigator.pushReplacementNamed(context, '/');
      });
    } */
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
