import 'package:base_de_projet/presentation/auth/widget/check_connexion_widget.dart';
import 'package:base_de_projet/presentation/main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';

import 'side_bar_navigation.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckUserConnected(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600)
          return SideBarNavigation();
        else
          return BottomBarNavigation();
      }),
    );
  }
}
