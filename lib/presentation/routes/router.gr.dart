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
import 'package:auto_route/auto_route.dart' as _i41;
import 'package:flutter/material.dart' as _i42;

import '../../application/order/material_filter/material_filter_bloc.dart'
    as _i43;
import '../../domain/account/entities/bill_to_info.dart' as _i47;
import '../../domain/account/entities/customer_code_info.dart' as _i48;
import '../../domain/account/entities/sales_organisation_configs.dart' as _i50;
import '../../domain/account/entities/ship_to_info.dart' as _i52;
import '../../domain/core/aggregate/bundle_aggregate.dart' as _i54;
import '../../domain/core/aggregate/price_aggregate.dart' as _i55;
import '../../domain/order/entities/cart_item.dart' as _i51;
import '../../domain/order/entities/order_history_basic_info.dart' as _i49;
import '../../domain/order/entities/order_history_item.dart' as _i46;
import '../../domain/order/entities/order_template.dart' as _i44;
import '../../domain/order/entities/saved_order.dart' as _i45;
import '../../domain/returns/entities/return_summary_requests.dart' as _i53;
import '../account/account_tab.dart' as _i40;
import '../account/change_password/change_password_page.dart' as _i13;
import '../account/contact_us/contact_us_page.dart' as _i14;
import '../account/customer_search.dart' as _i16;
import '../account/notification_settings/notification_settings_page.dart'
    as _i15;
