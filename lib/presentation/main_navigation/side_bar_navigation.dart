import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/components/main_home_title.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation(
      {Key? key, required this.listRoute, required this.listMenu})
      : super(key: key);
  final listRoute;
  final List listMenu;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: listRoute,
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  //MENU LATERAL
                  Container(
                    width: 300,
                    child: ListView(
                      children: [
                        MainHomeTitleWeb(),
                        ...listMenu.map((element) => NavLink(
                              title: element["title"],
                              icon: element["icon"],
                              route: element["id"],
                              tabsRouter: tabsRouter,
                            )),
                      ],
                    ),
                  ),
                  //PAGE
                  Expanded(
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class NavLink extends ConsumerWidget {
  const NavLink(
      {Key? key,
      this.title = 'link here',
      required this.route,
      required this.icon,
      required this.tabsRouter})
      : super(key: key);

  final String title;
  final int route;
  final TabsRouter tabsRouter;
  final IconData icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idCurrentPage = ref.watch(currentPageNavProvider.notifier).state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
      child: ListTile(
          leading: Icon(icon),
          title: Text(title),
          tileColor: idCurrentPage == route ? colorpanel(600) : null,
          hoverColor: colorpanel(700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          onTap: () {
            ref.read(currentPageNavProvider.notifier).state = route;
            tabsRouter.setActiveIndex(route);
          }),
    );
  }
}
