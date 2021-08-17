import 'package:base_de_projet/application/auth/auth_notifier.dart';
import 'package:base_de_projet/domain/auth/user.dart';
import 'package:base_de_projet/presentation/core/router.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: authNotifierProvider,
      onChange: (context, AuthState myAuthState) {
        if (!(myAuthState is AuthAuthenticated)) {
          print("Page Home - State $myAuthState");
          Future.delayed(Duration.zero, () {
            Navigator.pushReplacementNamed(context, AppRouter.authInit);
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          leading: IconButton(
            onPressed: () {
              context.read(authNotifierProvider.notifier).signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ),
        body: Center(
          child: DispCurrentUser(),
        ),
      ),
    );
  }
}

class DispCurrentUser extends ConsumerWidget {
  const DispCurrentUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    AsyncValue<User> user = watch(currentUser);

    return user.when(
      data: (u) => Text("Current User : ${u.id.getOrCrash()}"),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text("Error : $err"),
    );
  }
}
