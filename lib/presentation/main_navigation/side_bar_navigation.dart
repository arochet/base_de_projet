import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/presentation/core/router.gr.dart';
import 'package:base_de_projet/presentation/core/theme_colors.dart';
import 'package:flutter/material.dart';

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
            body: Row(
              children: [
                Container(
                  width: 300,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18),
                        child: Center(
                          child: Text("//Base de projet",
                              style: Theme.of(context).textTheme.headline3),
                        ),
                      ),
                      NavLink(
                        title: 'Home',
                        route: 0,
                        tabsRouter: tabsRouter,
                      ),
                      NavLink(
                        title: 'Account',
                        route: 1,
                        tabsRouter: tabsRouter,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  // nested routes will be rendered here
                  child: FadeTransition(
                    opacity: animation,
// the passed child is techinaclly our animated selected-tab page
                    child: child,
                  ),
                )
              ],
            ),
          );
        });
  }
}

class NavLink extends StatelessWidget {
  const NavLink(
      {Key? key,
      this.title = 'link here',
      required this.route,
      required this.tabsRouter})
      : super(key: key);

  final String title;
  final int route;
  final TabsRouter tabsRouter;
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        onTap: () {
          tabsRouter.setActiveIndex(route);
        });
  }
}