import '../account/settings_page.dart' as _i4;
import '../account/ship_to_search.dart' as _i17;
import '../aup_tc/aup_tc.dart' as _i21;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i12;
import '../favourites/favourite_tab.dart' as _i39;
import '../history/detail/history_details.dart' as _i30;
import '../history/history_tab.dart' as _i38;
import '../home/home_tab.dart' as _i37;
import '../home_tab.dart' as _i27;
import '../orders/cart/bonus/search_bonus_page.dart' as _i31;
import '../orders/cart/cart_page.dart' as _i23;
import '../orders/combo_deal/combo_deal_detail_page.dart' as _i36;
import '../orders/create_order/bundle_item_detail_page.dart' as _i35;
import '../orders/create_order/material_filter.dart' as _i20;
import '../orders/create_order/material_list/material_list.dart' as _i19;
import '../orders/create_order/material_root.dart' as _i18;
import '../orders/create_order/order_summary_page.dart' as _i24;
import '../orders/create_order/scan_material_info.dart' as _i33;
import '../orders/order_success/order_success_page.dart' as _i25;
import '../orders/order_template/order_template_detail_page.dart' as _i26;
import '../orders/order_template/order_template_list_page.dart' as _i22;
import '../orders/saved_order/saved_order_detail_page.dart' as _i29;
import '../orders/saved_order/saved_order_list_page.dart' as _i28;
import '../returns/add_edit_user_restrictions.dart' as _i32;
import '../returns/approver_actions/approver_actions.dart' as _i7;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i11;
import '../returns/policy_configuration/policy_configuration.dart' as _i10;
import '../returns/request_return/request_return.dart' as _i6;
import '../returns/return_summary/return_summary.dart' as _i8;
import '../returns/return_summary_details/return_summary_details.dart' as _i34;
import '../returns/returns_overview.dart' as _i5;
import '../returns/user_restriction_list.dart' as _i9;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i41.RootStackRouter {
  AppRouter([_i42.GlobalKey<_i42.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i41.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginOnBehalfPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsPage(),
      );
    },
    ReturnsOverviewRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ReturnsOverview(),
      );
    },
    RequestReturnRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.RequestReturn(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ApproverActions(key: args.key),
      );
    },
    ReturnSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryRouteArgs>(
          orElse: () => const ReturnSummaryRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ReturnSummary(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.CustomerSearchPage(),
      );
    },
    ShiptToSearchPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.ShiptToSearchPage(),
      );
    },
    MaterialRootRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.MaterialRoot(),
      );
    },
    MaterialListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.MaterialListPage(),
      );
    },
    MaterialFilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialFilterPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.MaterialFilterPage(
          key: args.key,
          filterType: args.filterType,
        ),
      );
    },
    AupTCDialogRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCDialogRouteArgs>(
          orElse: () => const AupTCDialogRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.AupTCDialog(
          key: args.key,
          fromSetting: args.fromSetting,
        ),
      );
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.OrderTemplateListPage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.CartPage(),
      );
    },
    OrderSummaryPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.OrderSummaryPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.OrderSuccessPage(),
      );
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.OrderTemplateDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.HomeNavigationTabbar(key: args.key),
      );
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.SavedOrderListPage(),
      );
    },
    SavedOrderDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<SavedOrderDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.SavedOrderDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HistoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDetailsRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.HistoryDetails(
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
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i31.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.ScanMaterialInfo(),
      );
    },
    ReturnSummaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryDetailsRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.ReturnSummaryDetails(
          key: args.key,
          customerCodeInfo: args.customerCodeInfo,
          shipToInfo: args.shipToInfo,
          returnSummaryRequests: args.returnSummaryRequests,
        ),
      );
    },
    BundleItemDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleItemDetailPageRouteArgs>();
      return _i41.CustomPage<dynamic>(
        routeData: routeData,
        child: _i35.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i41.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ComboDealDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ComboDealDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.WrappedRoute(
            child: _i36.ComboDealDetailPage(
          key: args.key,
          comboItems: args.comboItems,
          isEdit: args.isEdit,
        )),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.HomeTab(),
      );
    },
    HistoryTabRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryTabRouteArgs>(
          orElse: () => const HistoryTabRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i38.HistoryTab(key: args.key),
      );
    },
    FavouritesTabRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.FavouritesTab(),
      );
    },
    AccountTabRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.AccountTab(),
      );
    },
  };

  @override
  List<_i41.RouteConfig> get routes => [
        _i41.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i41.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i41.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i41.RouteConfig(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        ),
        _i41.RouteConfig(
          SettingsPageRoute.name,
          path: 'settings',
        ),
        _i41.RouteConfig(
          ReturnsOverviewRoute.name,
          path: 'returns_overview',
        ),
        _i41.RouteConfig(
          RequestReturnRoute.name,
          path: 'request_return',
        ),
        _i41.RouteConfig(
          ApproverActionsRoute.name,
          path: 'approver_actions',
        ),
        _i41.RouteConfig(
          ReturnSummaryRoute.name,
          path: 'return_summary',
        ),
        _i41.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'user_restriction',
        ),
        _i41.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'policy_configuration',
        ),
        _i41.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'add_policy_config',
        ),
        _i41.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view_page',
        ),
        _i41.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password_page',
        ),
        _i41.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us_page',
        ),
        _i41.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings_page',
        ),
        _i41.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search_page',
        ),
        _i41.RouteConfig(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search_page',
        ),
        _i41.RouteConfig(
          MaterialRootRoute.name,
          path: 'material_list_page',
        ),
        _i41.RouteConfig(
          MaterialListPageRoute.name,
          path: 'material_list_page',
        ),
        _i41.RouteConfig(
          MaterialFilterPageRoute.name,
          path: 'material_filter_page',
        ),
        _i41.RouteConfig(
          AupTCDialogRoute.name,
          path: 'tos',
        ),
        _i41.RouteConfig(
          OrderTemplateListPageRoute.name,
          path: 'order_template_list_page',
        ),
        _i41.RouteConfig(
          CartPageRoute.name,
          path: 'cart_page',
        ),
        _i41.RouteConfig(
          OrderSummaryPageRoute.name,
          path: 'order_summary',
        ),
        _i41.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'order_confirmation',
        ),
        _i41.RouteConfig(
          OrderTemplateDetailPageRoute.name,
          path: 'order_template_detail_page',
        ),
        _i41.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main_tabbar',
          children: [
            _i41.RouteConfig(
              HomeTabRoute.name,
              path: 'home-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              HistoryTabRoute.name,
              path: 'history-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              FavouritesTabRoute.name,
              path: 'favourites-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              AccountTabRoute.name,
              path: 'account-tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i41.RouteConfig(
          SavedOrderListPageRoute.name,
          path: 'saved_order_list',
        ),
        _i41.RouteConfig(
          SavedOrderDetailPageRoute.name,
          path: 'saved_order_detail',
        ),
        _i41.RouteConfig(
          HistoryDetailsRoute.name,
          path: 'history_details',
        ),
        _i41.RouteConfig(
          BonusAddPageRoute.name,
          path: 'add_bonus',
        ),
        _i41.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'add_edit_user_restriction',
        ),
        _i41.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'scan_material_info',
        ),
        _i41.RouteConfig(
          ReturnSummaryDetailsRoute.name,
          path: 'return_summary_details',
        ),
        _i41.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'bundle_item_detail',
        ),
        _i41.RouteConfig(
          ComboDealDetailPageRoute.name,
          path: 'combo_deal_detail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i41.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i41.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i41.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        );

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i41.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.ReturnsOverview]
class ReturnsOverviewRoute extends _i41.PageRouteInfo<void> {
  const ReturnsOverviewRoute()
      : super(
          ReturnsOverviewRoute.name,
          path: 'returns_overview',
        );

