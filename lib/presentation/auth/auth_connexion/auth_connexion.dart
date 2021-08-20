import 'package:base_de_projet/presentation/auth/auth_connexion/widget/auth_connexion_form.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';

class AuthConnexionPage extends StatelessWidget {
  const AuthConnexionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: defaultAppBar,
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text("Se connecter",
                    style: Theme.of(context).textTheme.headline3),
                //FORMULAIRE DE CONNEXION
                Expanded(child: FormConnexionProvide()),
              ],
            )),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Container(
                    child: Column(
                      children: [
                        //BOUTON SE CONNECTER
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read(signInFormNotifierProvider.notifier)
                                .signInWithEmailAndPasswordPressed();
                          },
                          style: buttonPrimaryBig,
                          child: const Text('Se Connecter'),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
