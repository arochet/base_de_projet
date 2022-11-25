import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/spacing.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: AppLocalizations.of(context)!.nomprojet,
      child: ShowComponentFile(
        title: 'account/account/colors/colors.dart',
        child: Padding(
            padding: EdgeInsets.all(15),
            child: ListView(
              children: [
                Text("PRESENTATION/core/_core/theme_colors", style: Theme.of(context).textTheme.headline5),
                SpaceH20(),
                _DisplayColor("colorpanel(900)", colorpanel(900) ?? Colors.pink),
                _DisplayColor("colorpanel(800)", colorpanel(800) ?? Colors.pink),
                _DisplayColor("colorpanel(700)", colorpanel(700) ?? Colors.pink),
                _DisplayColor("colorpanel(600)", colorpanel(600) ?? Colors.pink),
                _DisplayColor("colorpanel(500)", colorpanel(500) ?? Colors.pink),
                _DisplayColor("colorpanel(400)", colorpanel(400) ?? Colors.pink),
                _DisplayColor("colorpanel(300)", colorpanel(300) ?? Colors.pink),
                _DisplayColor("colorpanel(200)", colorpanel(200) ?? Colors.pink),
                _DisplayColor("colorpanel(100)", colorpanel(100) ?? Colors.pink),
                _DisplayColor("colorpanel(50)", colorpanel(50) ?? Colors.pink),
                _DisplayColor("actioncolor['primary']", actioncolor['primary'] ?? Colors.pink),
                _DisplayColor("actioncolor['secondary']", actioncolor['secondary'] ?? Colors.pink),
                _DisplayColor("actioncolor['tertiary']", actioncolor['tertiary'] ?? Colors.pink),
                _DisplayColor("actioncolor['warning']", actioncolor['warning'] ?? Colors.pink),
                _DisplayColor("actioncolor['remove']", actioncolor['remove'] ?? Colors.pink),
                _DisplayColor("actioncolor['help']", actioncolor['help'] ?? Colors.pink),
                _DisplayColor("palettecolor[0]", palettecolor[0]),
                _DisplayColor("palettecolor[1]", palettecolor[1]),
                _DisplayColor("palettecolor[2]", palettecolor[2]),
                _DisplayColor("palettecolor[3]", palettecolor[3]),
                _DisplayColor("palettecolor[4]", palettecolor[4]),
                _DisplayColor("palettecolor[5]", palettecolor[5]),
              ],
            )),
      ),
    );
  }
}

class _DisplayColor extends StatelessWidget {
  String title;
  Color color;
  _DisplayColor(
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          color: color,
          child: Center(
              child:
                  Text(title, style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.black))),
        ),
        SpaceH10(),
      ],
    );
  }
}
