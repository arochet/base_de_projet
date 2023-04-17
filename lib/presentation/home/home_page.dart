import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_component_file.dart';
import 'package:base_de_projet/PRESENTATION/core/_components/show_environment_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
import 'package:base_de_projet/PRESENTATION/core/_core/app_widget.dart';
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
                style: null,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Warning"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonWarning,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Remove"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonDanger,
              ),
              ElevatedButton(
                onPressed: () {
                  printDev();
                },
                child: Text("Help"),
                style: Theme.of(context).extension<AppThemeExtention>()?.buttonHelp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
