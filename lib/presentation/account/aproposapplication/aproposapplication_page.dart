import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AproposapplicationPage extends StatelessWidget {
  const AproposapplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.aproposapplication,
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text('insert-code'),
        ),
      ),
    );
  }
}
