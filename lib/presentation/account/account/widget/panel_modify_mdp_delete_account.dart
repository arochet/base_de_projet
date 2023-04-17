import 'package:base_de_projet/DOMAIN/auth/value_objects.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/router.dart';

import 'package:base_de_projet/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'panel_list.dart';

class PanelModifyMdpDeleteAccount extends ConsumerStatefulWidget {
  final TypeAccountState typeAccount;
  const PanelModifyMdpDeleteAccount({Key? key, required this.typeAccount}) : super(key: key);

  @override
  _PanelModifyMdpDeleteAccountState createState() => _PanelModifyMdpDeleteAccountState();
}

class _PanelModifyMdpDeleteAccountState extends ConsumerState<PanelModifyMdpDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return PanelList(title: 'PanelModifyMdpDeleteAccount', list: [
      //Modifier le mot de passe
      if (widget.typeAccount == TypeAccountState.email)
        ItemPanelList(
          title: AppLocalizations.of(context)!.modifiermotdepasse,
          icon: Icons.lock,
          onTap: () {
            printDev();
            context.router.push(ReauthenticateRoute(route: NewPasswordRoute()));
          },
        ),
      //Supprimer le compte
      ItemPanelList(
        title: AppLocalizations.of(context)!.supprimerlecompte,
        icon: Icons.cancel,
        onTap: () {
          printDev();
          deleteAccount();
        },
      ),
    ]);
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.annuler),
      onPressed: () => context.router.pop(),
    );

    Widget continueButton = ElevatedButton(
      onPressed: () async {
        await context.router.pop();
        ref
            .read(authNotifierProvider.notifier)
            .deleteAccount(widget.typeAccount)
            .then((value) => context.router.push(AuthInitRoute()));
      },
      child: Text(AppLocalizations.of(context)!.supprimer),
      style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context)!.attention),
      content: Text(AppLocalizations.of(context)!.etesvoussurdevouloursupprimervotrecomte),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
