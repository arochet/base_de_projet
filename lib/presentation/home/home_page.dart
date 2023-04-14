import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_button.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/theme_colors.dart';
import 'package:base_de_projet/PRESENTATION/core/_utils/dev_utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShowEnvironment(
      child: ShowComponentFile(
        title: 'home/home_page.dart',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Base de projet",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: colorpanel(50))),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Primary"),
                style: buttonNormalPrimary,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Secondary"),
                style: buttonNormalSecondary,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Confirm"),
                style: buttonNormalConfirm,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Warning"),
                style: buttonNormalWarning,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Remove"),
                style: buttonNormalRemove,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Help"),
                style: buttonNormalHelp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
