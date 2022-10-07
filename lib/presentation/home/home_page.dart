import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/_components/show_environment_widget.dart';
import 'package:base_de_projet/presentation/_core/theme_button.dart';
import 'package:base_de_projet/presentation/_core/theme_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ShowEnvironment(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Base de projet",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: colorpanel(50))),
            ElevatedButton(
              onPressed: () {},
              child: Text("Primary"),
              style: buttonNormalPrimary,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Secondary"),
              style: buttonNormalSecondary,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Confirm"),
              style: buttonNormalConfirm,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Warning"),
              style: buttonNormalWarning,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Remove"),
              style: buttonNormalRemove,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Help"),
              style: buttonNormalHelp,
            ),
          ],
        ),
      ),
    );
  }
}
