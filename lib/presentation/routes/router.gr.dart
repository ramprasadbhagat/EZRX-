// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i36;
import 'package:flutter/material.dart' as _i37;

import '../../application/order/material_filter/material_filter_bloc.dart'
    as _i38;
import '../../domain/account/entities/bill_to_info.dart' as _i42;
import '../../domain/account/entities/customer_code_info.dart' as _i43;
import '../../domain/account/entities/sales_organisation_configs.dart' as _i45;
import '../../domain/core/aggregate/bundle_aggregate.dart' as _i47;
import '../../domain/core/aggregate/price_aggregate.dart' as _i46;
import '../../domain/order/entities/order_history_basic_info.dart' as _i44;
import '../../domain/order/entities/order_history_item.dart' as _i41;
import '../../domain/order/entities/order_template.dart' as _i39;
import '../../domain/order/entities/saved_order.dart' as _i40;
import '../account/account_tab.dart' as _i35;
import '../account/change_password/change_password_page.dart' as _i12;
import '../account/contact_us/contact_us_page.dart' as _i13;
import '../account/customer_search.dart' as _i15;
import '../account/notification_settings/notification_settings_page.dart'
    as _i14;
import '../account/settings_page.dart' as _i4;
import '../account/ship_to_search.dart' as _i16;
import '../aup_tc/aup_tc.dart' as _i20;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i11;
import '../favourites/favourite_tab.dart' as _i34;
import '../history/history_details.dart' as _i29;
import '../history/history_tab.dart' as _i33;
import '../home/home_tab.dart' as _i32;
import '../home_tab.dart' as _i26;
import '../orders/cart/add_bonus.dart' as _i30;
import '../orders/cart/cart_page.dart' as _i22;
import '../orders/create_order/bundle_item_detail_page.dart' as _i31;
import '../orders/create_order/material_filter.dart' as _i19;
import '../orders/create_order/material_list.dart' as _i18;
import '../orders/create_order/material_root.dart' as _i17;
import '../orders/create_order/order_summary_page.dart' as _i23;
import '../orders/order_success/order_success_page.dart' as _i24;
import '../orders/order_template/order_template_detail_page.dart' as _i25;
import '../orders/order_template/order_template_list_page.dart' as _i21;
import '../orders/saved_order/saved_order_detail_page.dart' as _i28;
import '../orders/saved_order/saved_order_list_page.dart' as _i27;
import '../returns/approver_actions.dart' as _i7;
import '../returns/policy_configuration.dart' as _i10;
import '../returns/request_return.dart' as _i6;
import '../returns/return_summary.dart' as _i8;
import '../returns/returns_overview.dart' as _i5;
import '../returns/user_restriction_list.dart' as _i9;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i36.RootStackRouter {
  AppRouter([_i37.GlobalKey<_i37.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginOnBehalfPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsPage(),
      );
    },
    ReturnsOverviewRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ReturnsOverview(),
      );
    },
    RequestReturnRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RequestReturn(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ApproverActions(),
      );
    },
    ReturnSummaryRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.ReturnSummary(),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.PolicyConfigurationPage(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.CustomerSearchPage(),
      );
    },
    ShiptToSearchPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ShiptToSearchPage(),
      );
    },
    MaterialRootRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.MaterialRoot(),
      );
    },
    MaterialListPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialListPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.MaterialListPage(
          key: args.key,
          addToCart: args.addToCart,
        ),
      );
    },
    MaterialFilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialFilterPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.MaterialFilterPage(
          key: args.key,
          filterType: args.filterType,
        ),
      );
    },
    AupTCDialogRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCDialogRouteArgs>(
          orElse: () => const AupTCDialogRouteArgs());
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.AupTCDialog(
          key: args.key,
          fromSetting: args.fromSetting,
        ),
      );
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.OrderTemplateListPage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.CartPage(),
      );
    },
    OrderSummaryPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.OrderSummaryPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.OrderSuccessPage(),
      );
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.OrderTemplateDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.HomeNavigationTabbar(key: args.key),
      );
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.SavedOrderListPage(),
      );
    },
    SavedOrderDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<SavedOrderDetailPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.SavedOrderDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HistoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDetailsRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.HistoryDetails(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
          billToInfo: args.billToInfo,
          customerCodeInfo: args.customerCodeInfo,
          orderHistoryBasicInfo: args.orderHistoryBasicInfo,
          salesOrgConfigs: args.salesOrgConfigs,
        ),
      );
    },
    BonusAddPageRoute.name: (routeData) {
      final args = routeData.argsAs<BonusAddPageRouteArgs>();
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    BundleItemDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleItemDetailPageRouteArgs>();
      return _i36.CustomPage<dynamic>(
        routeData: routeData,
        child: _i31.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i36.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.HomeTab(),
      );
    },
    HistoryTabRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryTabRouteArgs>(
          orElse: () => const HistoryTabRouteArgs());
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i33.HistoryTab(key: args.key),
      );
    },
    FavouritesTabRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.WrappedRoute(child: const _i34.FavouritesTab()),
      );
    },
    AccountTabRoute.name: (routeData) {
      return _i36.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.AccountTab(),
      );
    },
  };

  @override
  List<_i36.RouteConfig> get routes => [
        _i36.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i36.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i36.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i36.RouteConfig(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        ),
        _i36.RouteConfig(
          SettingsPageRoute.name,
          path: 'settings',
        ),
        _i36.RouteConfig(
          ReturnsOverviewRoute.name,
          path: 'returns_overview',
        ),
        _i36.RouteConfig(
          RequestReturnRoute.name,
          path: 'request_return',
        ),
        _i36.RouteConfig(
          ApproverActionsRoute.name,
          path: 'approver_actions',
        ),
        _i36.RouteConfig(
          ReturnSummaryRoute.name,
          path: 'return_summary',
        ),
        _i36.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'user_restriction',
        ),
        _i36.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'policy_configuration',
        ),
        _i36.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view_page',
        ),
        _i36.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password_page',
        ),
        _i36.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us_page',
        ),
        _i36.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings_page',
        ),
        _i36.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search_page',
        ),
        _i36.RouteConfig(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search_page',
        ),
        _i36.RouteConfig(
          MaterialRootRoute.name,
          path: 'material_list_page',
        ),
        _i36.RouteConfig(
          MaterialListPageRoute.name,
          path: 'material_list_page',
        ),
        _i36.RouteConfig(
          MaterialFilterPageRoute.name,
          path: 'material_filter_page',
        ),
        _i36.RouteConfig(
          AupTCDialogRoute.name,
          path: 'tos',
        ),
        _i36.RouteConfig(
          OrderTemplateListPageRoute.name,
          path: 'order_template_list_page',
        ),
        _i36.RouteConfig(
          CartPageRoute.name,
          path: 'cart_page',
        ),
        _i36.RouteConfig(
          OrderSummaryPageRoute.name,
          path: 'order_summary',
        ),
        _i36.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'order_confirmation',
        ),
        _i36.RouteConfig(
          OrderTemplateDetailPageRoute.name,
          path: 'order_template_detail_page',
        ),
        _i36.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main_tabbar',
          children: [
            _i36.RouteConfig(
              HomeTabRoute.name,
              path: 'home-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i36.RouteConfig(
              HistoryTabRoute.name,
              path: 'history-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i36.RouteConfig(
              FavouritesTabRoute.name,
              path: 'favourites-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i36.RouteConfig(
              AccountTabRoute.name,
              path: 'account-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i36.RouteConfig(
          SavedOrderListPageRoute.name,
          path: 'saved_order_list',
        ),
        _i36.RouteConfig(
          SavedOrderDetailPageRoute.name,
          path: 'saved_order_detail',
        ),
        _i36.RouteConfig(
          HistoryDetailsRoute.name,
          path: 'history_details',
        ),
        _i36.RouteConfig(
          BonusAddPageRoute.name,
          path: 'add_bonus',
        ),
        _i36.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'bundle_item_detail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i36.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i36.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i36.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        );

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i36.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.ReturnsOverview]
class ReturnsOverviewRoute extends _i36.PageRouteInfo<void> {
  const ReturnsOverviewRoute()
      : super(
          ReturnsOverviewRoute.name,
          path: 'returns_overview',
        );

