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
import '../../domain/order/entities/price_combo_deal.dart' as _i56;
import '../../domain/order/entities/saved_order.dart' as _i45;
import '../../domain/returns/entities/return_summary_requests.dart' as _i53;
import '../account/account_tab.dart' as _i40;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i36;
import '../account/change_password/change_password_page.dart' as _i12;
import '../account/contact_us/contact_us_page.dart' as _i13;
import '../account/customer_search.dart' as _i15;
import '../account/notification_settings/notification_settings_page.dart'
    as _i14;
import '../account/settings_page.dart' as _i4;
import '../account/ship_to_search.dart' as _i16;
import '../aup_tc/aup_tc.dart' as _i19;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i11;
import '../favourites/favourite_tab.dart' as _i39;
import '../history/detail/history_details.dart' as _i28;
import '../history/history_tab.dart' as _i38;
import '../home/home_tab.dart' as _i37;
import '../home_tab.dart' as _i25;
import '../orders/cart/bonus/search_bonus_page.dart' as _i29;
import '../orders/cart/cart_page.dart' as _i21;
import '../orders/combo_deal/combo_deal_material_detail_page.dart' as _i34;
import '../orders/combo_deal/combo_deal_principle_detail_page.dart' as _i35;
import '../orders/create_order/bundle_item_detail_page.dart' as _i33;
import '../orders/create_order/material_filter.dart' as _i18;
import '../orders/create_order/material_root.dart' as _i17;
import '../orders/create_order/order_summary_page.dart' as _i22;
import '../orders/create_order/scan_material_info.dart' as _i31;
import '../orders/order_success/order_success_page.dart' as _i23;
import '../orders/order_template/order_template_detail_page.dart' as _i24;
import '../orders/order_template/order_template_list_page.dart' as _i20;
import '../orders/saved_order/saved_order_detail_page.dart' as _i27;
import '../orders/saved_order/saved_order_list_page.dart' as _i26;
import '../returns/add_edit_user_restrictions.dart' as _i30;
import '../returns/approver_actions/approver_actions.dart' as _i6;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i10;
import '../returns/policy_configuration/policy_configuration.dart' as _i9;
import '../returns/request_return/request_return.dart' as _i5;
import '../returns/return_summary/return_summary.dart' as _i7;
import '../returns/return_summary_details/return_summary_details.dart' as _i32;
import '../returns/user_restriction_list.dart' as _i8;
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
    RequestReturnRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RequestReturn(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ApproverActions(key: args.key),
      );
    },
    ReturnSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryRouteArgs>(
          orElse: () => const ReturnSummaryRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ReturnSummary(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.CustomerSearchPage(),
      );
    },
    ShiptToSearchPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ShiptToSearchPage(),
      );
    },
    MaterialRootRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.MaterialRoot(),
      );
    },
    MaterialFilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialFilterPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.MaterialFilterPage(
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
        child: _i19.AupTCDialog(
          key: args.key,
          fromSetting: args.fromSetting,
        ),
      );
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderTemplateListPage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.CartPage(),
      );
    },
    OrderSummaryPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.OrderSummaryPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.OrderSuccessPage(),
      );
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.OrderTemplateDetailPage(
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
        child: _i25.HomeNavigationTabbar(key: args.key),
      );
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.SavedOrderListPage(),
      );
    },
    SavedOrderDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<SavedOrderDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.SavedOrderDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HistoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDetailsRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.HistoryDetails(
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
        child: _i29.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i30.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.ScanMaterialInfo(),
      );
    },
    ReturnSummaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryDetailsRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.ReturnSummaryDetails(
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
        child: _i33.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i41.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ComboDealMaterialDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ComboDealMaterialDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.WrappedRoute(
            child: _i34.ComboDealMaterialDetailPage(
          key: args.key,
          comboItems: args.comboItems,
          isEdit: args.isEdit,
        )),
      );
    },
    ComboDealPrincipleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ComboDealPrincipleDetailPageRouteArgs>();
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.WrappedRoute(
            child: _i35.ComboDealPrincipleDetailPage(
          key: args.key,
          comboDeal: args.comboDeal,
          initialComboItems: args.initialComboItems,
        )),
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i41.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.AdminPoAttachmentPage(key: args.key),
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
        child: _i41.WrappedRoute(child: const _i39.FavouritesTab()),
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
          RequestReturnRoute.name,
          path: 'returns/request_return',
        ),
        _i41.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i41.RouteConfig(
          ReturnSummaryRoute.name,
          path: 'returns/return_summary',
        ),
        _i41.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i41.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i41.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i41.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i41.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i41.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i41.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i41.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i41.RouteConfig(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search',
        ),
        _i41.RouteConfig(
          MaterialRootRoute.name,
          path: 'orders/material_list',
        ),
        _i41.RouteConfig(
          MaterialFilterPageRoute.name,
          path: 'orders/material_filter',
        ),
        _i41.RouteConfig(
          AupTCDialogRoute.name,
          path: 'tos',
        ),
        _i41.RouteConfig(
          OrderTemplateListPageRoute.name,
          path: 'orders/order_template_list',
        ),
        _i41.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i41.RouteConfig(
          OrderSummaryPageRoute.name,
          path: 'orders/order_summary',
        ),
        _i41.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i41.RouteConfig(
          OrderTemplateDetailPageRoute.name,
          path: 'orders/order_template_detail',
        ),
        _i41.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main_tabbar',
          children: [
            _i41.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              HistoryTabRoute.name,
              path: 'orders/history',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              FavouritesTabRoute.name,
              path: 'orders/favourites',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i41.RouteConfig(
              AccountTabRoute.name,
              path: 'core/account',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i41.RouteConfig(
          SavedOrderListPageRoute.name,
          path: 'orders/saved_order_list',
        ),
        _i41.RouteConfig(
          SavedOrderDetailPageRoute.name,
          path: 'orders/saved_order_detail',
        ),
        _i41.RouteConfig(
          HistoryDetailsRoute.name,
          path: 'orders/history_details',
        ),
        _i41.RouteConfig(
          BonusAddPageRoute.name,
          path: 'orders/add_bonus',
        ),
        _i41.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i41.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i41.RouteConfig(
          ReturnSummaryDetailsRoute.name,
          path: 'returns/return_summary_details',
        ),
        _i41.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'orders/bundle_item_detail',
        ),
        _i41.RouteConfig(
          ComboDealMaterialDetailPageRoute.name,
          path: 'orders/combo_deal_material_detail',
        ),
        _i41.RouteConfig(
          ComboDealPrincipleDetailPageRoute.name,
          path: 'orders/combo_deal_principle_detail',
        ),
        _i41.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
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
/// [_i5.RequestReturn]
class RequestReturnRoute extends _i41.PageRouteInfo<void> {
  const RequestReturnRoute()
      : super(
          RequestReturnRoute.name,
          path: 'returns/request_return',
        );

  static const String name = 'RequestReturnRoute';
}

/// generated route for
/// [_i6.ApproverActions]
class ApproverActionsRoute
    extends _i41.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i42.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
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
/// [_i7.ReturnSummary]
class ReturnSummaryRoute extends _i41.PageRouteInfo<ReturnSummaryRouteArgs> {
  ReturnSummaryRoute({_i42.Key? key})
      : super(
          ReturnSummaryRoute.name,
          path: 'returns/return_summary',
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
/// [_i8.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i41.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i9.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i41.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i10.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i41.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i11.WebViewPage]
class WebViewPageRoute extends _i41.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i42.Key? key,
    String url = '',
    String? initialFile,
  }) : super(
          WebViewPageRoute.name,
          path: 'web_view',
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
/// [_i12.ChangePasswordPage]
class ChangePasswordPageRoute extends _i41.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i13.ContactUsPage]
class ContactUsPageRoute extends _i41.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i14.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i41.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i15.CustomerSearchPage]
class CustomerSearchPageRoute extends _i41.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i16.ShiptToSearchPage]
class ShiptToSearchPageRoute extends _i41.PageRouteInfo<void> {
  const ShiptToSearchPageRoute()
      : super(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search',
        );

