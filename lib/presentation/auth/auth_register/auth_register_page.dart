import 'package:base_de_projet/PRESENTATION/auth/auth_register/widget/auth_register_form.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthRegisterPage extends StatelessWidget {
  const AuthRegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.sinscrire,
      child: ShowComponentFile(
        title: 'auth/auth_register/auth_register.dart',
        child: FormRegisterProvide(),
      ),
    );
  }
}