  static const String name = 'ReturnsOverviewRoute';
}

/// generated route for
/// [_i6.RequestReturn]
class RequestReturnRoute extends _i36.PageRouteInfo<void> {
  const RequestReturnRoute()
      : super(
          RequestReturnRoute.name,
          path: 'request_return',
        );

  static const String name = 'RequestReturnRoute';
}

/// generated route for
/// [_i7.ApproverActions]
class ApproverActionsRoute extends _i36.PageRouteInfo<void> {
  const ApproverActionsRoute()
      : super(
          ApproverActionsRoute.name,
          path: 'approver_actions',
        );

  static const String name = 'ApproverActionsRoute';
}

/// generated route for
/// [_i8.ReturnSummary]
class ReturnSummaryRoute extends _i36.PageRouteInfo<void> {
  const ReturnSummaryRoute()
      : super(
          ReturnSummaryRoute.name,
          path: 'return_summary',
        );

  static const String name = 'ReturnSummaryRoute';
}

/// generated route for
/// [_i9.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i36.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'user_restriction',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i10.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i36.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i11.WebViewPage]
class WebViewPageRoute extends _i36.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i37.Key? key,
    String url = '',
    String? initialFile,
  }) : super(
          WebViewPageRoute.name,
          path: 'web_view_page',
          args: WebViewPageRouteArgs(
            key: key,
            url: url,
            initialFile: initialFile,
          ),
        );

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({
    this.key,
    this.url = '',
    this.initialFile,
  });

  final _i37.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i12.ChangePasswordPage]