  static const String name = 'ShiptToSearchPageRoute';
}

/// generated route for
/// [_i17.MaterialRoot]
class MaterialRootRoute extends _i41.PageRouteInfo<void> {
  const MaterialRootRoute()
      : super(
          MaterialRootRoute.name,
          path: 'orders/material_list',
        );

  static const String name = 'MaterialRootRoute';
}

/// generated route for
/// [_i18.MaterialFilterPage]
class MaterialFilterPageRoute
    extends _i41.PageRouteInfo<MaterialFilterPageRouteArgs> {
  MaterialFilterPageRoute({
    _i42.Key? key,
    required _i43.MaterialFilterType filterType,
  }) : super(
          MaterialFilterPageRoute.name,
          path: 'orders/material_filter',
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
/// [_i19.AupTCDialog]
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
/// [_i20.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i41.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(
          OrderTemplateListPageRoute.name,
          path: 'orders/order_template_list',
        );

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i21.CartPage]
class CartPageRoute extends _i41.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i22.OrderSummaryPage]
class OrderSummaryPageRoute extends _i41.PageRouteInfo<void> {
  const OrderSummaryPageRoute()
      : super(
          OrderSummaryPageRoute.name,
          path: 'orders/order_summary',
        );

  static const String name = 'OrderSummaryPageRoute';
}

