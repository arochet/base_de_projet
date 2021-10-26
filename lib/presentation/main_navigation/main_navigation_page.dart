import 'package:base_de_projet/presentation/main_navigation/bottom_bar_navigation.dart';
import 'package:flutter/material.dart';

import 'side_bar_navigation.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600)
        return SideBarNavigation();
      else
        return BottomBarNavigation();
    });
  }
}
