import 'package:base_de_projet/presentation/auth/auth_register/widget/auth_register_form.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:flutter/material.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

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
