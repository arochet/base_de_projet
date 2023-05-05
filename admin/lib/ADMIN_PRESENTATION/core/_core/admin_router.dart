import 'package:admin/ADMIN_PRESENTATION/core/_splash/splash_page.dart';
import 'package:admin/ADMIN_PRESENTATION/home/home_page.dart';
import 'package:admin/ADMIN_PRESENTATION/users/users_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../_main_navigation/main_navigation_page.dart';
//insert-import
part 'admin_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AdminRouter extends _$AdminRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: SplashRoute.page,
        ),
        AutoRoute(
          path: '/main',
          page: MainNavigationRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: 'home'),
            AutoRoute(
              path: 'home',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'users',
              page: UsersRoute.page,
            ),
          ],
        ),

        //insert-route
      ];
}
