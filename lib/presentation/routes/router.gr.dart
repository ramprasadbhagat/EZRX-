// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i26;
import 'package:flutter/material.dart' as _i27;

import '../../application/order/material_filter/material_filter_bloc.dart'
    as _i28;
import '../../domain/account/entities/customer_code_info.dart' as _i31;
import '../../domain/account/entities/ship_to_info.dart' as _i32;
import '../../domain/order/entities/order_history_basic_info.dart' as _i33;
import '../../domain/order/entities/order_history_item.dart' as _i30;
import '../../domain/order/entities/order_template.dart' as _i29;
import '../account/account_tab.dart' as _i25;
import '../account/change_password/change_password_page.dart' as _i6;
import '../account/contact_us/contact_us_page.dart' as _i7;
import '../account/customer_search.dart' as _i9;
import '../account/notification_settings/notification_settings_page.dart'
    as _i8;
import '../account/settings_page.dart' as _i4;
import '../account/ship_to_search.dart' as _i10;
import '../aup_tc/aup_tc.dart' as _i14;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i5;
import '../favourites/favourite_tab.dart' as _i24;
import '../history/history_details.dart' as _i21;
import '../history/history_tab.dart' as _i23;
import '../home/home_tab.dart' as _i22;
import '../home_tab.dart' as _i19;
import '../orders/cart/cart_page.dart' as _i16;
import '../orders/create_order/material_filter.dart' as _i13;
import '../orders/create_order/material_list.dart' as _i12;
import '../orders/create_order/material_root.dart' as _i11;
import '../orders/create_order/order_summary_page.dart' as _i17;
import '../orders/order_template/order_template_detail_page.dart' as _i18;
import '../orders/order_template/order_template_list_page.dart' as _i15;
import '../orders/saved_order/saved_order_list_page.dart' as _i20;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i26.RootStackRouter {
  AppRouter([_i27.GlobalKey<_i27.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i26.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashPage());
    },
    LoginPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginOnBehalfPage());
    },
    SettingsPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SettingsPage());
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.WebViewPage(
              key: args.key, url: args.url, initialFile: args.initialFile));
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ChangePasswordPage());
    },
    ContactUsPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ContactUsPage());
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.NotificationSettingsPage());
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CustomerSearchPage());
    },
    ShiptToSearchPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ShiptToSearchPage());
    },
    MaterialRootRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.MaterialRoot());
    },
    MaterialListPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialListPageRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i12.MaterialListPage(key: args.key, addToCart: args.addToCart));
    },
    MaterialFilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialFilterPageRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.MaterialFilterPage(
              key: args.key, filterType: args.filterType));
    },
    AupTCDialogRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCDialogRouteArgs>(
          orElse: () => const AupTCDialogRouteArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i14.AupTCDialog(key: args.key, fromSetting: args.fromSetting));
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.OrderTemplateListPage());
    },
    CartPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CartPage());
    },
    OrderSummaryPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.OrderSummaryPage());
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i18.OrderTemplateDetailPage(
              key: args.key, orderTemplateInfo: args.orderTemplateInfo));
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i19.HomeNavigationTabbar(key: args.key));
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.SavedOrderListPage());
    },
    HistoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDetailsRouteArgs>();
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i21.HistoryDetails(
              key: args.key,
              orderHistoryItem: args.orderHistoryItem,
              customerCodeInfo: args.customerCodeInfo,
              shipToInfo: args.shipToInfo,
              orderHistoryBasicInfo: args.orderHistoryBasicInfo));
    },
    HomeTabRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.HomeTab());
    },
    HistoryTabRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryTabRouteArgs>(
          orElse: () => const HistoryTabRouteArgs());
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.HistoryTab(key: args.key));
    },
    FavouritesTabRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.FavouritesTab());
    },
    AccountTabRoute.name: (routeData) {
      return _i26.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.AccountTab());
    }
  };

  @override
  List<_i26.RouteConfig> get routes => [
        _i26.RouteConfig('/#redirect',
            path: '/', redirectTo: 'splash', fullMatch: true),
        _i26.RouteConfig(SplashPageRoute.name, path: 'splash'),
        _i26.RouteConfig(LoginPageRoute.name, path: 'login'),
        _i26.RouteConfig(LoginOnBehalfPageRoute.name, path: 'login_on_behalf'),
        _i26.RouteConfig(SettingsPageRoute.name, path: 'settings'),
        _i26.RouteConfig(WebViewPageRoute.name, path: 'web_view_page'),
        _i26.RouteConfig(ChangePasswordPageRoute.name,
            path: 'change_password_page'),
        _i26.RouteConfig(ContactUsPageRoute.name, path: 'contact_us_page'),
        _i26.RouteConfig(NotificationSettingsPageRoute.name,
            path: 'notification_settings_page'),
        _i26.RouteConfig(CustomerSearchPageRoute.name,
            path: 'customer_search_page'),
        _i26.RouteConfig(ShiptToSearchPageRoute.name,
            path: 'ship_to_search_page'),
        _i26.RouteConfig(MaterialRootRoute.name, path: 'material_list_page'),
        _i26.RouteConfig(MaterialListPageRoute.name,
            path: 'material_list_page'),
        _i26.RouteConfig(MaterialFilterPageRoute.name,
            path: 'material_filter_page'),
        _i26.RouteConfig(AupTCDialogRoute.name, path: 'tos'),
        _i26.RouteConfig(OrderTemplateListPageRoute.name,
            path: 'order_template_list_page'),
        _i26.RouteConfig(CartPageRoute.name, path: 'cart_page'),
        _i26.RouteConfig(OrderSummaryPageRoute.name, path: 'order_summary'),
        _i26.RouteConfig(OrderTemplateDetailPageRoute.name,
            path: 'order_template_detail_page'),
        _i26.RouteConfig(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            children: [
              _i26.RouteConfig(HomeTabRoute.name,
                  path: 'home-tab', parent: HomeNavigationTabbarRoute.name),
              _i26.RouteConfig(HistoryTabRoute.name,
                  path: 'history-tab', parent: HomeNavigationTabbarRoute.name),
              _i26.RouteConfig(FavouritesTabRoute.name,
                  path: 'favourites-tab',
                  parent: HomeNavigationTabbarRoute.name),
              _i26.RouteConfig(AccountTabRoute.name,
                  path: 'account-tab', parent: HomeNavigationTabbarRoute.name)
            ]),
        _i26.RouteConfig(SavedOrderListPageRoute.name,
            path: 'saved_order_list'),
        _i26.RouteConfig(HistoryDetailsRoute.name, path: 'history_details')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i26.PageRouteInfo<void> {
  const SplashPageRoute() : super(SplashPageRoute.name, path: 'splash');

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i26.PageRouteInfo<void> {
  const LoginPageRoute() : super(LoginPageRoute.name, path: 'login');

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i26.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(LoginOnBehalfPageRoute.name, path: 'login_on_behalf');

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i26.PageRouteInfo<void> {
  const SettingsPageRoute() : super(SettingsPageRoute.name, path: 'settings');

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.WebViewPage]
class WebViewPageRoute extends _i26.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({_i27.Key? key, String url = '', String? initialFile})
      : super(WebViewPageRoute.name,
            path: 'web_view_page',
            args: WebViewPageRouteArgs(
                key: key, url: url, initialFile: initialFile));

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({this.key, this.url = '', this.initialFile});

  final _i27.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i6.ChangePasswordPage]
class ChangePasswordPageRoute extends _i26.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(ChangePasswordPageRoute.name, path: 'change_password_page');

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i7.ContactUsPage]
class ContactUsPageRoute extends _i26.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(ContactUsPageRoute.name, path: 'contact_us_page');

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i8.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i26.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(NotificationSettingsPageRoute.name,
            path: 'notification_settings_page');

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i9.CustomerSearchPage]
class CustomerSearchPageRoute extends _i26.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(CustomerSearchPageRoute.name, path: 'customer_search_page');

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i10.ShiptToSearchPage]
class ShiptToSearchPageRoute extends _i26.PageRouteInfo<void> {
  const ShiptToSearchPageRoute()
      : super(ShiptToSearchPageRoute.name, path: 'ship_to_search_page');

