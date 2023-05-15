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
import 'package:auto_route/auto_route.dart' as _i52;
import 'package:flutter/material.dart' as _i53;

import '../../application/order/material_filter/material_filter_bloc.dart'
    as _i54;
import '../../domain/account/entities/bill_to_info.dart' as _i58;
import '../../domain/account/entities/customer_code_info.dart' as _i59;
import '../../domain/account/entities/sales_organisation_configs.dart' as _i61;
import '../../domain/account/entities/ship_to_info.dart' as _i63;
import '../../domain/core/aggregate/bundle_aggregate.dart' as _i65;
import '../../domain/core/aggregate/price_aggregate.dart' as _i66;
import '../../domain/order/entities/cart_item.dart' as _i62;
import '../../domain/order/entities/order_history_basic_info.dart' as _i60;
import '../../domain/order/entities/order_history_item.dart' as _i57;
import '../../domain/order/entities/order_template.dart' as _i55;
import '../../domain/order/entities/price_combo_deal.dart' as _i67;
import '../../domain/order/entities/saved_order.dart' as _i56;
import '../../domain/returns/entities/return_summary_requests.dart' as _i64;
import '../account/account_tab.dart' as _i51;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i44;
import '../account/change_password/change_password_page.dart' as _i14;
import '../account/contact_us/contact_us_page.dart' as _i15;
import '../account/customer_search.dart' as _i17;
import '../account/notification_settings/notification_settings_page.dart'
    as _i16;
import '../account/payment_configuration/payment_configuration_page.dart'
    as _i5;
import '../account/payment_configuration/payment_methods/payment_methods_page.dart'
    as _i6;
import '../account/settings_page.dart' as _i4;
import '../account/ship_to_search.dart' as _i18;
import '../aup_tc/aup_tc.dart' as _i21;
import '../auth/login_page.dart' as _i2;
import '../auth/proxy_login_page.dart' as _i3;
import '../core/webview_page.dart' as _i13;
import '../favourites/favourite_tab.dart' as _i50;
import '../history/detail/history_details.dart' as _i30;
import '../history/history_tab.dart' as _i49;
import '../home/home_tab.dart' as _i48;
import '../home_tab.dart' as _i27;
import '../orders/cart/add_to_cart/add_to_cart.dart' as _i42;
import '../orders/cart/add_to_cart/update_cart.dart' as _i43;
import '../orders/cart/bonus/search_bonus_page.dart' as _i31;
import '../orders/cart/cart_page.dart' as _i23;
import '../orders/combo_deal/combo_deal_material_detail_page.dart' as _i37;
import '../orders/combo_deal/combo_deal_principle_detail_page.dart' as _i38;
import '../orders/create_order/bundle_item_detail_page.dart' as _i36;
import '../orders/create_order/covid_material_list/covid_material_list.dart'
    as _i47;
