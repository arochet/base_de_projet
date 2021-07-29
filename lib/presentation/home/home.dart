import 'package:base_de_projet/application/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
          unauthenticated: (_) =>
              Navigator.pushReplacementNamed(context, '/sign-in'),
          orElse: () {},
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            onPressed: () {
              //context.read<AuthBloc>().add(const AuthEvent.signedOut());
              print("ca marche pas");
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
