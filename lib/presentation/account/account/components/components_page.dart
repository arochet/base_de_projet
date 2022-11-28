import 'package:base_de_projet/PRESENTATION/core/_components/contrained_box_max_width.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/default_panel.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/is_connected_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_home_title.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/spacing.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/main_scaffold.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      title: 'Components',
      child: ShowComponentFile(
        title: 'account/account/components/components_page.dart',
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Text("Base PDF", style: Theme.of(context).textTheme.bodyText1),
              Text("Sert à créer un PDF", style: Theme.of(context).textTheme.bodyText1),
              SpaceH10(),
              Text("Constrained Box Max Width", style: Theme.of(context).textTheme.bodyText1),
              ContrainedBoxMaxWidth(
                  child: Container(
                color: Colors.red,
                height: 10,
              )),
              SpaceH10(),
              Text("Default Panel", style: Theme.of(context).textTheme.bodyText1),
              DefaultPanel(
                  child: Center(
                child: Text("DefaultPanel()", style: Theme.of(context).textTheme.bodyText1),
              )),
              SpaceH10(),
              Text("Is Connected Widget", style: Theme.of(context).textTheme.bodyText1),
              Container(
                height: 100,
                child: IsConnected(
                  child: Center(
                    child: Text("Mode avion pour tester \n/!\ Ne pas mettre dans un column ou ListView ",
                        style: Theme.of(context).textTheme.bodyText1),
                  ),
                ),
              ),
              SpaceH10(),
              Text("Main Home Title", style: Theme.of(context).textTheme.bodyText1),
              MainHomeTitle(),
              SpaceH10(),
              Text("Main Scaffold", style: Theme.of(context).textTheme.bodyText1),
              _ContainerTxt("MainScaffold"),
              SpaceH10(),
              Text("Show Environnement Widget", style: Theme.of(context).textTheme.bodyText1),
              Container(
                  height: 100,
                  color: Colors.red,
                  child: ShowEnvironment(child: _ContainerTxt('Show Environment Widget'))),
              SpaceH10(),
              Text("Spacing", style: Theme.of(context).textTheme.bodyText1),
              SpaceH10(),
              Text("SpaceH10", style: Theme.of(context).textTheme.bodyText1),
              SpaceH10(),
              Text("SpaceH20", style: Theme.of(context).textTheme.bodyText1),
              SpaceH20(),
              Text("SpaceH30", style: Theme.of(context).textTheme.bodyText1),
              SpaceH30(),
              Text("Show Dialog", style: Theme.of(context).textTheme.bodyText1),
              //SHOW DIALOG
              ElevatedButton(
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Basic dialog title'),
                        content: const Text('A dialog is a type of modal window that\n'
                            'appears in front of app content to\n'
                            'provide critical information, or prompt\n'
                            'for a decision to be made.'),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Disable'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Enable'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("showDialog()"),
                style: buttonNormalPrimary,
              ),
              Text("Show Modal Bottom Sheet", style: Theme.of(context).textTheme.bodyText1),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Colors.amber,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text("showModalBottomSheet()"),
                style: buttonNormalSecondary,
              ),
              Text("----", style: Theme.of(context).textTheme.bodyText1),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerTxt extends StatelessWidget {
  String titre;
  _ContainerTxt(
    this.titre, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Center(
        child: Text(titre, style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