  static const String name = 'ShiptToSearchPageRoute';
}

/// generated route for
/// [_i11.MaterialRoot]
class MaterialRootRoute extends _i26.PageRouteInfo<void> {
  const MaterialRootRoute()
      : super(MaterialRootRoute.name, path: 'material_list_page');

  static const String name = 'MaterialRootRoute';
}

/// generated route for
/// [_i12.MaterialListPage]
class MaterialListPageRoute
    extends _i26.PageRouteInfo<MaterialListPageRouteArgs> {
  MaterialListPageRoute({_i27.Key? key, required Function addToCart})
      : super(MaterialListPageRoute.name,
            path: 'material_list_page',
            args: MaterialListPageRouteArgs(key: key, addToCart: addToCart));

  static const String name = 'MaterialListPageRoute';
}

class MaterialListPageRouteArgs {
  const MaterialListPageRouteArgs({this.key, required this.addToCart});

  final _i27.Key? key;

  final Function addToCart;

  @override
  String toString() {
    return 'MaterialListPageRouteArgs{key: $key, addToCart: $addToCart}';
  }
}

/// generated route for
/// [_i13.MaterialFilterPage]
class MaterialFilterPageRoute
    extends _i26.PageRouteInfo<MaterialFilterPageRouteArgs> {
  MaterialFilterPageRoute(
      {_i27.Key? key, required _i28.MaterialFilterType filterType})
      : super(MaterialFilterPageRoute.name,
            path: 'material_filter_page',
            args:
                MaterialFilterPageRouteArgs(key: key, filterType: filterType));

  static const String name = 'MaterialFilterPageRoute';
}

