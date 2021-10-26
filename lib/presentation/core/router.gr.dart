// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

import '../account/account/account_page.dart' as _i13;
import '../account/delete_account/delete_account_page.dart' as _i10;
import '../account/modify_account/modify_account_page.dart' as _i8;
import '../account/new_password/new_password_page.dart' as _i11;
import '../account/reauthenticate/reauthenticate_page.dart' as _i9;
import '../auth/auth_check_email/auth_check_email_page.dart' as _i6;
import '../auth/auth_connexion/auth_connexion.dart' as _i4;
import '../auth/auth_init/auth_init.dart' as _i3;
import '../auth/auth_register/auth_register.dart' as _i5;
import '../auth/auth_reset_password.dart/auth_reset_password.dart' as _i7;
import '../home/home_page.dart' as _i12;
import '../main_navigation/main_navigation_page.dart' as _i2;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    MainNavigationRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MainNavigationPage());
    },
    AuthInitRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AuthInitPage());
    },
    AuthConnexionRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AuthConnexionPage());
    },
    AuthRegisterRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AuthRegisterPage());
    },
    AuthCheckEmailRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AuthCheckEmailPage());
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AuthResetPasswordPage());
    },
    ModifyAccountRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ModifyAccountPage());
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.ReauthenticatePage(key: args.key, route: args.route));
    },
    DeleteAccountRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.DeleteAccountPage());
    },
    NewPasswordRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.NewPasswordPage());
    },
    HomeRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomePage());
    },
    AccountRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.AccountPage());
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(SplashRoute.name, path: '/'),
        _i14.RouteConfig(MainNavigationRoute.name, path: '/main', children: [
          _i14.RouteConfig('#redirect',
              path: '',
              parent: MainNavigationRoute.name,
              redirectTo: 'home',
              fullMatch: true),
          _i14.RouteConfig(HomeRoute.name,
              path: 'home', parent: MainNavigationRoute.name),
          _i14.RouteConfig(AccountRoute.name,
              path: 'account', parent: MainNavigationRoute.name)
        ]),
        _i14.RouteConfig(AuthInitRoute.name, path: '/auth-init'),
        _i14.RouteConfig(AuthConnexionRoute.name, path: '/auth-connexion'),
        _i14.RouteConfig(AuthRegisterRoute.name, path: '/auth-register'),
        _i14.RouteConfig(AuthCheckEmailRoute.name, path: '/auth-check-email'),
        _i14.RouteConfig(AuthResetPasswordRoute.name,
            path: '/auth-reset-password'),
        _i14.RouteConfig(ModifyAccountRoute.name, path: '/modify-account'),
        _i14.RouteConfig(ReauthenticateRoute.name, path: '/reauthenticate'),
        _i14.RouteConfig(DeleteAccountRoute.name, path: '/delete-account'),
        _i14.RouteConfig(NewPasswordRoute.name, path: '/new-password')
      ];
}

/// generated route for [_i1.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for [_i2.MainNavigationPage]
class MainNavigationRoute extends _i14.PageRouteInfo<void> {
  const MainNavigationRoute({List<_i14.PageRouteInfo>? children})
      : super(name, path: '/main', initialChildren: children);

  static const String name = 'MainNavigationRoute';
}

/// generated route for [_i3.AuthInitPage]
class AuthInitRoute extends _i14.PageRouteInfo<void> {
  const AuthInitRoute() : super(name, path: '/auth-init');

  static const String name = 'AuthInitRoute';
}

/// generated route for [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i14.PageRouteInfo<void> {
  const AuthConnexionRoute() : super(name, path: '/auth-connexion');

  static const String name = 'AuthConnexionRoute';
}

/// generated route for [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i14.PageRouteInfo<void> {
  const AuthRegisterRoute() : super(name, path: '/auth-register');

  static const String name = 'AuthRegisterRoute';
}

/// generated route for [_i6.AuthCheckEmailPage]
class AuthCheckEmailRoute extends _i14.PageRouteInfo<void> {
  const AuthCheckEmailRoute() : super(name, path: '/auth-check-email');

  static const String name = 'AuthCheckEmailRoute';
}

/// generated route for [_i7.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i14.PageRouteInfo<void> {
  const AuthResetPasswordRoute() : super(name, path: '/auth-reset-password');

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for [_i8.ModifyAccountPage]
class ModifyAccountRoute extends _i14.PageRouteInfo<void> {
  const ModifyAccountRoute() : super(name, path: '/modify-account');

  static const String name = 'ModifyAccountRoute';
}

/// generated route for [_i9.ReauthenticatePage]
class ReauthenticateRoute extends _i14.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute(
      {_i15.Key? key, required _i14.PageRouteInfo<dynamic> route})
      : super(name,
            path: '/reauthenticate',
            args: ReauthenticateRouteArgs(key: key, route: route));

  static const String name = 'ReauthenticateRoute';
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({this.key, required this.route});

  final _i15.Key? key;

  final _i14.PageRouteInfo<dynamic> route;
}

/// generated route for [_i10.DeleteAccountPage]
class DeleteAccountRoute extends _i14.PageRouteInfo<void> {
  const DeleteAccountRoute() : super(name, path: '/delete-account');

  static const String name = 'DeleteAccountRoute';
}

/// generated route for [_i11.NewPasswordPage]
class NewPasswordRoute extends _i14.PageRouteInfo<void> {
  const NewPasswordRoute() : super(name, path: '/new-password');

  static const String name = 'NewPasswordRoute';
}

/// generated route for [_i12.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for [_i13.AccountPage]
class AccountRoute extends _i14.PageRouteInfo<void> {
  const AccountRoute() : super(name, path: 'account');

  static const String name = 'AccountRoute';
}
