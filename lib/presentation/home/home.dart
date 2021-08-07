import 'package:base_de_projet/application/auth/auth_bloc.dart';
import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final auth = watch(authNotifierProvider.notifier);
    final authState = watch(authNotifierProvider);

    //Vérifie que l'on est authentifié
    print("auth state ${auth.state}");
    if (!(authState is AuthAuthenticated)) {
      print("Error: unauthentificated !");
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/sign-in');
      });

      return Scaffold(
        body: Center(
          child: Text("Unauthentificated !"),
        ),
      );
    }
    //TODO => Vérifier que l'on est bien authentifié sur cette page !
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        leading: IconButton(
          onPressed: () {
            auth.signOut();
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
