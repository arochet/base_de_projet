import 'package:auto_route/auto_route.dart';
import 'package:base_de_projet/PRESENTATION/account/account/components/components_page.dart';
import 'package:base_de_projet/PRESENTATION/account/account/text_style/textStyle.dart';
import 'package:base_de_projet/PRESENTATION/account/account/account_page.dart';
import 'package:base_de_projet/PRESENTATION/account/delete_account/delete_account_page.dart';
import 'package:base_de_projet/PRESENTATION/account/modify_account/modify_account_page.dart';
import 'package:base_de_projet/PRESENTATION/account/new_password/new_password_page.dart';
import 'package:base_de_projet/PRESENTATION/account/reauthenticate/reauthenticate_page.dart';
import 'package:base_de_projet/PRESENTATION/auth/auth_check_email/auth_check_email_page.dart';
import 'package:base_de_projet/PRESENTATION/auth/auth_connexion/auth_connexion.dart';
import 'package:base_de_projet/PRESENTATION/auth/auth_init/auth_init.dart';
import 'package:base_de_projet/PRESENTATION/auth/auth_register/auth_register.dart';
import 'package:base_de_projet/PRESENTATION/auth/auth_reset_password.dart/auth_reset_password.dart';
import 'package:base_de_projet/PRESENTATION/home/home_page.dart';
import 'package:base_de_projet/PRESENTATION/core/_main_navigation/main_navigation_page.dart';
import 'package:base_de_projet/PRESENTATION/core/_splash/splash_page.dart';

import '../../account/account/buttons/buttons.dart';
import '../../account/account/colors/colors.dart';

@MaterialAutoRouter(replaceInRouteName: "Page,Route", routes: [
  //RedirectRoute(path: '*', redirectTo: '/'),
  AutoRoute(
    path: '/',
    name: 'SplashRoute',
    page: SplashPage,
    initial: true,
  ),
  AutoRoute(
    path: '/main',
    page: MainNavigationPage,
    children: [
      RedirectRoute(path: '', redirectTo: 'home'),
      AutoRoute(
        path: 'home',
        name: 'HomeRoute',
        page: HomePage,
      ),
      AutoRoute(
        path: 'account',
        name: 'AccountRoute',
        page: AccountPage,
      ),
    ],
  ),
  AutoRoute(
    path: '/auth-init',
    name: 'AuthInitRoute',
    page: AuthInitPage,
  ),
  AutoRoute(
    path: '/auth-connexion',
    name: 'AuthConnexionRoute',
    page: AuthConnexionPage,
  ),
  AutoRoute(
    path: '/auth-register',
    name: 'AuthRegisterRoute',
    page: AuthRegisterPage,
  ),
  AutoRoute(
    path: '/auth-check-email',
    name: 'AuthCheckEmailRoute',
    page: AuthCheckEmailPage,
  ),
  AutoRoute(
    path: '/auth-reset-password',
    name: 'AuthResetPasswordRoute',
    page: AuthResetPasswordPage,
  ),
  AutoRoute(
    path: '/modify-account',
    name: 'ModifyAccountRoute',
    page: ModifyAccountPage,
  ),
  AutoRoute(
    path: '/reauthenticate',
    name: 'ReauthenticateRoute',
    page: ReauthenticatePage,
  ),
  AutoRoute(
    path: '/delete-account',
    name: 'DeleteAccountRoute',
    page: DeleteAccountPage,
  ),
  AutoRoute(
    path: '/new-password',
    name: 'NewPasswordRoute',
    page: NewPasswordPage,
  ),
  AutoRoute(
    path: '/components-route',
    name: 'ComponentsRoute',
    page: ComponentsPage,
  ),
  AutoRoute(
    path: '/colors-route',
    name: 'ColorsRoute',
    page: ColorsPage,
  ),
  AutoRoute(
    path: '/buttons-route',
    name: 'ButtonsRoute',
    page: ButtonsPage,
  ),
  AutoRoute(
    path: '/textStyle-route',
    name: 'TextStyleRoute',
    page: TextStylePage,
  ), //insert-route
])
class $AppRouter {}
