import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/PRESENTATION/account/aproposapplication/aproposapplication_page.dart';
import 'package:base_de_projet/PRESENTATION/account/termsofuse/termsofuse_page.dart';
import 'package:base_de_projet/PRESENTATION/core/core/router.dart';
import 'package:base_de_projet/PRESENTATION/core/utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'panel_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PanelRGPD extends StatelessWidget {
  const PanelRGPD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PanelList(
      title: 'PanelRGPD',
      list: [
        ItemPanelList(
          title: AppLocalizations.of(context)!.conditionutilisation,
          icon: Icons.book,
          onTap: () {
            printDev();
            context.router.push(TermsofuseRoute());
          },
        ),
        ItemPanelList(
          title: AppLocalizations.of(context)!.aproposapplication,
          icon: Icons.info,
          onTap: () {
            printDev();
            context.router.push(AproposapplicationRoute());
          },
        ),
      ],
    );
  }
}
