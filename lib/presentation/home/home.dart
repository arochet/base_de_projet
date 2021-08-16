import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /* //final auth = watch();
    final authState = watch(authNotifierProvider);

    //Vérifie que l'on est authentifié
    if (!(authState is AuthAuthenticated)) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/sign-in');
      });

      return Scaffold(
        body: Center(
          child: Text("Unauthentificated !"),
        ),
      );
    } */
    //TODO => Vérifier que l'on est bien authentifié sur cette page !
    return ProviderListener(
      //DELETE !! ??
      provider: authNotifierProvider,
      onChange: (context, myAuthState) {
        if (!(myAuthState is AuthAuthenticated)) {
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacementNamed(context, '/sign-in');
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            onPressed: () {
              context.read(authNotifierProvider.notifier).signOut();
              //auth.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
        body: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
