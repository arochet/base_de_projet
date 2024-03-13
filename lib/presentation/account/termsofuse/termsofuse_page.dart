import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/components/show_component_file.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;

@RoutePage()
class TermsofusePage extends StatelessWidget {
  const TermsofusePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('conditoin cehim : ${AppLocalizations.of(context)!.chemin_text_conditionutilisation}');
    return MainScaffold(
      title: AppLocalizations.of(context)!.conditionutilisation,
      child: ShowComponentFile(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: rootBundle.loadString(AppLocalizations.of(context)!.chemin_text_conditionutilisation),
            builder: (context, async) {
              return SingleChildScrollView(
                child: HtmlWidget(
                  async.data.toString(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
