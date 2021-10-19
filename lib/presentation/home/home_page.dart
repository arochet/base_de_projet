import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/components/show_environment_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CheckUserConnected(
      child: ShowEnvironment(
        child: Center(
          child: Text("Base de projet",
              style: Theme.of(context).textTheme.headline3),
        ),
      ),
    );
  }
}
