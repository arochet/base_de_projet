import 'package:base_de_projet/presentation/core/theme.dart';
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
  }) : super(key: key);

  final String nameUser;
  final String email;

  @override
  Widget build(BuildContext context) {
    return PanelList(
      list: [
        ItemPanelList(
          title: nameUser,
          icon: Icons.account_circle_rounded,
          onTap: () {},
        ),
        ItemPanelList(
          title: email,
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