/// generated route for
/// [_i23.OrderSuccessPage]
class OrderSuccessPageRoute extends _i41.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i24.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i41.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute({
    _i42.Key? key,
    required _i44.OrderTemplate order,
  }) : super(
          OrderTemplateDetailPageRoute.name,
          path: 'orders/order_template_detail',
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
/// [_i25.HomeNavigationTabbar]
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
/// [_i26.SavedOrderListPage]
class SavedOrderListPageRoute extends _i41.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(
          SavedOrderListPageRoute.name,
          path: 'orders/saved_order_list',
        );

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i27.SavedOrderDetailPage]
class SavedOrderDetailPageRoute
    extends _i41.PageRouteInfo<SavedOrderDetailPageRouteArgs> {
  SavedOrderDetailPageRoute({
    _i42.Key? key,
    required _i45.SavedOrder order,
  }) : super(
          SavedOrderDetailPageRoute.name,
          path: 'orders/saved_order_detail',
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
/// [_i28.HistoryDetails]
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
          path: 'orders/history_details',
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
/// [_i29.BonusAddPage]
class BonusAddPageRoute extends _i41.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i42.Key? key,
    required _i51.CartItem cartItem,
  }) : super(
          BonusAddPageRoute.name,
          path: 'orders/add_bonus',
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
/// [_i30.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i41.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i42.Key? key,
    required bool isEditing,
  }) : super(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
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
/// [_i31.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i41.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i32.ReturnSummaryDetails]
class ReturnSummaryDetailsRoute
    extends _i41.PageRouteInfo<ReturnSummaryDetailsRouteArgs> {
  ReturnSummaryDetailsRoute({
    _i42.Key? key,
    required _i48.CustomerCodeInfo customerCodeInfo,
    required _i52.ShipToInfo shipToInfo,
    required _i53.ReturnSummaryRequest returnSummaryRequests,
  }) : super(
          ReturnSummaryDetailsRoute.name,
          path: 'returns/return_summary_details',
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
/// [_i33.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i41.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i42.Key? key,
    required _i54.BundleAggregate bundleAggregate,
  }) : super(
          BundleItemDetailPageRoute.name,
          path: 'orders/bundle_item_detail',
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
/// [_i34.ComboDealMaterialDetailPage]
class ComboDealMaterialDetailPageRoute
    extends _i41.PageRouteInfo<ComboDealMaterialDetailPageRouteArgs> {
  ComboDealMaterialDetailPageRoute({
    _i42.Key? key,
    required List<_i55.PriceAggregate> comboItems,
    bool isEdit = false,
  }) : super(
          ComboDealMaterialDetailPageRoute.name,
          path: 'orders/combo_deal_material_detail',
          args: ComboDealMaterialDetailPageRouteArgs(
            key: key,
            comboItems: comboItems,
            isEdit: isEdit,
          ),
        );

  static const String name = 'ComboDealMaterialDetailPageRoute';
}

class ComboDealMaterialDetailPageRouteArgs {
  const ComboDealMaterialDetailPageRouteArgs({
    this.key,
    required this.comboItems,
    this.isEdit = false,
  });

  final _i42.Key? key;

  final List<_i55.PriceAggregate> comboItems;

  final bool isEdit;

  @override
  String toString() {
    return 'ComboDealMaterialDetailPageRouteArgs{key: $key, comboItems: $comboItems, isEdit: $isEdit}';
  }
}

/// generated route for
/// [_i35.ComboDealPrincipleDetailPage]
class ComboDealPrincipleDetailPageRoute
    extends _i41.PageRouteInfo<ComboDealPrincipleDetailPageRouteArgs> {
  ComboDealPrincipleDetailPageRoute({
    _i42.Key? key,
    required _i56.PriceComboDeal comboDeal,
    List<_i55.PriceAggregate> initialComboItems = const [],
  }) : super(
          ComboDealPrincipleDetailPageRoute.name,
          path: 'orders/combo_deal_principle_detail',
          args: ComboDealPrincipleDetailPageRouteArgs(
            key: key,
            comboDeal: comboDeal,
            initialComboItems: initialComboItems,
          ),
        );

  static const String name = 'ComboDealPrincipleDetailPageRoute';
}

class ComboDealPrincipleDetailPageRouteArgs {
  const ComboDealPrincipleDetailPageRouteArgs({
    this.key,
    required this.comboDeal,
    this.initialComboItems = const [],
  });

  final _i42.Key? key;

  final _i56.PriceComboDeal comboDeal;

  final List<_i55.PriceAggregate> initialComboItems;

  @override
  String toString() {
    return 'ComboDealPrincipleDetailPageRouteArgs{key: $key, comboDeal: $comboDeal, initialComboItems: $initialComboItems}';
  }
}

/// generated route for
/// [_i36.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i41.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i42.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i42.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i37.HomeTab]
class HomeTabRoute extends _i41.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i38.HistoryTab]
class HistoryTabRoute extends _i41.PageRouteInfo<HistoryTabRouteArgs> {
  HistoryTabRoute({_i42.Key? key})
      : super(
          HistoryTabRoute.name,
          path: 'orders/history',
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
          path: 'orders/favourites',
        );

  static const String name = 'FavouritesTabRoute';
}

/// generated route for
/// [_i40.AccountTab]
class AccountTabRoute extends _i41.PageRouteInfo<void> {
  const AccountTabRoute()
      : super(
          AccountTabRoute.name,
          path: 'core/account',
        );

  static const String name = 'AccountTabRoute';
}