  static const String name = 'ReturnsOverviewRoute';
}

/// generated route for
/// [_i6.RequestReturn]
class RequestReturnRoute extends _i41.PageRouteInfo<void> {
  const RequestReturnRoute()
      : super(
          RequestReturnRoute.name,
          path: 'request_return',
        );

  static const String name = 'RequestReturnRoute';
}

/// generated route for
/// [_i7.ApproverActions]
class ApproverActionsRoute
    extends _i41.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i42.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i42.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ReturnSummary]
class ReturnSummaryRoute extends _i41.PageRouteInfo<ReturnSummaryRouteArgs> {
  ReturnSummaryRoute({_i42.Key? key})
      : super(
          ReturnSummaryRoute.name,
          path: 'return_summary',
          args: ReturnSummaryRouteArgs(key: key),
        );

  static const String name = 'ReturnSummaryRoute';
}

class ReturnSummaryRouteArgs {
  const ReturnSummaryRouteArgs({this.key});

  final _i42.Key? key;

  @override
  String toString() {
    return 'ReturnSummaryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i41.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'user_restriction',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i10.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i41.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i11.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i41.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i12.WebViewPage]
class WebViewPageRoute extends _i41.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i42.Key? key,
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

  final _i42.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i13.ChangePasswordPage]
class ChangePasswordPageRoute extends _i41.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password_page',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i14.ContactUsPage]
class ContactUsPageRoute extends _i41.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us_page',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i15.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i41.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings_page',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i16.CustomerSearchPage]
class CustomerSearchPageRoute extends _i41.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search_page',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i17.ShiptToSearchPage]
class ShiptToSearchPageRoute extends _i41.PageRouteInfo<void> {
  const ShiptToSearchPageRoute()
      : super(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search_page',
        );

  static const String name = 'ShiptToSearchPageRoute';
}

/// generated route for
/// [_i18.MaterialRoot]
class MaterialRootRoute extends _i41.PageRouteInfo<void> {
  const MaterialRootRoute()
      : super(
          MaterialRootRoute.name,
          path: 'material_list_page',
        );

  static const String name = 'MaterialRootRoute';
}

/// generated route for
/// [_i19.MaterialListPage]
class MaterialListPageRoute extends _i41.PageRouteInfo<void> {
  const MaterialListPageRoute()
      : super(
          MaterialListPageRoute.name,
          path: 'material_list_page',
        );

  static const String name = 'MaterialListPageRoute';
}

