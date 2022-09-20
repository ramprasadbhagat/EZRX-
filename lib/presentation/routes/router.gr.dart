// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../account/account_tab.dart' as _i12;
import '../account/customer_search.dart' as _i6;
import '../account/settings_page.dart' as _i4;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i5;
import '../home/home_tab.dart' as _i8;
import '../home_tab.dart' as _i7;
import '../notifications/notifications_tab.dart' as _i11;
import '../orders/orders_tab.dart' as _i10;
import '../products/products_tab.dart' as _i9;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i13.RootStackRouter {
  AppRouter([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginOnBehalfPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.WebViewPage(
              key: args.key, url: args.url, initialFile: args.initialFile));
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CustomerSearchPage());
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeNavigationTabbar());
    },
    HomeTabRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.HomeTab());
    },
    ProductsTabRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.ProductsTab());
    },
    OrdersTabRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.OrdersTab());
    },
    NotificationsTabRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.NotificationsTab());
    },
    AccountTabRoute.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.AccountTab());
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i13.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i13.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i13.RouteConfig(LoginOnBehalfPageRoute.name, path: 'login_on_behalf'),
        _i13.RouteConfig(SettingsPageRoute.name, path: 'settings'),
        _i13.RouteConfig(WebViewPageRoute.name, path: 'web_view_page'),
        _i13.RouteConfig(CustomerSearchPageRoute.name,
            path: 'customer_search_page'),
        _i13.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i13.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i13.RouteConfig(ProductsTabRoute.name,
                  path: 'products-tab', parent: HomeNavigationTabbarRoute.name),
              _i13.RouteConfig(OrdersTabRoute.name,
                  path: 'orders-tab', parent: HomeNavigationTabbarRoute.name),
              _i13.RouteConfig(NotificationsTabRoute.name,
                  path: 'notifications-tab',
                  parent: HomeNavigationTabbarRoute.name),
              _i13.RouteConfig(AccountTabRoute.name,
                  path: 'account-tab', parent: HomeNavigationTabbarRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i13.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i13.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i13.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(LoginOnBehalfPageRoute.name, path: 'login_on_behalf');

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i13.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.WebViewPage]
class WebViewPageRoute extends _i13.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({_i14.Key? key, String url = '', String? initialFile})
      : super(WebViewPageRoute.name,
            path: 'web_view_page',
            args: WebViewPageRouteArgs(
                key: key, url: url, initialFile: initialFile));

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({this.key, this.url = '', this.initialFile});

  final _i14.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i6.CustomerSearchPage]
class CustomerSearchPageRoute extends _i13.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(CustomerSearchPageRoute.name, path: 'customer_search_page');

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i7.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i13.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i13.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar', initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i8.HomeTab]
class HomeTabRoute extends _i13.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i9.ProductsTab]
class ProductsTabRoute extends _i13.PageRouteInfo<void> {
  const ProductsTabRoute() : super(ProductsTabRoute.name, path: 'products-tab');

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i10.OrdersTab]
class OrdersTabRoute extends _i13.PageRouteInfo<void> {
  const OrdersTabRoute() : super(OrdersTabRoute.name, path: 'orders-tab');

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i11.NotificationsTab]
class NotificationsTabRoute extends _i13.PageRouteInfo<void> {
  const NotificationsTabRoute()
      : super(NotificationsTabRoute.name, path: 'notifications-tab');

  static const String name = 'NotificationsTabRoute';
}

/// generated route for
/// [_i12.AccountTab]
class AccountTabRoute extends _i13.PageRouteInfo<void> {
  const AccountTabRoute() : super(AccountTabRoute.name, path: 'account-tab');

  static const String name = 'AccountTabRoute';
}
