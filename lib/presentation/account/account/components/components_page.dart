import 'package:base_de_projet/PRESENTATION/core/_components/spacing.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Components',
      child: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Text("Base PDF", style: Theme.of(context).textTheme.bodyText1),
            Text("Sert à créer un PDF", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Constrained Box Max Width", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Default Panel", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Is Connected Widget", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Main Home Title", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Main Scaffold", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Show Environnement Widget", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Some Widget", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("Spacing", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("SpaceH10", style: Theme.of(context).textTheme.bodyText1),
            SpaceH10(),
            Text("SpaceH20", style: Theme.of(context).textTheme.bodyText1),
            SpaceH20(),
            Text("SpaceH30", style: Theme.of(context).textTheme.bodyText1),
            SpaceH30(),
            Text("----", style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ),
    );
  }
}