/// generated route for
/// [_i20.MaterialFilterPage]
class MaterialFilterPageRoute
    extends _i41.PageRouteInfo<MaterialFilterPageRouteArgs> {
  MaterialFilterPageRoute({
    _i42.Key? key,
    required _i43.MaterialFilterType filterType,
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

  final _i42.Key? key;

  final _i43.MaterialFilterType filterType;

  @override
  String toString() {
    return 'MaterialFilterPageRouteArgs{key: $key, filterType: $filterType}';
  }
}

/// generated route for
/// [_i21.AupTCDialog]
class AupTCDialogRoute extends _i41.PageRouteInfo<AupTCDialogRouteArgs> {
  AupTCDialogRoute({
    _i42.Key? key,
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

  final _i42.Key? key;

  final bool fromSetting;

  @override
  String toString() {
    return 'AupTCDialogRouteArgs{key: $key, fromSetting: $fromSetting}';
  }
}

/// generated route for
/// [_i22.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i41.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(
          OrderTemplateListPageRoute.name,
          path: 'order_template_list_page',
        );

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i23.CartPage]
class CartPageRoute extends _i41.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'cart_page',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i24.OrderSummaryPage]
class OrderSummaryPageRoute extends _i41.PageRouteInfo<void> {
  const OrderSummaryPageRoute()
      : super(
          OrderSummaryPageRoute.name,
          path: 'order_summary',
        );

  static const String name = 'OrderSummaryPageRoute';
}

/// generated route for
/// [_i25.OrderSuccessPage]
class OrderSuccessPageRoute extends _i41.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i26.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i41.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute({
    _i42.Key? key,
    required _i44.OrderTemplate order,
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

  final _i42.Key? key;

  final _i44.OrderTemplate order;

  @override
  String toString() {
    return 'OrderTemplateDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i27.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i41.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i42.Key? key,
    List<_i41.PageRouteInfo>? children,
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

  final _i42.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i28.SavedOrderListPage]
class SavedOrderListPageRoute extends _i41.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(
          SavedOrderListPageRoute.name,
          path: 'saved_order_list',
        );

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i29.SavedOrderDetailPage]
class SavedOrderDetailPageRoute
    extends _i41.PageRouteInfo<SavedOrderDetailPageRouteArgs> {
  SavedOrderDetailPageRoute({
    _i42.Key? key,
    required _i45.SavedOrder order,
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

  final _i42.Key? key;

  final _i45.SavedOrder order;

  @override
  String toString() {
    return 'SavedOrderDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i30.HistoryDetails]
class HistoryDetailsRoute extends _i41.PageRouteInfo<HistoryDetailsRouteArgs> {
  HistoryDetailsRoute({
    _i42.Key? key,
    required _i46.OrderHistoryItem orderHistoryItem,
    required _i47.BillToInfo billToInfo,
    required _i48.CustomerCodeInfo customerCodeInfo,
    required _i49.OrderHistoryBasicInfo orderHistoryBasicInfo,
    required _i50.SalesOrganisationConfigs salesOrgConfigs,
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

  final _i42.Key? key;

  final _i46.OrderHistoryItem orderHistoryItem;

  final _i47.BillToInfo billToInfo;

  final _i48.CustomerCodeInfo customerCodeInfo;

  final _i49.OrderHistoryBasicInfo orderHistoryBasicInfo;

  final _i50.SalesOrganisationConfigs salesOrgConfigs;

  @override
  String toString() {
    return 'HistoryDetailsRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem, billToInfo: $billToInfo, customerCodeInfo: $customerCodeInfo, orderHistoryBasicInfo: $orderHistoryBasicInfo, salesOrgConfigs: $salesOrgConfigs}';
  }
}

/// generated route for
/// [_i31.BonusAddPage]
class BonusAddPageRoute extends _i41.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i42.Key? key,
    required _i51.CartItem cartItem,
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

  final _i42.Key? key;

  final _i51.CartItem cartItem;

  @override
  String toString() {
    return 'BonusAddPageRouteArgs{key: $key, cartItem: $cartItem}';
  }
}

/// generated route for
/// [_i32.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i41.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i42.Key? key,
    required bool isEditing,
  }) : super(
          AddEditUserRestrictionPageRoute.name,
          path: 'add_edit_user_restriction',
          args: AddEditUserRestrictionPageRouteArgs(
            key: key,
            isEditing: isEditing,
          ),
        );

  static const String name = 'AddEditUserRestrictionPageRoute';
}

class AddEditUserRestrictionPageRouteArgs {
  const AddEditUserRestrictionPageRouteArgs({
    this.key,
    required this.isEditing,
  });

  final _i42.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i33.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i41.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i34.ReturnSummaryDetails]
class ReturnSummaryDetailsRoute
    extends _i41.PageRouteInfo<ReturnSummaryDetailsRouteArgs> {
  ReturnSummaryDetailsRoute({
    _i42.Key? key,
    required _i48.CustomerCodeInfo customerCodeInfo,
    required _i52.ShipToInfo shipToInfo,
    required _i53.ReturnSummaryRequest returnSummaryRequests,
  }) : super(
          ReturnSummaryDetailsRoute.name,
          path: 'return_summary_details',
          args: ReturnSummaryDetailsRouteArgs(
            key: key,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            returnSummaryRequests: returnSummaryRequests,
          ),
        );

  static const String name = 'ReturnSummaryDetailsRoute';
}

class ReturnSummaryDetailsRouteArgs {
  const ReturnSummaryDetailsRouteArgs({
    this.key,
    required this.customerCodeInfo,
    required this.shipToInfo,
    required this.returnSummaryRequests,
  });

  final _i42.Key? key;

  final _i48.CustomerCodeInfo customerCodeInfo;

  final _i52.ShipToInfo shipToInfo;

  final _i53.ReturnSummaryRequest returnSummaryRequests;

  @override
  String toString() {
    return 'ReturnSummaryDetailsRouteArgs{key: $key, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, returnSummaryRequests: $returnSummaryRequests}';
  }
}

/// generated route for
/// [_i35.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i41.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i42.Key? key,
    required _i54.BundleAggregate bundleAggregate,
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

  final _i42.Key? key;

  final _i54.BundleAggregate bundleAggregate;

  @override
  String toString() {
    return 'BundleItemDetailPageRouteArgs{key: $key, bundleAggregate: $bundleAggregate}';
  }
}

/// generated route for
/// [_i36.ComboDealDetailPage]
class ComboDealDetailPageRoute
    extends _i41.PageRouteInfo<ComboDealDetailPageRouteArgs> {
  ComboDealDetailPageRoute({
    _i42.Key? key,
    required List<_i55.PriceAggregate> comboItems,
    bool isEdit = false,
  }) : super(
          ComboDealDetailPageRoute.name,
          path: 'combo_deal_detail',
          args: ComboDealDetailPageRouteArgs(
            key: key,
            comboItems: comboItems,
            isEdit: isEdit,
          ),
        );

  static const String name = 'ComboDealDetailPageRoute';
}

class ComboDealDetailPageRouteArgs {
  const ComboDealDetailPageRouteArgs({
    this.key,
    required this.comboItems,
    this.isEdit = false,
  });

  final _i42.Key? key;

  final List<_i55.PriceAggregate> comboItems;

  final bool isEdit;

  @override
  String toString() {
    return 'ComboDealDetailPageRouteArgs{key: $key, comboItems: $comboItems, isEdit: $isEdit}';
  }
}

/// generated route for
/// [_i37.HomeTab]
class HomeTabRoute extends _i41.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home-tab',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i38.HistoryTab]
class HistoryTabRoute extends _i41.PageRouteInfo<HistoryTabRouteArgs> {
  HistoryTabRoute({_i42.Key? key})
      : super(
          HistoryTabRoute.name,
          path: 'history-tab',
          args: HistoryTabRouteArgs(key: key),
        );

  static const String name = 'HistoryTabRoute';
}

class HistoryTabRouteArgs {
  const HistoryTabRouteArgs({this.key});

  final _i42.Key? key;

  @override
  String toString() {
    return 'HistoryTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i39.FavouritesTab]
class FavouritesTabRoute extends _i41.PageRouteInfo<void> {
  const FavouritesTabRoute()
      : super(
          FavouritesTabRoute.name,
          path: 'favourites-tab',
        );

  static const String name = 'FavouritesTabRoute';
}

/// generated route for
/// [_i40.AccountTab]
class AccountTabRoute extends _i41.PageRouteInfo<void> {
  const AccountTabRoute()
      : super(
          AccountTabRoute.name,
          path: 'account-tab',
        );

  static const String name = 'AccountTabRoute';
}
