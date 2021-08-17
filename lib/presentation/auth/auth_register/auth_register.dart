import 'package:base_de_projet/presentation/auth/auth_connexion/widget/auth_connexion_form.dart';
import 'package:base_de_projet/presentation/auth/auth_register/widget/auth_register_form.dart';
import 'package:base_de_projet/presentation/core/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 65,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Text("S'inscrire",
                    style: Theme.of(context).textTheme.headline3),
                //FORMULAIRE D'ENREGISTREMENT
                Expanded(child: FormRegisterProvide()),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
