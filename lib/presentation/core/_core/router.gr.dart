// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/foundation.dart' as _i20;
import 'package:flutter/material.dart' as _i19;

import '../../account/account/account_page.dart' as _i17;
import '../../account/account/buttons/buttons.dart' as _i14;
import '../../account/account/colors/colors.dart' as _i13;
import '../../account/account/components/components_page.dart' as _i12;
import '../../account/account/text_style/text_style.dart' as _i15;
import '../../account/delete_account/delete_account_page.dart' as _i10;
import '../../account/modify_account/modify_account_page.dart' as _i8;
import '../../account/new_password/new_password_page.dart' as _i11;
import '../../account/reauthenticate/reauthenticate_page.dart' as _i9;
import '../../auth/auth_check_email/auth_check_email_page.dart' as _i6;
import '../../auth/auth_connexion/auth_connexion.dart' as _i4;
import '../../auth/auth_init/auth_init.dart' as _i3;
import '../../auth/auth_register/auth_register.dart' as _i5;
import '../../auth/auth_reset_password.dart/auth_reset_password.dart' as _i7;
import '../../home/home_page.dart' as _i16;
import '../_main_navigation/main_navigation_page.dart' as _i2;
import '../_splash/splash_page.dart' as _i1;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.SplashPage());
    },
    MainNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<MainNavigationRouteArgs>(orElse: () => const MainNavigationRouteArgs());
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: _i2.MainNavigationPage(key: args.key));
    },
    AuthInitRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i3.AuthInitPage());
    },
    AuthConnexionRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i4.AuthConnexionPage());
    },
    AuthRegisterRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i5.AuthRegisterPage());
    },
    AuthCheckEmailRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i6.AuthCheckEmailPage());
    },
    AuthResetPasswordRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i7.AuthResetPasswordPage());
    },
    ModifyAccountRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i8.ModifyAccountPage());
    },
    ReauthenticateRoute.name: (routeData) {
      final args = routeData.argsAs<ReauthenticateRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.ReauthenticatePage(key: args.key, route: args.route));
    },
    DeleteAccountRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i10.DeleteAccountPage());
    },
    NewPasswordRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i11.NewPasswordPage());
    },
    ComponentsRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i12.ComponentsPage());
    },
    ColorsRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i13.ColorsPage());
    },
    ButtonsRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i14.ButtonsPage());
    },
    TextStyleRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i15.TextStylePage());
    },
    HomeRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i16.HomePage());
    },
    AccountRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(routeData: routeData, child: const _i17.AccountPage());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(SplashRoute.name, path: '/'),
        _i18.RouteConfig(MainNavigationRoute.name, path: '/main', children: [
          _i18.RouteConfig('#redirect',
              path: '', parent: MainNavigationRoute.name, redirectTo: 'home', fullMatch: true),
          _i18.RouteConfig(HomeRoute.name, path: 'home', parent: MainNavigationRoute.name),
          _i18.RouteConfig(AccountRoute.name, path: 'account', parent: MainNavigationRoute.name)
        ]),
        _i18.RouteConfig(AuthInitRoute.name, path: '/auth-init'),
        _i18.RouteConfig(AuthConnexionRoute.name, path: '/auth-connexion'),
        _i18.RouteConfig(AuthRegisterRoute.name, path: '/auth-register'),
        _i18.RouteConfig(AuthCheckEmailRoute.name, path: '/auth-check-email'),
        _i18.RouteConfig(AuthResetPasswordRoute.name, path: '/auth-reset-password'),
        _i18.RouteConfig(ModifyAccountRoute.name, path: '/modify-account'),
        _i18.RouteConfig(ReauthenticateRoute.name, path: '/reauthenticate'),
        _i18.RouteConfig(DeleteAccountRoute.name, path: '/delete-account'),
        _i18.RouteConfig(NewPasswordRoute.name, path: '/new-password'),
        _i18.RouteConfig(ComponentsRoute.name, path: '/components-route'),
        _i18.RouteConfig(ColorsRoute.name, path: '/colors-route'),
        _i18.RouteConfig(ButtonsRoute.name, path: '/buttons-route'),
        _i18.RouteConfig(TextStyleRoute.name, path: '/textStyle-route')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i18.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainNavigationPage]
class MainNavigationRoute extends _i18.PageRouteInfo<MainNavigationRouteArgs> {
  MainNavigationRoute({_i20.Key? key, List<_i18.PageRouteInfo>? children})
      : super(MainNavigationRoute.name,
            path: '/main', args: MainNavigationRouteArgs(key: key), initialChildren: children);

  static const String name = 'MainNavigationRoute';
}