import '../orders/create_order/material_bundle_list.dart' as _i46;
import '../orders/create_order/material_filter.dart' as _i20;
import '../orders/create_order/material_list/material_list.dart' as _i45;
import '../orders/create_order/material_root.dart' as _i19;
import '../orders/create_order/order_summary_page.dart' as _i24;
import '../orders/create_order/scan_material_info.dart' as _i33;
import '../orders/order_success/order_success_page.dart' as _i25;
import '../orders/order_template/order_template_detail_page.dart' as _i26;
import '../orders/order_template/order_template_list_page.dart' as _i22;
import '../orders/saved_order/saved_order_detail_page.dart' as _i29;
import '../orders/saved_order/saved_order_list_page.dart' as _i28;
import '../payments/all_invoices/all_invoices.dart' as _i35;
import '../returns/add_edit_user_restrictions.dart' as _i32;
import '../returns/approver_actions/approver_actions.dart' as _i8;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i12;
import '../returns/policy_configuration/policy_configuration.dart' as _i11;
import '../returns/request_return/request_return.dart' as _i7;
import '../returns/request_return/request_return_details.dart' as _i39;
import '../returns/request_return/return_details_summary_page.dart' as _i40;
import '../returns/request_return/return_request_success.dart' as _i41;
import '../returns/return_summary/return_summary.dart' as _i9;
import '../returns/return_summary_details/return_summary_details.dart' as _i34;
import '../returns/user_restriction_list.dart' as _i10;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i52.RootStackRouter {
  AppRouter([_i53.GlobalKey<_i53.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i52.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    LoginOnBehalfPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.LoginOnBehalfPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingsPage(),
      );
    },
    PaymentConfigurationPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PaymentConfigurationPage(),
      );
    },
    PaymentMethodsPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentMethodsPage(),
      );
    },
    RequestReturnRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RequestReturn(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.ApproverActions(key: args.key),
      );
    },
    ReturnSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryRouteArgs>(
          orElse: () => const ReturnSummaryRouteArgs());
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.ReturnSummary(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.CustomerSearchPage(),
      );
    },
    ShiptToSearchPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.ShiptToSearchPage(),
      );
    },
    MaterialRootRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.MaterialRoot(),
      );
    },
    MaterialFilterPageRoute.name: (routeData) {
      final args = routeData.argsAs<MaterialFilterPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
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
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.AupTCDialog(
          key: args.key,
          fromSetting: args.fromSetting,
        ),
      );
    },
    OrderTemplateListPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.OrderTemplateListPage(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.CartPage(),
      );
    },
    OrderSummaryPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.OrderSummaryPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.OrderSuccessPage(),
      );
    },
    OrderTemplateDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<OrderTemplateDetailPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
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
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.HomeNavigationTabbar(key: args.key),
      );
    },
    SavedOrderListPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.SavedOrderListPage(),
      );
    },
    SavedOrderDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<SavedOrderDetailPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.SavedOrderDetailPage(
          key: args.key,
          order: args.order,
        ),
      );
    },
    HistoryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryDetailsRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
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
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i31.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.ScanMaterialInfo(),
      );
    },
    ReturnSummaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryDetailsRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.ReturnSummaryDetails(
          key: args.key,
          customerCodeInfo: args.customerCodeInfo,
          shipToInfo: args.shipToInfo,
          returnSummaryRequests: args.returnSummaryRequests,
        ),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.AllInvoicesPage(),
      );
    },
    BundleItemDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleItemDetailPageRouteArgs>();
      return _i52.CustomPage<dynamic>(
        routeData: routeData,
        child: _i36.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i52.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ComboDealMaterialDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ComboDealMaterialDetailPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i52.WrappedRoute(
            child: _i37.ComboDealMaterialDetailPage(
          key: args.key,
          comboItems: args.comboItems,
          isEdit: args.isEdit,
        )),
      );
    },
    ComboDealPrincipleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<ComboDealPrincipleDetailPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i52.WrappedRoute(
            child: _i38.ComboDealPrincipleDetailPage(
          key: args.key,
          comboDeal: args.comboDeal,
          initialComboItems: args.initialComboItems,
        )),
      );
    },
    RequestReturnDetailsRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.RequestReturnDetails(),
      );
    },
    RequestReturnDetailsSummaryPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.RequestReturnDetailsSummaryPage(),
      );
    },
    ReturnRequestSuccessPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i41.ReturnRequestSuccessPage(),
      );
    },
    AddToCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddToCartRouteArgs>();
      return _i52.CustomPage<dynamic>(
        routeData: routeData,
        child: _i52.WrappedRoute(
            child: _i42.AddToCart(
          key: args.key,
          isCovid19Tab: args.isCovid19Tab,
          material: args.material,
          isShortcutAccess: args.isShortcutAccess,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i52.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdateCartRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCartRouteArgs>();
      return _i52.CustomPage<dynamic>(
        routeData: routeData,
        child: _i52.WrappedRoute(
            child: _i43.UpdateCart(
          key: args.key,
          material: args.material,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i52.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i44.AdminPoAttachmentPage(key: args.key),
      );
    },
    MaterialListPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.MaterialListPage(),
      );
    },
    MaterialBundleListPageRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.MaterialBundleListPage(),
      );
    },
    CovidMaterialListPageRoute.name: (routeData) {
      final args = routeData.argsAs<CovidMaterialListPageRouteArgs>();
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i47.CovidMaterialListPage(
          key: args.key,
          addToCart: args.addToCart,
        ),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i48.HomeTab(),
      );
    },
    HistoryTabRoute.name: (routeData) {
      final args = routeData.argsAs<HistoryTabRouteArgs>(
          orElse: () => const HistoryTabRouteArgs());
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i49.HistoryTab(key: args.key),
      );
    },
    FavouritesTabRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i52.WrappedRoute(child: const _i50.FavouritesTab()),
      );
    },
    AccountTabRoute.name: (routeData) {
      return _i52.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.AccountTab(),
      );
    },
  };

  @override
  List<_i52.RouteConfig> get routes => [
        _i52.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i52.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i52.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i52.RouteConfig(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        ),
        _i52.RouteConfig(
          SettingsPageRoute.name,
          path: 'settings',
        ),
        _i52.RouteConfig(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        ),
        _i52.RouteConfig(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        ),
        _i52.RouteConfig(
          RequestReturnRoute.name,
          path: 'returns/request_return',
        ),
        _i52.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i52.RouteConfig(
          ReturnSummaryRoute.name,
          path: 'returns/return_summary',
        ),
        _i52.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i52.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i52.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i52.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i52.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i52.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i52.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i52.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i52.RouteConfig(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search',
        ),
        _i52.RouteConfig(
          MaterialRootRoute.name,
          path: 'material_root',
          children: [
            _i52.RouteConfig(
              MaterialListPageRoute.name,
              path: 'orders/material_list',
              parent: MaterialRootRoute.name,
            ),
            _i52.RouteConfig(
              MaterialBundleListPageRoute.name,
              path: 'orders/material_bundle_list',
              parent: MaterialRootRoute.name,
            ),
            _i52.RouteConfig(
              CovidMaterialListPageRoute.name,
              path: 'orders/covid_material_list',
              parent: MaterialRootRoute.name,
            ),
          ],
        ),
        _i52.RouteConfig(
          MaterialFilterPageRoute.name,
          path: 'orders/material_filter',
        ),
        _i52.RouteConfig(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        ),
        _i52.RouteConfig(
          OrderTemplateListPageRoute.name,
          path: 'orders/order_template_list',
        ),
        _i52.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i52.RouteConfig(
          OrderSummaryPageRoute.name,
          path: 'orders/order_summary',
        ),
        _i52.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i52.RouteConfig(
          OrderTemplateDetailPageRoute.name,
          path: 'orders/order_template_detail',
        ),
        _i52.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i52.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i52.RouteConfig(
              HistoryTabRoute.name,
              path: 'orders/history',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i52.RouteConfig(
              FavouritesTabRoute.name,
              path: 'orders/favourites',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i52.RouteConfig(
              AccountTabRoute.name,
              path: 'core/account',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i52.RouteConfig(
          SavedOrderListPageRoute.name,
          path: 'orders/saved_order_list',
        ),
        _i52.RouteConfig(
          SavedOrderDetailPageRoute.name,
          path: 'orders/saved_order_detail',
        ),
        _i52.RouteConfig(
          HistoryDetailsRoute.name,
          path: 'orders/history_details',
        ),
        _i52.RouteConfig(
          BonusAddPageRoute.name,
          path: 'orders/add_bonus',
        ),
        _i52.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i52.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i52.RouteConfig(
          ReturnSummaryDetailsRoute.name,
          path: 'returns/return_summary_details',
        ),
        _i52.RouteConfig(
          AllInvoicesPageRoute.name,
          path: 'payments/all_invoices',
        ),
        _i52.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'orders/bundle_item_detail',
        ),
        _i52.RouteConfig(
          ComboDealMaterialDetailPageRoute.name,
          path: 'orders/combo_deal_material_detail',
        ),
        _i52.RouteConfig(
          ComboDealPrincipleDetailPageRoute.name,
          path: 'orders/combo_deal_principle_detail',
        ),
        _i52.RouteConfig(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        ),
        _i52.RouteConfig(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        ),
        _i52.RouteConfig(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        ),
        _i52.RouteConfig(
          AddToCartRoute.name,
          path: 'orders/add_to_cart',
        ),
        _i52.RouteConfig(
          UpdateCartRoute.name,
          path: 'orders/update_cart',
        ),
        _i52.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i52.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i52.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.LoginOnBehalfPage]
class LoginOnBehalfPageRoute extends _i52.PageRouteInfo<void> {
  const LoginOnBehalfPageRoute()
      : super(
          LoginOnBehalfPageRoute.name,
          path: 'login_on_behalf',
        );

  static const String name = 'LoginOnBehalfPageRoute';
}

/// generated route for
/// [_i4.SettingsPage]
class SettingsPageRoute extends _i52.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i5.PaymentConfigurationPage]
class PaymentConfigurationPageRoute extends _i52.PageRouteInfo<void> {
  const PaymentConfigurationPageRoute()
      : super(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        );

  static const String name = 'PaymentConfigurationPageRoute';
}

/// generated route for
/// [_i6.PaymentMethodsPage]
class PaymentMethodsPageRoute extends _i52.PageRouteInfo<void> {
  const PaymentMethodsPageRoute()
      : super(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        );

  static const String name = 'PaymentMethodsPageRoute';
}

/// generated route for
/// [_i7.RequestReturn]
class RequestReturnRoute extends _i52.PageRouteInfo<void> {
  const RequestReturnRoute()
      : super(
          RequestReturnRoute.name,
          path: 'returns/request_return',
        );

  static const String name = 'RequestReturnRoute';
}

/// generated route for
/// [_i8.ApproverActions]
class ApproverActionsRoute
    extends _i52.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i53.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i53.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.ReturnSummary]
