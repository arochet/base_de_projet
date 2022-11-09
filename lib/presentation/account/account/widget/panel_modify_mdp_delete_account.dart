import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/presentation/core/_core/theme_button.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/_core/router.gr.dart';
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
    return PanelList(list: [
      //Modifier le mot de passe
      if (widget.typeAccount == TypeAccountState.email)
        ItemPanelList(
          title: AppLocalizations.of(context)!.modifiermotdepasse,
          icon: Icons.lock,
          onTap: () {
            context.router.push(ReauthenticateRoute(route: NewPasswordRoute()));
          },
        ),
      //Supprimer le compte
      ItemPanelList(
        title: AppLocalizations.of(context)!.supprimerlecompte,
        icon: Icons.cancel,
        onTap: () => deleteAccount(),
      ),
    ]);
  }

  deleteAccount() {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.annuler, style: Theme.of(context).textTheme.button),
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
      style: buttonNormalRemove,
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