class MainNavigationRouteArgs {
  const MainNavigationRouteArgs({this.key});

  final _i20.Key? key;

  @override
  String toString() {
    return 'MainNavigationRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.AuthInitPage]
class AuthInitRoute extends _i18.PageRouteInfo<void> {
  const AuthInitRoute() : super(AuthInitRoute.name, path: '/auth-init');

  static const String name = 'AuthInitRoute';
}

/// generated route for
/// [_i4.AuthConnexionPage]
class AuthConnexionRoute extends _i18.PageRouteInfo<void> {
  const AuthConnexionRoute() : super(AuthConnexionRoute.name, path: '/auth-connexion');

  static const String name = 'AuthConnexionRoute';
}

/// generated route for
/// [_i5.AuthRegisterPage]
class AuthRegisterRoute extends _i18.PageRouteInfo<void> {
  const AuthRegisterRoute() : super(AuthRegisterRoute.name, path: '/auth-register');

  static const String name = 'AuthRegisterRoute';
}

/// generated route for
/// [_i6.AuthCheckEmailPage]
class AuthCheckEmailRoute extends _i18.PageRouteInfo<void> {
  const AuthCheckEmailRoute() : super(AuthCheckEmailRoute.name, path: '/auth-check-email');

  static const String name = 'AuthCheckEmailRoute';
}

/// generated route for
/// [_i7.AuthResetPasswordPage]
class AuthResetPasswordRoute extends _i18.PageRouteInfo<void> {
  const AuthResetPasswordRoute() : super(AuthResetPasswordRoute.name, path: '/auth-reset-password');

  static const String name = 'AuthResetPasswordRoute';
}

/// generated route for
/// [_i8.ModifyAccountPage]
class ModifyAccountRoute extends _i18.PageRouteInfo<void> {
  const ModifyAccountRoute() : super(ModifyAccountRoute.name, path: '/modify-account');

  static const String name = 'ModifyAccountRoute';
}

/// generated route for
/// [_i9.ReauthenticatePage]
class ReauthenticateRoute extends _i18.PageRouteInfo<ReauthenticateRouteArgs> {
  ReauthenticateRoute({_i20.Key? key, required _i18.PageRouteInfo<dynamic> route})
      : super(ReauthenticateRoute.name,
            path: '/reauthenticate', args: ReauthenticateRouteArgs(key: key, route: route));

  static const String name = 'ReauthenticateRoute';
}

class ReauthenticateRouteArgs {
  const ReauthenticateRouteArgs({this.key, required this.route});

  final _i20.Key? key;

  final _i18.PageRouteInfo<dynamic> route;

  @override
  String toString() {
    return 'ReauthenticateRouteArgs{key: $key, route: $route}';
  }
}

/// generated route for
/// [_i10.DeleteAccountPage]
class DeleteAccountRoute extends _i18.PageRouteInfo<void> {
  const DeleteAccountRoute() : super(DeleteAccountRoute.name, path: '/delete-account');

  static const String name = 'DeleteAccountRoute';
}

/// generated route for
/// [_i11.NewPasswordPage]
class NewPasswordRoute extends _i18.PageRouteInfo<void> {
  const NewPasswordRoute() : super(NewPasswordRoute.name, path: '/new-password');

  static const String name = 'NewPasswordRoute';
}

/// generated route for
/// [_i12.ComponentsPage]
class ComponentsRoute extends _i18.PageRouteInfo<void> {
  const ComponentsRoute() : super(ComponentsRoute.name, path: '/components-route');

  static const String name = 'ComponentsRoute';
}

/// generated route for
/// [_i13.ColorsPage]
class ColorsRoute extends _i18.PageRouteInfo<void> {
  const ColorsRoute() : super(ColorsRoute.name, path: '/colors-route');

  static const String name = 'ColorsRoute';
}

/// generated route for
/// [_i14.ButtonsPage]
class ButtonsRoute extends _i18.PageRouteInfo<void> {
  const ButtonsRoute() : super(ButtonsRoute.name, path: '/buttons-route');

  static const String name = 'ButtonsRoute';
}

/// generated route for
/// [_i15.TextStylePage]
class TextStyleRoute extends _i18.PageRouteInfo<void> {
  const TextStyleRoute() : super(TextStyleRoute.name, path: '/textStyle-route');

  static const String name = 'TextStyleRoute';
}

/// generated route for
/// [_i16.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i17.AccountPage]
class AccountRoute extends _i18.PageRouteInfo<void> {
  const AccountRoute() : super(AccountRoute.name, path: 'account');

  static const String name = 'AccountRoute';
}
