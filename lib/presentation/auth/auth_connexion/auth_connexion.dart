import 'package:base_de_projet/presentation/auth/auth_connexion/widget/auth_connexion_form.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:flutter/material.dart';
import 'widget/auth_button_connexion.dart';
import 'widget/auth_button_facebook.dart';
import 'widget/auth_button_google.dart';
import 'widget/auth_divider_or.dart';
import 'widget/auth_no_account_link.dart';

class AuthConnexionPage extends StatelessWidget {
  const AuthConnexionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APP BAR
      appBar: defaultAppBar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                  builder: (context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Column(
                          children: [
                            //FORM CONNEXION
                            FormConnexionProvider(),
                            //BOUTON SE CONNECTER
                            ButtonConnexion(),
                            const SpaceH10(),
                            //DIVIDER OR
                            DividerOR(),
                            const SpaceH10(),
                            //BUTTON GOOGLE
                            ButtonGoogle(),
                            //BUTTON FACEBOOK
                            ButtonFacebook(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            NoAccountLink(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
