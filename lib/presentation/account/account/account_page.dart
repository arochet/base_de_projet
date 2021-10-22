import 'package:base_de_projet/domain/auth/user_data.dart';
import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/presentation/account/account/widget/panel_modify_mdp_delete_account.dart';
import 'package:base_de_projet/presentation/components/spacing.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';

import 'widget/button_log_out.dart';
import 'widget/panel_list.dart';
import 'widget/panel_personnel_data.dart';
import 'widget/version_number.dart';
import 'widget/diplay_title.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
    //Rafraichit les données utilisateur lors de l'initialisation
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => context.refresh(currentUserData));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      AsyncValue<UserData?> user = watch(currentUserData);
      //Récupère les données utilisateurs (Informations personnelles)
      String nameUser = "";
      String email = "";
      bool isTypeEmail = false;
      user.when(
        data: (data) {
          if (data != null) {
            nameUser = data.userName.getOrCrash();
            email = data.email.getOrCrash();
            isTypeEmail =
                data.typeAccount.getOrCrash() == TypeAccountState.email;
          }
        },
        loading: () {
          nameUser = "...";
          email = "...";
        },
        error: (err, stack) {
          nameUser = "Error";
          email = "Error";
        },
      );

      //Container Informations personnelles
      return ListView(
        children: <Widget>[
          SpaceH20(),
          //TEXTE COMPTE
          DisplayTitle(title: AppLocalizations.of(context)!.compte),
          //PANEL DONNEES PERSONNELES
          PanelPersonnelData(nameUser: nameUser, email: email),
          //PANEL MODIFIER MOT DE PASSE / SUPPRIMER COMPTE
          PanelModifyMdpDeleteAccount(isTypeEmail: isTypeEmail),
          SpaceH10(),
          //BOUTON SE DECONNECTER
          ButtonLogOut(),
          SpaceH10(),
          VersionNumber(),
        ],
      );
    });
  }

  /* deleteAccount() {
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
  } */
}
