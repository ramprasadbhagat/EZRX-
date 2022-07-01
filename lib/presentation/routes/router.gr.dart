// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../auth/login_page.dart' as _i2;
import '../favorite/favorite_tab.dart' as _i7;
import '../history/history.dart' as _i6;
import '../home/home_tab.dart' as _i4;
import '../home_tab.dart' as _i3;
import '../order/order_tab.dart' as _i5;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeNavigationTabbar());
    },
    HomeTabRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeTab());
    },
    OrderTabRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.OrderTab());
    },
    HistoryTabRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.HistoryTab());
    },
    FavoriteTabRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.FavoriteTab());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i8.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i8.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i8.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i8.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i8.RouteConfig(OrderTabRoute.name,
                  path: 'order-tab', parent: HomeNavigationTabbarRoute.name),
              _i8.RouteConfig(HistoryTabRoute.name,
                  path: 'history-tab', parent: HomeNavigationTabbarRoute.name),
              _i8.RouteConfig(FavoriteTabRoute.name,
                  path: 'favorite-tab', parent: HomeNavigationTabbarRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i8.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i8.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i8.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar', initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i4.HomeTab]
class HomeTabRoute extends _i8.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i5.OrderTab]
class OrderTabRoute extends _i8.PageRouteInfo<void> {
  const OrderTabRoute() : super(OrderTabRoute.name, path: 'order-tab');

  static const String name = 'OrderTabRoute';
}

/// generated route for
/// [_i6.HistoryTab]
class HistoryTabRoute extends _i8.PageRouteInfo<void> {
  const HistoryTabRoute() : super(HistoryTabRoute.name, path: 'history-tab');

  static const String name = 'HistoryTabRoute';
}

/// generated route for
/// [_i7.FavoriteTab]
class FavoriteTabRoute extends _i8.PageRouteInfo<void> {
  const FavoriteTabRoute() : super(FavoriteTabRoute.name, path: 'favorite-tab');

  static const String name = 'FavoriteTabRoute';
}
