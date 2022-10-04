// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

import '../account/account_tab.dart' as _i15;
import '../account/change_password/change_password_page.dart' as _i6;
import '../account/contact_us/contact_us_page.dart' as _i7;
import '../account/customer_search.dart' as _i8;
import '../account/settings_page.dart' as _i4;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i5;
import '../create_order/material_list.dart' as _i9;
import '../favorites/favorites_tab.dart' as _i14;
import '../history/history_tab.dart' as _i13;
import '../home/home_tab.dart' as _i12;
import '../home_tab.dart' as _i10;
import '../orders/saved_order/saved_order_list_page.dart' as _i11;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginOnBehalfPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.WebViewPage(
              key: args.key, url: args.url, initialFile: args.initialFile));
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ChangePasswordPage());
    },
    ContactUsPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ContactUsPage());
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CustomerSearchPage());
    },
    MaterialListPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.MaterialListPage());
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.HomeNavigationTabbar());
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SavedOrderListPage());
    },
    HomeTabRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.HomeTab());
    },
    HistoryTabRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HistoryTab());
    },
    FavoritesTabRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.FavoritesTab());
    },
    AccountTabRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.AccountTab());
    }
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i16.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i16.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i16.RouteConfig(LoginOnBehalfPageRoute.name, path: 'login_on_behalf'),
        _i16.RouteConfig(SettingsPageRoute.name, path: 'settings'),
        _i16.RouteConfig(WebViewPageRoute.name, path: 'web_view_page'),
        _i16.RouteConfig(ChangePasswordPageRoute.name,
            path: 'change_password_page'),
        _i16.RouteConfig(ContactUsPageRoute.name, path: 'contact_us_page'),
        _i16.RouteConfig(ContactUsPageRoute.name, path: 'contact_us_page'),
        _i16.RouteConfig(CustomerSearchPageRoute.name,
            path: 'customer_search_page'),
        _i16.RouteConfig(MaterialListPageRoute.name,
            path: 'material_list_page'),
        _i16.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i16.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i16.RouteConfig(HistoryTabRoute.name,
                  path: 'history-tab', parent: HomeNavigationTabbarRoute.name),
              _i16.RouteConfig(FavoritesTabRoute.name,
                  path: 'favorites-tab',
                  parent: HomeNavigationTabbarRoute.name),
              _i16.RouteConfig(AccountTabRoute.name,
                  path: 'account-tab', parent: HomeNavigationTabbarRoute.name)
            ]),
        _i16.RouteConfig(SavedOrderListPageRoute.name, path: 'saved_order_list')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i16.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i16.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i16.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(LoginOnBehalfPageRoute.name, path: 'login_on_behalf');

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i16.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.WebViewPage]
class WebViewPageRoute extends _i16.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({_i17.Key? key, String url = '', String? initialFile})
      : super(WebViewPageRoute.name,
            path: 'web_view_page',
            args: WebViewPageRouteArgs(
                key: key, url: url, initialFile: initialFile));

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({this.key, this.url = '', this.initialFile});

  final _i17.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordPageRoute extends _i16.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(ChangePasswordPageRoute.name, path: 'change_password_page');

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i7.ContactUsPage]
class ContactUsPageRoute extends _i16.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(ContactUsPageRoute.name, path: 'contact_us_page');

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i8.CustomerSearchPage]
class CustomerSearchPageRoute extends _i16.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(CustomerSearchPageRoute.name, path: 'customer_search_page');

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i9.MaterialListPage]
class MaterialListPageRoute extends _i16.PageRouteInfo<void> {
  const MaterialListPageRoute()
      : super(MaterialListPageRoute.name, path: 'material_list_page');

  static const String name = 'MaterialListPageRoute';
}

/// generated route for
/// [_i10.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i16.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i16.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar', initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i11.SavedOrderListPage]
class SavedOrderListPageRoute extends _i16.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(SavedOrderListPageRoute.name, path: 'saved_order_list');

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i12.HomeTab]
class HomeTabRoute extends _i16.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i13.HistoryTab]
class HistoryTabRoute extends _i16.PageRouteInfo<void> {
  const HistoryTabRoute() : super(HistoryTabRoute.name, path: 'history-tab');

  static const String name = 'HistoryTabRoute';
}

/// generated route for
/// [_i14.FavoritesTab]
class FavoritesTabRoute extends _i16.PageRouteInfo<void> {
  const FavoritesTabRoute()
      : super(FavoritesTabRoute.name, path: 'favorites-tab');

  static const String name = 'FavoritesTabRoute';
}

/// generated route for
/// [_i15.AccountTab]
class AccountTabRoute extends _i16.PageRouteInfo<void> {
  const AccountTabRoute() : super(AccountTabRoute.name, path: 'account-tab');

  static const String name = 'AccountTabRoute';
}
