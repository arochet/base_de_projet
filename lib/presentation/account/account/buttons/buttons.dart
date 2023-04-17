import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/spacing.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ButtonsPage extends StatelessWidget {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowComponentFile(
      title: 'account/account/buttons/buttons.dart',
      child: MainScaffold(
        title: AppLocalizations.of(context)!.nomprojet,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(children: [
            Text("PRESENTATION/core/_core/theme_buttons", style: Theme.of(context).textTheme.titleSmall),
            SpaceH20(),
            ElevatedButton(
              onPressed: () {
                printDev();
              },
              child: Text("ElevatedButton Primary"),
              style: null,
            ),
            ElevatedButton(
              onPressed: () {
                printDev();
              },
              child: Text("ElevatedButton Warning"),
              style: Theme.of(context).extension<AppThemeExtention>()?.buttonWarning,
            ),
            ElevatedButton(
              onPressed: () {
                printDev();
              },
              child: Text("ElevatedButton Remove"),
              style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
            ),
            ElevatedButton(
              onPressed: () {
                printDev();
              },
              child: Text("ElevatedButton Help"),
              style: Theme.of(context).extension<AppThemeExtention>()?.buttonHelp,
            ),
            TextButton(
                onPressed: () {
                  printDev();
                },
                child: Text("TextButton")),
          ]),
        ),
      ),
    );
  }
}
