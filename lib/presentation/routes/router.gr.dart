// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;

import '../../domain/order/entities/order_template.dart' as _i21;
import '../account/account_tab.dart' as _i18;
import '../account/change_password/change_password_page.dart' as _i6;
import '../account/contact_us/contact_us_page.dart' as _i7;
import '../account/customer_search.dart' as _i8;
import '../account/settings_page.dart' as _i4;
import '../aup_tc/aup_tc.dart' as _i10;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i5;
import '../create_order/material_list.dart' as _i9;
import '../favorites/favorites_tab.dart' as _i17;
import '../history/history_tab.dart' as _i16;
import '../home/home_tab.dart' as _i15;
import '../home_tab.dart' as _i13;
import '../order/order_template/order_template_detail_page.dart' as _i12;
import '../order/order_template/order_template_list_page.dart' as _i11;
import '../orders/saved_order/saved_order_list_page.dart' as _i14;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginOnBehalfPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.WebViewPage(
              key: args.key, url: args.url, initialFile: args.initialFile));
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ChangePasswordPage());
    },
    ContactUsPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ContactUsPage());
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.CustomerSearchPage());
    },
    MaterialListPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.MaterialListPage());
    },
    AupTCDialogRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCDialogRouteArgs>(
          orElse: () => const AupTCDialogRouteArgs());
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i10.AupTCDialog(key: args.key, fromSetting: args.fromSetting));
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.OrderTemplateListPage());
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.OrderTemplateDetailPage(
              key: args.key, orderTemplateInfo: args.orderTemplateInfo));
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.HomeNavigationTabbar());
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.SavedOrderListPage());
    },
    HomeTabRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.HomeTab());
    },
    HistoryTabRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.HistoryTab());
    },
    FavoritesTabRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.FavoritesTab());
    },
    AccountTabRoute.name: (routeData) {
      return _i19.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.AccountTab());
    }
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i19.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i19.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i19.RouteConfig(LoginOnBehalfPageRoute.name, path: 'login_on_behalf'),
        _i19.RouteConfig(SettingsPageRoute.name, path: 'settings'),
        _i19.RouteConfig(WebViewPageRoute.name, path: 'web_view_page'),
        _i19.RouteConfig(ChangePasswordPageRoute.name,
            path: 'change_password_page'),
        _i19.RouteConfig(ContactUsPageRoute.name, path: 'contact_us_page'),
        _i19.RouteConfig(CustomerSearchPageRoute.name,
            path: 'customer_search_page'),
        _i19.RouteConfig(MaterialListPageRoute.name,
            path: 'material_list_page'),
        _i19.RouteConfig(AupTCDialogRoute.name, path: 'tos'),
        _i19.RouteConfig(OrderTemplateListPageRoute.name,
            path: 'order_template_list_page'),
        _i19.RouteConfig(OrderTemplateDetailPageRoute.name,
            path: 'order_template_detail_page'),
        _i19.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i19.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i19.RouteConfig(HistoryTabRoute.name,
                  path: 'history-tab', parent: HomeNavigationTabbarRoute.name),
              _i19.RouteConfig(FavoritesTabRoute.name,
                  path: 'favorites-tab',
                  parent: HomeNavigationTabbarRoute.name),
              _i19.RouteConfig(AccountTabRoute.name,
                  path: 'account-tab', parent: HomeNavigationTabbarRoute.name)
            ]),
        _i19.RouteConfig(SavedOrderListPageRoute.name, path: 'saved_order_list')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i19.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i19.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i19.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(LoginOnBehalfPageRoute.name, path: 'login_on_behalf');

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i19.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.WebViewPage]
class WebViewPageRoute extends _i19.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({_i20.Key? key, String url = '', String? initialFile})
      : super(WebViewPageRoute.name,
            path: 'web_view_page',
            args: WebViewPageRouteArgs(
                key: key, url: url, initialFile: initialFile));

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({this.key, this.url = '', this.initialFile});

  final _i20.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordPageRoute extends _i19.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(ChangePasswordPageRoute.name, path: 'change_password_page');

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i7.ContactUsPage]
class ContactUsPageRoute extends _i19.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(ContactUsPageRoute.name, path: 'contact_us_page');

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i8.CustomerSearchPage]
class CustomerSearchPageRoute extends _i19.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(CustomerSearchPageRoute.name, path: 'customer_search_page');

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i9.MaterialListPage]
class MaterialListPageRoute extends _i19.PageRouteInfo<void> {
  const MaterialListPageRoute()
      : super(MaterialListPageRoute.name, path: 'material_list_page');

  static const String name = 'MaterialListPageRoute';
}

/// generated route for
/// [_i10.AupTCDialog]
class AupTCDialogRoute extends _i19.PageRouteInfo<AupTCDialogRouteArgs> {
  AupTCDialogRoute({_i20.Key? key, bool fromSetting = false})
      : super(AupTCDialogRoute.name,
            path: 'tos',
            args: AupTCDialogRouteArgs(key: key, fromSetting: fromSetting));

  static const String name = 'AupTCDialogRoute';
}

class AupTCDialogRouteArgs {
  const AupTCDialogRouteArgs({this.key, this.fromSetting = false});

  final _i20.Key? key;

  final bool fromSetting;

  @override
  String toString() {
    return 'AupTCDialogRouteArgs{key: $key, fromSetting: $fromSetting}';
  }
}

/// generated route for
/// [_i11.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i19.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(OrderTemplateListPageRoute.name,
            path: 'order_template_list_page');

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i12.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i19.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute(
      {_i20.Key? key, required _i21.OrderTemplate orderTemplateInfo})
      : super(OrderTemplateDetailPageRoute.name,
            path: 'order_template_detail_page',
            args: OrderTemplateDetailPageRouteArgs(
                key: key, orderTemplateInfo: orderTemplateInfo));

  static const String name = 'OrderTemplateDetailPageRoute';
}

class OrderTemplateDetailPageRouteArgs {
  const OrderTemplateDetailPageRouteArgs(
      {this.key, required this.orderTemplateInfo});

  final _i20.Key? key;

  final _i21.OrderTemplate orderTemplateInfo;

  @override
  String toString() {
    return 'OrderTemplateDetailPageRouteArgs{key: $key, orderTemplateInfo: $orderTemplateInfo}';
  }
}

/// generated route for
/// [_i13.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i19.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i19.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar', initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i14.SavedOrderListPage]
class SavedOrderListPageRoute extends _i19.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(SavedOrderListPageRoute.name, path: 'saved_order_list');

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i15.HomeTab]
class HomeTabRoute extends _i19.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i16.HistoryTab]
class HistoryTabRoute extends _i19.PageRouteInfo<void> {
  const HistoryTabRoute() : super(HistoryTabRoute.name, path: 'history-tab');

  static const String name = 'HistoryTabRoute';
}

/// generated route for
/// [_i17.FavoritesTab]
class FavoritesTabRoute extends _i19.PageRouteInfo<void> {
  const FavoritesTabRoute()
      : super(FavoritesTabRoute.name, path: 'favorites-tab');

  static const String name = 'FavoritesTabRoute';
}

/// generated route for
/// [_i18.AccountTab]
class AccountTabRoute extends _i19.PageRouteInfo<void> {
  const AccountTabRoute() : super(AccountTabRoute.name, path: 'account-tab');

  static const String name = 'AccountTabRoute';
}