class ReturnSummaryRoute extends _i52.PageRouteInfo<ReturnSummaryRouteArgs> {
  ReturnSummaryRoute({_i53.Key? key})
      : super(
          ReturnSummaryRoute.name,
          path: 'returns/return_summary',
          args: ReturnSummaryRouteArgs(key: key),
        );

  static const String name = 'ReturnSummaryRoute';
}

class ReturnSummaryRouteArgs {
  const ReturnSummaryRouteArgs({this.key});

  final _i53.Key? key;

  @override
  String toString() {
    return 'ReturnSummaryRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i52.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i11.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i52.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i12.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i52.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i13.WebViewPage]
class WebViewPageRoute extends _i52.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i53.Key? key,
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

  final _i53.Key? key;

  final String url;

  final String? initialFile;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile}';
  }
}

/// generated route for
/// [_i14.ChangePasswordPage]
class ChangePasswordPageRoute extends _i52.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i15.ContactUsPage]
class ContactUsPageRoute extends _i52.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i16.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i52.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i17.CustomerSearchPage]
class CustomerSearchPageRoute extends _i52.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i18.ShiptToSearchPage]
class ShiptToSearchPageRoute extends _i52.PageRouteInfo<void> {
  const ShiptToSearchPageRoute()
      : super(
          ShiptToSearchPageRoute.name,
          path: 'ship_to_search',
        );

