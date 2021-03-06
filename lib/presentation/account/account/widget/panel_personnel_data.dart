import 'package:base_de_projet/domain/auth/value_objects.dart';
import 'package:base_de_projet/presentation/core/theme_button.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelPersonnelData extends StatelessWidget {
  const PanelPersonnelData({
    Key? key,
    required this.nameUser,
    required this.email,
    required this.typeAccount,
  }) : super(key: key);

  final String nameUser;
  final String? email;
  final TypeAccountState typeAccount;

  @override
  Widget build(BuildContext context) {
    String typeAc = "";
    switch (typeAccount) {
      case TypeAccountState.google:
        typeAc = AppLocalizations.of(context)!.connecteeavecgoogle;
        break;
      case TypeAccountState.facebook:
        typeAc = AppLocalizations.of(context)!.connecteeavecfacebook;
        break;
      default:
        typeAc = "";
        break;
    }
    return PanelList(
      list: [
        if (typeAccount == TypeAccountState.google ||
            typeAccount == TypeAccountState.facebook)
          ItemPanelList(
            title: typeAc,
            icon: Icons.manage_accounts,
            onTap: () {},
          ),
        ItemPanelList(
          title: nameUser,
          icon: Icons.account_circle_rounded,
          onTap: () {},
        ),
        if (email != null)
          ItemPanelList(
            title: email!,
            icon: Icons.mail_rounded,
            onTap: () {},
          ),
      ],
      //Bouton modifier
      button: ElevatedButton(
        onPressed: () {
          context.router.push(ModifyAccountRoute());
        },
        style: buttonPrimaryHide,
        child: Text(AppLocalizations.of(context)!.modifier),
      ),
    );
  }
}
