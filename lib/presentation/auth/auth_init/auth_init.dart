import 'package:base_de_projet/presentation/auth/auth_connexion/auth_connexion.dart';
import 'package:base_de_projet/presentation/core/_components/show_environment_widget.dart';
import 'package:base_de_projet/presentation/core/_core/theme_button.dart';
import 'package:base_de_projet/presentation/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/_core/router.gr.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthInitPage extends StatelessWidget {
  const AuthInitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Scaffold(
        backgroundColor: colorpanel(900),
        body: SafeArea(
          child: ShowEnvironment(child: PanelInit()),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: colorpanel(900),
        body: SafeArea(
          child: ShowEnvironment(
            child: Row(
              children: [
                Expanded(child: PanelInit()),
                Expanded(child: PanelConnexion()),
              ],
            ),
          ),
        ),
      );
    }
  }
}

class PanelInit extends StatelessWidget {
  const PanelInit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Base de projet", style: Theme.of(context).textTheme.headline2),
              SizedBox(height: 20),
              Image(
                image: AssetImage("assets/logo_vide.png"),
                height: 120,
              ),
            ],
          ),
        ),
        if (!kIsWeb)
          Container(
              constraints: BoxConstraints(maxWidth: 400),
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: const EdgeInsets.all(38.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => context.router.push(AuthConnexionRoute()),
                    style: buttonBigPrimary,
                    child: Text(AppLocalizations.of(context)!.commencer),
                  ),
                ),
              ))
      ],
    );
  }
}