class ChangePasswordPageRoute extends _i36.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password_page',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i13.ContactUsPage]
class ContactUsPageRoute extends _i36.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us_page',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i14.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i36.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings_page',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i15.CustomerSearchPage]
class CustomerSearchPageRoute extends _i36.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search_page',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i16.ShiptToSearchPage]
class ShiptToSearchPageRoute extends _i36.PageRouteInfo<void> {
  const ShiptToSearchPageRoute()
      : super(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search_page',
        );

  static const String name = 'ShiptToSearchPageRoute';
}

/// generated route for
/// [_i17.MaterialRoot]
class MaterialRootRoute extends _i36.PageRouteInfo<void> {
  const MaterialRootRoute()
      : super(
          MaterialRootRoute.name,
          path: 'material_list_page',
        );

  static const String name = 'MaterialRootRoute';
}

/// generated route for
/// [_i18.MaterialListPage]
class MaterialListPageRoute
    extends _i36.PageRouteInfo<MaterialListPageRouteArgs> {
  MaterialListPageRoute({
    _i37.Key? key,
    required Function addToCart,
  }) : super(
          MaterialListPageRoute.name,
          path: 'material_list_page',
          args: MaterialListPageRouteArgs(
            key: key,
            addToCart: addToCart,
          ),
        );

  static const String name = 'MaterialListPageRoute';
}

class MaterialListPageRouteArgs {
  const MaterialListPageRouteArgs({
    this.key,
    required this.addToCart,
  });

  final _i37.Key? key;

  final Function addToCart;

  @override
  String toString() {
    return 'MaterialListPageRouteArgs{key: $key, addToCart: $addToCart}';
  }
}

/// generated route for
/// [_i19.MaterialFilterPage]
class MaterialFilterPageRoute
    extends _i36.PageRouteInfo<MaterialFilterPageRouteArgs> {
  MaterialFilterPageRoute({
    _i37.Key? key,
    required _i38.MaterialFilterType filterType,
  }) : super(
          MaterialFilterPageRoute.name,
          path: 'material_filter_page',
          args: MaterialFilterPageRouteArgs(
            key: key,
            filterType: filterType,
          ),
        );

  static const String name = 'MaterialFilterPageRoute';
}

class MaterialFilterPageRouteArgs {
  const MaterialFilterPageRouteArgs({
    this.key,
    required this.filterType,
  });

  final _i37.Key? key;

  final _i38.MaterialFilterType filterType;

