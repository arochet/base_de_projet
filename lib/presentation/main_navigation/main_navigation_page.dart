import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainNavigationPage extends StatelessWidget {
  const MainNavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: maincolor[1],
        title: const Text("Base de Projet"),
        centerTitle: true,
        leading: const AutoBackButton(),
      ),
      backgroundColor: maincolor[2],
      routes: const [
        HomeRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: maincolor[4],
              icon: const Icon(Icons.home, size: 30),
              title: Text(AppLocalizations.of(context)!.accueil),
            ),
            SalomonBottomBarItem(
              selectedColor: maincolor[5],
              icon: const Icon(Icons.person_rounded, size: 30),
              title: Text(AppLocalizations.of(context)!.compte),
            ),
          ],
        );
      },
    );
  }
}