class MaterialFilterPageRouteArgs {
  const MaterialFilterPageRouteArgs({this.key, required this.filterType});

  final _i27.Key? key;

  final _i28.MaterialFilterType filterType;

  @override
  String toString() {
    return 'MaterialFilterPageRouteArgs{key: $key, filterType: $filterType}';
  }
}

/// generated route for
/// [_i14.AupTCDialog]
class AupTCDialogRoute extends _i26.PageRouteInfo<AupTCDialogRouteArgs> {
  AupTCDialogRoute({_i27.Key? key, bool fromSetting = false})
      : super(AupTCDialogRoute.name,
            path: 'tos',
            args: AupTCDialogRouteArgs(key: key, fromSetting: fromSetting));

  static const String name = 'AupTCDialogRoute';
}

class AupTCDialogRouteArgs {
  const AupTCDialogRouteArgs({this.key, this.fromSetting = false});

  final _i27.Key? key;

  final bool fromSetting;

  @override
  String toString() {
    return 'AupTCDialogRouteArgs{key: $key, fromSetting: $fromSetting}';
  }
}

/// generated route for
/// [_i15.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i26.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(OrderTemplateListPageRoute.name,
            path: 'order_template_list_page');

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i16.CartPage]
class CartPageRoute extends _i26.PageRouteInfo<void> {
  const CartPageRoute() : super(CartPageRoute.name, path: 'cart_page');

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i17.OrderSummaryPage]
class OrderSummaryPageRoute extends _i26.PageRouteInfo<void> {
  const OrderSummaryPageRoute()
      : super(OrderSummaryPageRoute.name, path: 'order_summary');

  static const String name = 'OrderSummaryPageRoute';
}

/// generated route for
/// [_i18.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i26.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute(
      {_i27.Key? key, required _i29.OrderTemplate orderTemplateInfo})
      : super(OrderTemplateDetailPageRoute.name,
            path: 'order_template_detail_page',
            args: OrderTemplateDetailPageRouteArgs(
                key: key, orderTemplateInfo: orderTemplateInfo));

  static const String name = 'OrderTemplateDetailPageRoute';
}

