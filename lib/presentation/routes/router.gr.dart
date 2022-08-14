// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../account/account_tab.dart' as _i10;
import '../account/settings_page.dart' as _i4;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../home/home_tab.dart' as _i6;
import '../home_tab.dart' as _i5;
import '../notifications/notifications_tab.dart' as _i9;
import '../orders/orders_tab.dart' as _i8;
import '../products/products_tab.dart' as _i7;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginOnBehalfPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomeNavigationTabbar());
    },
    HomeTabRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HomeTab());
    },
    ProductsTabRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProductsTab());
    },
    OrdersTabRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.OrdersTab());
    },
    NotificationsTabRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NotificationsTab());
    },
    AccountTabRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AccountTab());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i11.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i11.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i11.RouteConfig(LoginOnBehalfPageRoute.name, path: 'login_on_behalf'),
        _i11.RouteConfig(SettingsPageRoute.name, path: 'settings'),
        _i11.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i11.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i11.RouteConfig(ProductsTabRoute.name,
                  path: 'products-tab', parent: HomeNavigationTabbarRoute.name),
              _i11.RouteConfig(OrdersTabRoute.name,
                  path: 'orders-tab', parent: HomeNavigationTabbarRoute.name),
              _i11.RouteConfig(NotificationsTabRoute.name,
                  path: 'notifications-tab',
                  parent: HomeNavigationTabbarRoute.name),
              _i11.RouteConfig(AccountTabRoute.name,
                  path: 'account-tab', parent: HomeNavigationTabbarRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i11.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i11.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i11.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(LoginOnBehalfPageRoute.name, path: 'login_on_behalf');

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i11.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i11.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i11.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar', initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i6.HomeTab]
class HomeTabRoute extends _i11.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i7.ProductsTab]
class ProductsTabRoute extends _i11.PageRouteInfo<void> {
  const ProductsTabRoute() : super(ProductsTabRoute.name, path: 'products-tab');

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i8.OrdersTab]
class OrdersTabRoute extends _i11.PageRouteInfo<void> {
  const OrdersTabRoute() : super(OrdersTabRoute.name, path: 'orders-tab');

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i9.NotificationsTab]
class NotificationsTabRoute extends _i11.PageRouteInfo<void> {
  const NotificationsTabRoute()
      : super(NotificationsTabRoute.name, path: 'notifications-tab');

  static const String name = 'NotificationsTabRoute';
}

/// generated route for
/// [_i10.AccountTab]
class AccountTabRoute extends _i11.PageRouteInfo<void> {
  const AccountTabRoute() : super(AccountTabRoute.name, path: 'account-tab');

  static const String name = 'AccountTabRoute';
}
