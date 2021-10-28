import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/components/show_environment_widget.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:base_de_projet/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBarNavigation extends StatelessWidget {
  const SideBarNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: const [
          HomeRoute(),
          AccountRoute(),
        ],
        builder: (context, child, animation) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: SafeArea(
              child: Row(
                children: [
                  Container(
                    width: 300,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: Center(
                            child: Text(AppLocalizations.of(context)!.nomprojet,
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ),
                        NavLink(
                          title: AppLocalizations.of(context)!.accueil,
                          icon: Icons.home,
                          route: 0,
                          tabsRouter: tabsRouter,
                        ),
                        NavLink(
                          title: AppLocalizations.of(context)!.compte,
                          icon: Icons.person_rounded,
                          route: 1,
                          tabsRouter: tabsRouter,
                        ),
                      ],
                    ),
                  ),
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
  Widget build(BuildContext context, ScopedReader watch) {
    final idCurrentPage = watch(currentPageNavProvider).state;
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
            context.read(currentPageNavProvider).state = route;
            tabsRouter.setActiveIndex(route);
          }),
    );
  }
}
