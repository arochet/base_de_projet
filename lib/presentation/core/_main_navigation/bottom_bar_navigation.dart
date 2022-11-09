import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/_core/router.gr.dart';
import 'package:base_de_projet/presentation/core/_core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomBarNavigation extends StatelessWidget {
  const BottomBarNavigation({Key? key, required this.listRoute, required this.listMenu}) : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: colorpanel(700),
        title: Text("Base de projet", style: Theme.of(context).textTheme.headline4),
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: colorpanel(900),
      routes: listRoute,
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: listMenu
              .map((element) => SalomonBottomBarItem(
                    selectedColor: actioncolor["primary"],
                    unselectedColor: colorpanel(50),
                    icon: Icon(element["icon"], size: 30),
                    title: Text(element["title"]),
                  ))
              .toList(),
        );
      },
    );
  }
}