class OrderTemplateDetailPageRouteArgs {
  const OrderTemplateDetailPageRouteArgs(
      {this.key, required this.orderTemplateInfo});

  final _i27.Key? key;

  final _i29.OrderTemplate orderTemplateInfo;

  @override
  String toString() {
    return 'OrderTemplateDetailPageRouteArgs{key: $key, orderTemplateInfo: $orderTemplateInfo}';
  }
}

/// generated route for
/// [_i19.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i26.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({_i27.Key? key, List<_i26.PageRouteInfo>? children})
      : super(HomeNavigationTabbarRoute.name,
            path: 'main_tabbar',
            args: HomeNavigationTabbarRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeNavigationTabbarRoute';
}

class HomeNavigationTabbarRouteArgs {
  const HomeNavigationTabbarRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i20.SavedOrderListPage]
class SavedOrderListPageRoute extends _i26.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(SavedOrderListPageRoute.name, path: 'saved_order_list');

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i21.HistoryDetails]
class HistoryDetailsRoute extends _i26.PageRouteInfo<HistoryDetailsRouteArgs> {
  HistoryDetailsRoute(
      {_i27.Key? key,
      required _i30.OrderHistoryItem orderHistoryItem,
      required _i31.CustomerCodeInfo customerCodeInfo,
      required _i32.ShipToInfo shipToInfo,
      required _i33.OrderHistoryBasicInfo orderHistoryBasicInfo})
      : super(HistoryDetailsRoute.name,
            path: 'history_details',
            args: HistoryDetailsRouteArgs(
                key: key,
                orderHistoryItem: orderHistoryItem,
                customerCodeInfo: customerCodeInfo,
                shipToInfo: shipToInfo,
                orderHistoryBasicInfo: orderHistoryBasicInfo));

  static const String name = 'HistoryDetailsRoute';
}

class HistoryDetailsRouteArgs {
  const HistoryDetailsRouteArgs(
      {this.key,
      required this.orderHistoryItem,
      required this.customerCodeInfo,
      required this.shipToInfo,
      required this.orderHistoryBasicInfo});

  final _i27.Key? key;

  final _i30.OrderHistoryItem orderHistoryItem;

  final _i31.CustomerCodeInfo customerCodeInfo;

  final _i32.ShipToInfo shipToInfo;

  final _i33.OrderHistoryBasicInfo orderHistoryBasicInfo;

  @override
  String toString() {
    return 'HistoryDetailsRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, orderHistoryBasicInfo: $orderHistoryBasicInfo}';
  }
}

/// generated route for
/// [_i22.HomeTab]
class HomeTabRoute extends _i26.PageRouteInfo<void> {
  const HomeTabRoute() : super(HomeTabRoute.name, path: 'home-tab');

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i23.HistoryTab]
class HistoryTabRoute extends _i26.PageRouteInfo<HistoryTabRouteArgs> {
  HistoryTabRoute({_i27.Key? key})
      : super(HistoryTabRoute.name,
            path: 'history-tab', args: HistoryTabRouteArgs(key: key));

  static const String name = 'HistoryTabRoute';
}

class HistoryTabRouteArgs {
  const HistoryTabRouteArgs({this.key});

  final _i27.Key? key;

  @override
  String toString() {
    return 'HistoryTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i24.FavouritesTab]
class FavouritesTabRoute extends _i26.PageRouteInfo<void> {
  const FavouritesTabRoute()
      : super(FavouritesTabRoute.name, path: 'favourites-tab');

  static const String name = 'FavouritesTabRoute';
}

/// generated route for
/// [_i25.AccountTab]
class AccountTabRoute extends _i26.PageRouteInfo<void> {
  const AccountTabRoute() : super(AccountTabRoute.name, path: 'account-tab');

  static const String name = 'AccountTabRoute';
}
