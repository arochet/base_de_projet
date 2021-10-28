import 'package:base_de_projet/presentation/account/modify_account/modify_account_form.dart';
import 'package:base_de_projet/presentation/components/some_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ModifyAccountPage extends StatefulWidget {
  const ModifyAccountPage({Key? key}) : super(key: key);

  @override
  _ModifyAccountPageState createState() => _ModifyAccountPageState();
}

class _ModifyAccountPageState extends State<ModifyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(context, AppLocalizations.of(context)!.modifierprofil),
      body: ModifyAccountForm(),
    );
  }
}