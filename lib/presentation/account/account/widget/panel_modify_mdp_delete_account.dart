import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

import 'panel_list.dart';

class PanelModifyMdpDeleteAccount extends StatefulWidget {
  final bool isTypeEmail;
  const PanelModifyMdpDeleteAccount({Key? key, required this.isTypeEmail})
      : super(key: key);

  @override
  State<PanelModifyMdpDeleteAccount> createState() =>
      _PanelModifyMdpDeleteAccountState();
}

class _PanelModifyMdpDeleteAccountState
    extends State<PanelModifyMdpDeleteAccount> {
  @override
  Widget build(BuildContext context) {
    return widget.isTypeEmail
        ? PanelList(list: [
            //Modifier le mot de passe
            ItemPanelList(
              title: AppLocalizations.of(context)!.modifiermotdepasse,
              icon: Icons.lock,
              onTap: () {
                context.router
                    .push(ReauthenticateRoute(route: NewPasswordRoute()));
              },
            ),
            //Supprimer le compte
            ItemPanelList(
              title: AppLocalizations.of(context)!.supprimerlecompte,
              icon: Icons.cancel,
              onTap: () => deleteAccount(),
            ),
          ])
        : Container();
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.annuler,
          style: Theme.of(context).textTheme.button),
      onPressed: () => context.router.pop(),
    );
    Widget continueButton = TextButton(
      child: Text(AppLocalizations.of(context)!.supprimer,
          style:
              Theme.of(context).textTheme.button?.copyWith(color: Colors.red)),
      onPressed: () async {
        await context.router.pop();
        context.router.push(ReauthenticateRoute(route: DeleteAccountRoute()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(AppLocalizations.of(context)!.attention),
      content: Text(AppLocalizations.of(context)!
          .etesvoussurdevouloursupprimervotrecomte),
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