  @override
  String toString() {
    return 'MaterialFilterPageRouteArgs{key: $key, filterType: $filterType}';
  }
}

/// generated route for
/// [_i20.AupTCDialog]
class AupTCDialogRoute extends _i36.PageRouteInfo<AupTCDialogRouteArgs> {
  AupTCDialogRoute({
    _i37.Key? key,
    bool fromSetting = false,
  }) : super(
          AupTCDialogRoute.name,
          path: 'tos',
          args: AupTCDialogRouteArgs(
            key: key,
            fromSetting: fromSetting,
          ),
        );

  static const String name = 'AupTCDialogRoute';
}

class AupTCDialogRouteArgs {
  const AupTCDialogRouteArgs({
    this.key,
    this.fromSetting = false,
  });

  final _i37.Key? key;

  final bool fromSetting;

  @override
  String toString() {
    return 'AupTCDialogRouteArgs{key: $key, fromSetting: $fromSetting}';
  }
}

/// generated route for
/// [_i21.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i36.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(
          OrderTemplateListPageRoute.name,
          path: 'order_template_list_page',
        );

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i22.CartPage]
class CartPageRoute extends _i36.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'cart_page',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i23.OrderSummaryPage]
class OrderSummaryPageRoute extends _i36.PageRouteInfo<void> {
  const OrderSummaryPageRoute()
      : super(
          OrderSummaryPageRoute.name,
          path: 'order_summary',
        );

  static const String name = 'OrderSummaryPageRoute';
}

/// generated route for
/// [_i24.OrderSuccessPage]
class OrderSuccessPageRoute extends _i36.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i25.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i36.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute({
    _i37.Key? key,
    required _i39.OrderTemplate order,
  }) : super(
          OrderTemplateDetailPageRoute.name,
          path: 'order_template_detail_page',
          args: OrderTemplateDetailPageRouteArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'OrderTemplateDetailPageRoute';
}

class OrderTemplateDetailPageRouteArgs {
  const OrderTemplateDetailPageRouteArgs({
    this.key,
    required this.order,
  });

  final _i37.Key? key;

  final _i39.OrderTemplate order;

  @override
  String toString() {
    return 'OrderTemplateDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i26.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i36.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i37.Key? key,
    List<_i36.PageRouteInfo>? children,
  }) : super(
          HomeNavigationTabbarRoute.name,
          path: 'main_tabbar',
          args: HomeNavigationTabbarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';
}

class HomeNavigationTabbarRouteArgs {
  const HomeNavigationTabbarRouteArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i27.SavedOrderListPage]
class SavedOrderListPageRoute extends _i36.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(
          SavedOrderListPageRoute.name,
          path: 'saved_order_list',
        );

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i28.SavedOrderDetailPage]
class SavedOrderDetailPageRoute
    extends _i36.PageRouteInfo<SavedOrderDetailPageRouteArgs> {
  SavedOrderDetailPageRoute({
    _i37.Key? key,
    required _i40.SavedOrder order,
  }) : super(
          SavedOrderDetailPageRoute.name,
          path: 'saved_order_detail',
          args: SavedOrderDetailPageRouteArgs(
            key: key,
            order: order,
          ),
        );

  static const String name = 'SavedOrderDetailPageRoute';
}

class SavedOrderDetailPageRouteArgs {
  const SavedOrderDetailPageRouteArgs({
    this.key,
    required this.order,
  });

  final _i37.Key? key;

  final _i40.SavedOrder order;