  static const String name = 'ShiptToSearchPageRoute';
}

/// generated route for
/// [_i19.MaterialRoot]
class MaterialRootRoute extends _i52.PageRouteInfo<void> {
  const MaterialRootRoute({List<_i52.PageRouteInfo>? children})
      : super(
          MaterialRootRoute.name,
          path: 'material_root',
          initialChildren: children,
        );

  static const String name = 'MaterialRootRoute';
}

/// generated route for
/// [_i20.MaterialFilterPage]
class MaterialFilterPageRoute
    extends _i52.PageRouteInfo<MaterialFilterPageRouteArgs> {
  MaterialFilterPageRoute({
    _i53.Key? key,
    required _i54.MaterialFilterType filterType,
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

  final _i53.Key? key;

  final _i54.MaterialFilterType filterType;

  @override
  String toString() {
    return 'MaterialFilterPageRouteArgs{key: $key, filterType: $filterType}';
  }
}

/// generated route for
/// [_i21.AupTCDialog]
class AupTCDialogRoute extends _i52.PageRouteInfo<AupTCDialogRouteArgs> {
  AupTCDialogRoute({
    _i53.Key? key,
    bool fromSetting = false,
  }) : super(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
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

  final _i53.Key? key;

  final bool fromSetting;

  @override
  String toString() {
    return 'AupTCDialogRouteArgs{key: $key, fromSetting: $fromSetting}';
  }
}

/// generated route for
/// [_i22.OrderTemplateListPage]
class OrderTemplateListPageRoute extends _i52.PageRouteInfo<void> {
  const OrderTemplateListPageRoute()
      : super(
          OrderTemplateListPageRoute.name,
          path: 'orders/order_template_list',
        );

  static const String name = 'OrderTemplateListPageRoute';
}

/// generated route for
/// [_i23.CartPage]
class CartPageRoute extends _i52.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i24.OrderSummaryPage]
class OrderSummaryPageRoute extends _i52.PageRouteInfo<void> {
  const OrderSummaryPageRoute()
      : super(
          OrderSummaryPageRoute.name,
          path: 'orders/order_summary',
        );

  static const String name = 'OrderSummaryPageRoute';
}

/// generated route for
/// [_i25.OrderSuccessPage]
class OrderSuccessPageRoute extends _i52.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i26.OrderTemplateDetailPage]
class OrderTemplateDetailPageRoute
    extends _i52.PageRouteInfo<OrderTemplateDetailPageRouteArgs> {
  OrderTemplateDetailPageRoute({
    _i53.Key? key,
    required _i55.OrderTemplate order,
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

  final _i53.Key? key;

  final _i55.OrderTemplate order;

  @override
  String toString() {
    return 'OrderTemplateDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i27.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i52.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i53.Key? key,
    List<_i52.PageRouteInfo>? children,
  }) : super(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          args: HomeNavigationTabbarRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';
}

class HomeNavigationTabbarRouteArgs {
  const HomeNavigationTabbarRouteArgs({this.key});

  final _i53.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i28.SavedOrderListPage]
class SavedOrderListPageRoute extends _i52.PageRouteInfo<void> {
  const SavedOrderListPageRoute()
      : super(
          SavedOrderListPageRoute.name,
          path: 'orders/saved_order_list',
        );

  static const String name = 'SavedOrderListPageRoute';
}

/// generated route for
/// [_i29.SavedOrderDetailPage]
class SavedOrderDetailPageRoute
    extends _i52.PageRouteInfo<SavedOrderDetailPageRouteArgs> {
  SavedOrderDetailPageRoute({
    _i53.Key? key,
    required _i56.SavedOrder order,
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

  final _i53.Key? key;

  final _i56.SavedOrder order;

  @override
  String toString() {
    return 'SavedOrderDetailPageRouteArgs{key: $key, order: $order}';
  }
}

/// generated route for
/// [_i30.HistoryDetails]
class HistoryDetailsRoute extends _i52.PageRouteInfo<HistoryDetailsRouteArgs> {
  HistoryDetailsRoute({
    _i53.Key? key,
    required _i57.OrderHistoryItem orderHistoryItem,
    required _i58.BillToInfo billToInfo,
    required _i59.CustomerCodeInfo customerCodeInfo,
    required _i60.OrderHistoryBasicInfo orderHistoryBasicInfo,
    required _i61.SalesOrganisationConfigs salesOrgConfigs,
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

  final _i53.Key? key;

  final _i57.OrderHistoryItem orderHistoryItem;

  final _i58.BillToInfo billToInfo;

  final _i59.CustomerCodeInfo customerCodeInfo;

  final _i60.OrderHistoryBasicInfo orderHistoryBasicInfo;

  final _i61.SalesOrganisationConfigs salesOrgConfigs;

  @override
  String toString() {
    return 'HistoryDetailsRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem, billToInfo: $billToInfo, customerCodeInfo: $customerCodeInfo, orderHistoryBasicInfo: $orderHistoryBasicInfo, salesOrgConfigs: $salesOrgConfigs}';
  }
}

/// generated route for
/// [_i31.BonusAddPage]
class BonusAddPageRoute extends _i52.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i53.Key? key,
    required _i62.CartItem cartItem,
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

  final _i53.Key? key;

  final _i62.CartItem cartItem;

  @override
  String toString() {
    return 'BonusAddPageRouteArgs{key: $key, cartItem: $cartItem}';
  }
}

/// generated route for
/// [_i32.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i52.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i53.Key? key,
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

  final _i53.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i33.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i52.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i34.ReturnSummaryDetails]
class ReturnSummaryDetailsRoute
    extends _i52.PageRouteInfo<ReturnSummaryDetailsRouteArgs> {
  ReturnSummaryDetailsRoute({
    _i53.Key? key,
    required _i59.CustomerCodeInfo customerCodeInfo,
    required _i63.ShipToInfo shipToInfo,
    required _i64.ReturnSummaryRequest returnSummaryRequests,
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

  final _i53.Key? key;

  final _i59.CustomerCodeInfo customerCodeInfo;

  final _i63.ShipToInfo shipToInfo;

  final _i64.ReturnSummaryRequest returnSummaryRequests;

  @override
  String toString() {
    return 'ReturnSummaryDetailsRouteArgs{key: $key, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, returnSummaryRequests: $returnSummaryRequests}';
  }
}

/// generated route for
/// [_i35.AllInvoicesPage]
class AllInvoicesPageRoute extends _i52.PageRouteInfo<void> {
  const AllInvoicesPageRoute()
      : super(
          AllInvoicesPageRoute.name,
          path: 'payments/all_invoices',
        );

  static const String name = 'AllInvoicesPageRoute';
}

/// generated route for
/// [_i36.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i52.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i53.Key? key,
    required _i65.BundleAggregate bundleAggregate,
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

  final _i53.Key? key;

  final _i65.BundleAggregate bundleAggregate;

  @override
  String toString() {
    return 'BundleItemDetailPageRouteArgs{key: $key, bundleAggregate: $bundleAggregate}';
  }
}

/// generated route for
/// [_i37.ComboDealMaterialDetailPage]
class ComboDealMaterialDetailPageRoute
    extends _i52.PageRouteInfo<ComboDealMaterialDetailPageRouteArgs> {
  ComboDealMaterialDetailPageRoute({
    _i53.Key? key,
    required List<_i66.PriceAggregate> comboItems,
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

  final _i53.Key? key;

  final List<_i66.PriceAggregate> comboItems;

  final bool isEdit;

  @override
  String toString() {
    return 'ComboDealMaterialDetailPageRouteArgs{key: $key, comboItems: $comboItems, isEdit: $isEdit}';
  }
}

/// generated route for
/// [_i38.ComboDealPrincipleDetailPage]
class ComboDealPrincipleDetailPageRoute
    extends _i52.PageRouteInfo<ComboDealPrincipleDetailPageRouteArgs> {
  ComboDealPrincipleDetailPageRoute({
    _i53.Key? key,
    required _i67.PriceComboDeal comboDeal,
    List<_i66.PriceAggregate> initialComboItems = const [],
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

  final _i53.Key? key;

  final _i67.PriceComboDeal comboDeal;

  final List<_i66.PriceAggregate> initialComboItems;

  @override
  String toString() {
    return 'ComboDealPrincipleDetailPageRouteArgs{key: $key, comboDeal: $comboDeal, initialComboItems: $initialComboItems}';
  }
}

/// generated route for
/// [_i39.RequestReturnDetails]
class RequestReturnDetailsRoute extends _i52.PageRouteInfo<void> {
  const RequestReturnDetailsRoute()
      : super(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        );

  static const String name = 'RequestReturnDetailsRoute';
}

/// generated route for
/// [_i40.RequestReturnDetailsSummaryPage]
class RequestReturnDetailsSummaryPageRoute extends _i52.PageRouteInfo<void> {
  const RequestReturnDetailsSummaryPageRoute()
      : super(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        );

  static const String name = 'RequestReturnDetailsSummaryPageRoute';
}

/// generated route for
/// [_i41.ReturnRequestSuccessPage]
class ReturnRequestSuccessPageRoute extends _i52.PageRouteInfo<void> {
  const ReturnRequestSuccessPageRoute()
      : super(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        );

  static const String name = 'ReturnRequestSuccessPageRoute';
}

/// generated route for
/// [_i42.AddToCart]
class AddToCartRoute extends _i52.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i53.Key? key,
    required bool isCovid19Tab,
    required _i66.PriceAggregate material,
    bool isShortcutAccess = false,
  }) : super(
          AddToCartRoute.name,
          path: 'orders/add_to_cart',
          args: AddToCartRouteArgs(
            key: key,
            isCovid19Tab: isCovid19Tab,
            material: material,
            isShortcutAccess: isShortcutAccess,
          ),
        );

  static const String name = 'AddToCartRoute';
}

class AddToCartRouteArgs {
  const AddToCartRouteArgs({
    this.key,
    required this.isCovid19Tab,
    required this.material,
    this.isShortcutAccess = false,
  });

  final _i53.Key? key;

  final bool isCovid19Tab;

  final _i66.PriceAggregate material;

  final bool isShortcutAccess;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, isCovid19Tab: $isCovid19Tab, material: $material, isShortcutAccess: $isShortcutAccess}';
  }
}

/// generated route for
/// [_i43.UpdateCart]
class UpdateCartRoute extends _i52.PageRouteInfo<UpdateCartRouteArgs> {
  UpdateCartRoute({
    _i53.Key? key,
    required _i66.PriceAggregate material,
  }) : super(
          UpdateCartRoute.name,
          path: 'orders/update_cart',
          args: UpdateCartRouteArgs(
            key: key,
            material: material,
          ),
        );

  static const String name = 'UpdateCartRoute';
}

class UpdateCartRouteArgs {
  const UpdateCartRouteArgs({
    this.key,
    required this.material,
  });

  final _i53.Key? key;

  final _i66.PriceAggregate material;

  @override
  String toString() {
    return 'UpdateCartRouteArgs{key: $key, material: $material}';
  }
}

/// generated route for
/// [_i44.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i52.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i53.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i53.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i45.MaterialListPage]
class MaterialListPageRoute extends _i52.PageRouteInfo<void> {
  const MaterialListPageRoute()
      : super(
          MaterialListPageRoute.name,
          path: 'orders/material_list',
        );

  static const String name = 'MaterialListPageRoute';
}

/// generated route for
/// [_i46.MaterialBundleListPage]
class MaterialBundleListPageRoute extends _i52.PageRouteInfo<void> {
  const MaterialBundleListPageRoute()
      : super(
          MaterialBundleListPageRoute.name,
          path: 'orders/material_bundle_list',
        );

  static const String name = 'MaterialBundleListPageRoute';
}

/// generated route for
/// [_i47.CovidMaterialListPage]
class CovidMaterialListPageRoute
    extends _i52.PageRouteInfo<CovidMaterialListPageRouteArgs> {
  CovidMaterialListPageRoute({
    _i53.Key? key,
    required Function addToCart,
  }) : super(
          CovidMaterialListPageRoute.name,
          path: 'orders/covid_material_list',
          args: CovidMaterialListPageRouteArgs(
            key: key,
            addToCart: addToCart,
          ),
        );

  static const String name = 'CovidMaterialListPageRoute';
}

class CovidMaterialListPageRouteArgs {
  const CovidMaterialListPageRouteArgs({
    this.key,
    required this.addToCart,
  });

  final _i53.Key? key;

  final Function addToCart;

  @override
  String toString() {
    return 'CovidMaterialListPageRouteArgs{key: $key, addToCart: $addToCart}';
  }
}

/// generated route for
/// [_i48.HomeTab]
class HomeTabRoute extends _i52.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i49.HistoryTab]
class HistoryTabRoute extends _i52.PageRouteInfo<HistoryTabRouteArgs> {
  HistoryTabRoute({_i53.Key? key})
      : super(
          HistoryTabRoute.name,
          path: 'orders/history',
          args: HistoryTabRouteArgs(key: key),
        );

  static const String name = 'HistoryTabRoute';
}

class HistoryTabRouteArgs {
  const HistoryTabRouteArgs({this.key});

  final _i53.Key? key;

  @override
  String toString() {
    return 'HistoryTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i50.FavouritesTab]
class FavouritesTabRoute extends _i52.PageRouteInfo<void> {
  const FavouritesTabRoute()
      : super(
          FavouritesTabRoute.name,
          path: 'orders/favourites',
        );

  static const String name = 'FavouritesTabRoute';
}

/// generated route for
/// [_i51.AccountTab]
class AccountTabRoute extends _i52.PageRouteInfo<void> {
  const AccountTabRoute()
      : super(
          AccountTabRoute.name,
          path: 'core/account',
        );

  static const String name = 'AccountTabRoute';
}