  @override
  String toString() {
    return 'SavedOrderDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i29.HistoryDetails]
class HistoryDetailsRoute extends _i36.PageRouteInfo<HistoryDetailsRouteArgs> {
  HistoryDetailsRoute({
    _i37.Key? key,
    required _i41.OrderHistoryItem orderHistoryItem,
    required _i42.BillToInfo billToInfo,
    required _i43.CustomerCodeInfo customerCodeInfo,
    required _i44.OrderHistoryBasicInfo orderHistoryBasicInfo,
    required _i45.SalesOrganisationConfigs salesOrgConfigs,
  }) : super(
          HistoryDetailsRoute.name,
          path: 'history_details',
          args: HistoryDetailsRouteArgs(
            key: key,
            orderHistoryItem: orderHistoryItem,
            billToInfo: billToInfo,
            customerCodeInfo: customerCodeInfo,
            orderHistoryBasicInfo: orderHistoryBasicInfo,
            salesOrgConfigs: salesOrgConfigs,
          ),
        );

  static const String name = 'HistoryDetailsRoute';
}

class HistoryDetailsRouteArgs {
  const HistoryDetailsRouteArgs({
    this.key,
    required this.orderHistoryItem,
    required this.billToInfo,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
    required this.salesOrgConfigs,
  });

  final _i37.Key? key;

  final _i41.OrderHistoryItem orderHistoryItem;

  final _i42.BillToInfo billToInfo;

  final _i43.CustomerCodeInfo customerCodeInfo;

  final _i44.OrderHistoryBasicInfo orderHistoryBasicInfo;

  final _i45.SalesOrganisationConfigs salesOrgConfigs;

  @override
  String toString() {
    return 'HistoryDetailsRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem, billToInfo: $billToInfo, customerCodeInfo: $customerCodeInfo, orderHistoryBasicInfo: $orderHistoryBasicInfo, salesOrgConfigs: $salesOrgConfigs}';
  }
}

/// generated route for
/// [_i30.BonusAddPage]
class BonusAddPageRoute extends _i36.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i37.Key? key,
    required _i46.PriceAggregate cartItem,
  }) : super(
          BonusAddPageRoute.name,
          path: 'add_bonus',
          args: BonusAddPageRouteArgs(
            key: key,
            cartItem: cartItem,
          ),
        );

  static const String name = 'BonusAddPageRoute';
}

class BonusAddPageRouteArgs {
  const BonusAddPageRouteArgs({
    this.key,
    required this.cartItem,
  });

  final _i37.Key? key;

  final _i46.PriceAggregate cartItem;

  @override
  String toString() {
    return 'BonusAddPageRouteArgs{key: $key, cartItem: $cartItem}';
  }
}

/// generated route for
/// [_i31.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i36.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i37.Key? key,
    required _i47.BundleAggregate bundleAggregate,
  }) : super(
          BundleItemDetailPageRoute.name,
          path: 'bundle_item_detail',
          args: BundleItemDetailPageRouteArgs(
            key: key,
            bundleAggregate: bundleAggregate,
          ),
        );

  static const String name = 'BundleItemDetailPageRoute';
}

class BundleItemDetailPageRouteArgs {
  const BundleItemDetailPageRouteArgs({
    this.key,
    required this.bundleAggregate,
  });

  final _i37.Key? key;

  final _i47.BundleAggregate bundleAggregate;

  @override
  String toString() {
    return 'BundleItemDetailPageRouteArgs{key: $key, bundleAggregate: $bundleAggregate}';
  }
}

/// generated route for
/// [_i32.HomeTab]
class HomeTabRoute extends _i36.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home-tab',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i33.HistoryTab]
class HistoryTabRoute extends _i36.PageRouteInfo<HistoryTabRouteArgs> {
  HistoryTabRoute({_i37.Key? key})
      : super(
          HistoryTabRoute.name,
          path: 'history-tab',
          args: HistoryTabRouteArgs(key: key),
        );

  static const String name = 'HistoryTabRoute';
}

class HistoryTabRouteArgs {
  const HistoryTabRouteArgs({this.key});

  final _i37.Key? key;

  @override
  String toString() {
    return 'HistoryTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i34.FavouritesTab]
class FavouritesTabRoute extends _i36.PageRouteInfo<void> {
  const FavouritesTabRoute()
      : super(
          FavouritesTabRoute.name,
          path: 'favourites-tab',
        );

  static const String name = 'FavouritesTabRoute';
}

/// generated route for
/// [_i35.AccountTab]
class AccountTabRoute extends _i36.PageRouteInfo<void> {
  const AccountTabRoute()
      : super(
          AccountTabRoute.name,
          path: 'account-tab',
        );

  static const String name = 'AccountTabRoute';
}
