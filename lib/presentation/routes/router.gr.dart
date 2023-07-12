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
import 'package:auto_route/auto_route.dart' as _i78;
import 'package:flutter/material.dart' as _i79;

import '../../domain/account/entities/customer_code_info.dart' as _i83;
import '../../domain/account/entities/ship_to_info.dart' as _i84;
import '../../domain/account/value/value_objects.dart' as _i80;
import '../../domain/core/aggregate/bundle_aggregate.dart' as _i87;
import '../../domain/core/aggregate/price_aggregate.dart' as _i88;
import '../../domain/order/entities/cart_item.dart' as _i81;
import '../../domain/order/entities/order_history_details_order_header.dart'
    as _i90;
import '../../domain/order/entities/order_history_item.dart' as _i89;
import '../../domain/payments/entities/credit_and_invoice_item.dart' as _i86;
import '../../domain/payments/entities/payment_summary_details.dart' as _i82;
import '../../domain/returns/entities/return_summary_requests.dart' as _i85;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i51;
import '../account/change_password/change_password_page.dart' as _i22;
import '../account/contact_us/contact_us_page.dart' as _i23;
import '../account/customer_search.dart' as _i25;
import '../account/notification_settings/notification_settings_page.dart'
    as _i24;
import '../account/payment_configuration/bank_benificiary/add_beneficiary_page.dart'
    as _i11;
import '../account/payment_configuration/bank_benificiary/bank_beneficiary_page.dart'
    as _i10;
import '../account/payment_configuration/bank_benificiary/edit_beneficiary_page.dart'
    as _i14;
import '../account/payment_configuration/deduction_code/add_deduction_code_page.dart'
    as _i13;
import '../account/payment_configuration/deduction_code/deduction_code_list_page.dart'
    as _i12;
import '../account/payment_configuration/deduction_code/edit_deduction_code_page.dart'
    as _i15;
import '../account/payment_configuration/payment_advice_footer/add_payment_advice_footer.dart'
    as _i56;
import '../account/payment_configuration/payment_advice_footer/edit_payment_advice_footer.dart'
    as _i57;
import '../account/payment_configuration/payment_advice_footer/payment_advice_footer_page.dart'
    as _i55;
import '../account/payment_configuration/payment_configuration_page.dart'
    as _i6;
import '../account/payment_configuration/payment_methods/add_payment_method_page.dart'
    as _i9;
import '../account/payment_configuration/payment_methods/edit_payment_method_page.dart'
    as _i8;
import '../account/payment_configuration/payment_methods/payment_methods_page.dart'
    as _i7;
import '../account/payment_configuration/sales_district/add_sales_district_page.dart'
    as _i53;
import '../account/payment_configuration/sales_district/edit_sales_district_page.dart'
    as _i54;
import '../account/payment_configuration/sales_district/sales_district_page.dart'
    as _i52;
import '../account/settings_page.dart' as _i5;
import '../aup_tc/aup_tc.dart' as _i26;
import '../auth/forgot_password/forgot_passoword_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../core/static_html_viewer.dart' as _i21;
import '../core/webview_page.dart' as _i20;
import '../home/home_tab.dart' as _i66;
import '../home_tab.dart' as _i32;
import '../intro/intro_page.dart' as _i58;
import '../more/more_tab.dart' as _i69;
import '../notification/notificatoin_tab.dart' as _i70;
import '../orders/cart/add_to_cart/add_to_cart.dart' as _i49;
import '../orders/cart/add_to_cart/update_cart.dart' as _i50;
import '../orders/cart/bonus/search_bonus_page.dart' as _i33;
import '../orders/cart/cart_page.dart' as _i27;
import '../orders/cart/checkout/checkout_page.dart' as _i28;
import '../orders/create_order/bundle_item_detail_page.dart' as _i45;
import '../orders/create_order/scan_material_info.dart' as _i38;
import '../orders/order_success/order_success_page.dart' as _i29;
import '../orders/order_tab/orders_tab.dart' as _i68;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i71;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i72;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i59;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i60;
import '../payments/all_credits/all_credits.dart' as _i42;
import '../payments/all_invoices/all_invoices.dart' as _i40;
import '../payments/credit_details/credit_details.dart' as _i43;
import '../payments/invoice_details/invoice_details.dart' as _i41;
import '../payments/new_payment/new_payment.dart' as _i44;
import '../payments/new_payment/tabs/available_credits_tab.dart' as _i76;
import '../payments/new_payment/tabs/outstanding_invoices_tab.dart' as _i75;
import '../payments/new_payment/tabs/payment_method_tab.dart' as _i77;
import '../payments/payment_overview/account_summary.dart' as _i63;
import '../payments/payment_overview/payments_summary.dart' as _i64;
import '../payments/payment_overview/statement_summary.dart' as _i65;
import '../payments/payment_summary/payment_summary.dart' as _i36;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i37;
import '../payments/payments_tab.dart' as _i31;
import '../products/bundle_details/bundle_detail_page.dart' as _i61;
import '../products/product_details/product_details_page.dart' as _i62;
import '../products/product_suggestion_page.dart' as _i30;
import '../products/products_tab.dart' as _i67;
import '../returns/add_edit_user_restrictions.dart' as _i34;
import '../returns/approver_actions/approver_actions.dart' as _i16;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i19;
import '../returns/policy_configuration/policy_configuration.dart' as _i18;
import '../returns/request_return/request_return_details.dart' as _i46;
import '../returns/request_return/return_details_summary_page.dart' as _i47;
import '../returns/request_return/return_request_success.dart' as _i48;
import '../returns/return_list/return_by_item_page.dart' as _i73;
import '../returns/return_list/return_by_request_page.dart' as _i74;
import '../returns/return_list/return_root.dart' as _i35;
import '../returns/return_summary_details/return_summary_details.dart' as _i39;
import '../returns/user_restriction_list.dart' as _i17;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i78.RootStackRouter {
  AppRouter([_i79.GlobalKey<_i79.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i78.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsPage(),
      );
    },
    PaymentConfigurationPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentConfigurationPage(),
      );
    },
    PaymentMethodsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PaymentMethodsPage(),
      );
    },
    EditPaymentMethodsPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditPaymentMethodsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EditPaymentMethodsPage(
          key: args.key,
          salesOrg: args.salesOrg,
          oldPaymentMethod: args.oldPaymentMethod,
        ),
      );
    },
    AddPaymentMethodsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AddPaymentMethodsPage(),
      );
    },
    BankBeneficiaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.BankBeneficiaryPage(),
      );
    },
    AddBeneficiaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AddBeneficiaryPage(),
      );
    },
    DeductionCodeListPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DeductionCodeListPage(),
      );
    },
    AddDeductionCodePageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AddDeductionCodePage(),
      );
    },
    EditBeneficiaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.EditBeneficiaryPage(),
      );
    },
    EditDeductionCodePageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.EditDeductionCodePage(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
          titleText: args.titleText,
        ),
      );
    },
    StaticHtmlViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StaticHtmlViewerRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i21.StaticHtmlViewer(
          key: args.key,
          title: args.title,
          htmlPath: args.htmlPath,
          styleCss: args.styleCss,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.CustomerSearchPage(),
      );
    },
    AupTCDialogRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.AupTCDialog(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.CartPage(),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      return _i78.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i30.ProductSuggestionPage(),
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentsTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.PaymentsTab(),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.HomeNavigationTabbar(key: args.key),
      );
    },
    BonusAddPageRoute.name: (routeData) {
      final args = routeData.argsAs<BonusAddPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i33.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.ReturnRoot(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryPageRouteArgs>(
          orElse: () => const PaymentSummaryPageRouteArgs());
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.PaymentSummaryPage(key: args.key),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryDetailsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i37.PaymentSummaryDetailsPage(
          key: args.key,
          paymentSummaryDetails: args.paymentSummaryDetails,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i38.ScanMaterialInfo(),
      );
    },
    ReturnSummaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnSummaryDetailsRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i39.ReturnSummaryDetails(
          key: args.key,
          customerCodeInfo: args.customerCodeInfo,
          shipToInfo: args.shipToInfo,
          returnSummaryRequests: args.returnSummaryRequests,
        ),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i40.AllInvoicesPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.InvoiceDetailsPage(
          key: args.key,
          invoiceItem: args.invoiceItem,
        ),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.AllCreditsPage(),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i43.CreditDetailsPage(
          key: args.key,
          creditItem: args.creditItem,
        ),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i44.NewPaymentPage(),
      );
    },
    BundleItemDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleItemDetailPageRouteArgs>();
      return _i78.CustomPage<dynamic>(
        routeData: routeData,
        child: _i45.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i78.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RequestReturnDetailsRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.RequestReturnDetails(),
      );
    },
    RequestReturnDetailsSummaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i47.RequestReturnDetailsSummaryPage(),
      );
    },
    ReturnRequestSuccessPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i48.ReturnRequestSuccessPage(),
      );
    },
    AddToCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddToCartRouteArgs>();
      return _i78.CustomPage<dynamic>(
        routeData: routeData,
        child: _i78.WrappedRoute(
            child: _i49.AddToCart(
          key: args.key,
          isCovid19Tab: args.isCovid19Tab,
          material: args.material,
          isShortcutAccess: args.isShortcutAccess,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i78.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdateCartRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCartRouteArgs>();
      return _i78.CustomPage<dynamic>(
        routeData: routeData,
        child: _i78.WrappedRoute(
            child: _i50.UpdateCart(
          key: args.key,
          material: args.material,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i78.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i51.AdminPoAttachmentPage(key: args.key),
      );
    },
    SalesDistrictPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i52.SalesDistrictPage(),
      );
    },
    AddSalesDistrictPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.AddSalesDistrictPage(),
      );
    },
    EditSalesDistrictPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.EditSalesDistrictPage(),
      );
    },
    PaymentAdviceFooterPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.PaymentAdviceFooterPage(),
      );
    },
    AddPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i56.AddPaymentAdviceFooterPage(),
      );
    },
    EditPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i57.EditPaymentAdviceFooterPage(),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i58.IntroPage(),
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByItemDetailsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i59.ViewByItemDetailsPage(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
        ),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByOrderDetailsPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i60.ViewByOrderDetailsPage(
          key: args.key,
          viewByOrderHistoryItem: args.viewByOrderHistoryItem,
        ),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i61.BundleDetailPage(),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i62.ProductDetailsPage(),
      );
    },
    AccountSummaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i63.AccountSummaryPage(),
      );
    },
    PaymentsSummaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i64.PaymentsSummaryPage(),
      );
    },
    StatementSummaryPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.StatementSummaryPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByOrdersPageRouteArgs>();
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i72.ViewByOrdersPage(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
        ),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i73.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i76.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i78.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i77.PaymentMethodTab(),
      );
    },
  };

  @override
  List<_i78.RouteConfig> get routes => [
        _i78.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i78.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i78.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i78.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i78.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i78.RouteConfig(
          SettingsPageRoute.name,
          path: 'settings',
        ),
        _i78.RouteConfig(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        ),
        _i78.RouteConfig(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        ),
        _i78.RouteConfig(
          EditPaymentMethodsPageRoute.name,
          path: 'edit_payment_methods',
        ),
        _i78.RouteConfig(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        ),
        _i78.RouteConfig(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        ),
        _i78.RouteConfig(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        ),
        _i78.RouteConfig(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        ),
        _i78.RouteConfig(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        ),
        _i78.RouteConfig(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        ),
        _i78.RouteConfig(
          EditDeductionCodePageRoute.name,
          path: 'payments/edit_deduction_code',
        ),
        _i78.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i78.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i78.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i78.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i78.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i78.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i78.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i78.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i78.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i78.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i78.RouteConfig(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        ),
        _i78.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i78.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i78.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i78.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i78.RouteConfig(
          PaymentsTabRoute.name,
          path: 'payments/tab',
          children: [
            _i78.RouteConfig(
              '#redirect',
              path: '',
              parent: PaymentsTabRoute.name,
              redirectTo: 'payments/account_summary',
              fullMatch: true,
            ),
            _i78.RouteConfig(
              AccountSummaryPageRoute.name,
              path: 'payments/account_summary',
              parent: PaymentsTabRoute.name,
            ),
            _i78.RouteConfig(
              PaymentsSummaryPageRoute.name,
              path: 'payments/payments_summary',
              parent: PaymentsTabRoute.name,
            ),
            _i78.RouteConfig(
              StatementSummaryPageRoute.name,
              path: 'payments/statement_summary',
              parent: PaymentsTabRoute.name,
            ),
          ],
        ),
        _i78.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i78.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i78.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i78.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i78.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i78.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i78.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i78.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i78.RouteConfig(
          BonusAddPageRoute.name,
          path: 'orders/add_bonus',
        ),
        _i78.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i78.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i78.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i78.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i78.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i78.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i78.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i78.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i78.RouteConfig(
          ReturnSummaryDetailsRoute.name,
          path: 'returns/return_summary_details',
        ),
        _i78.RouteConfig(
          AllInvoicesPageRoute.name,
          path: 'payments/all_invoices',
        ),
        _i78.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i78.RouteConfig(
          AllCreditsPageRoute.name,
          path: 'payments/all_credits',
        ),
        _i78.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i78.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i78.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i78.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i78.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i78.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'orders/bundle_item_detail',
        ),
        _i78.RouteConfig(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        ),
        _i78.RouteConfig(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        ),
        _i78.RouteConfig(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        ),
        _i78.RouteConfig(
          AddToCartRoute.name,
          path: 'orders/add_to_cart',
        ),
        _i78.RouteConfig(
          UpdateCartRoute.name,
          path: 'orders/update_cart',
        ),
        _i78.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i78.RouteConfig(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        ),
        _i78.RouteConfig(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        ),
        _i78.RouteConfig(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        ),
        _i78.RouteConfig(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        ),
        _i78.RouteConfig(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        ),
        _i78.RouteConfig(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        ),
        _i78.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i78.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i78.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i78.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i78.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i78.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i78.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i78.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i78.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute()
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsPageRoute extends _i78.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i6.PaymentConfigurationPage]
class PaymentConfigurationPageRoute extends _i78.PageRouteInfo<void> {
  const PaymentConfigurationPageRoute()
      : super(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        );

  static const String name = 'PaymentConfigurationPageRoute';
}

/// generated route for
/// [_i7.PaymentMethodsPage]
class PaymentMethodsPageRoute extends _i78.PageRouteInfo<void> {
  const PaymentMethodsPageRoute()
      : super(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        );

  static const String name = 'PaymentMethodsPageRoute';
}

/// generated route for
/// [_i8.EditPaymentMethodsPage]
class EditPaymentMethodsPageRoute
    extends _i78.PageRouteInfo<EditPaymentMethodsPageRouteArgs> {
  EditPaymentMethodsPageRoute({
    _i79.Key? key,
    required _i80.SalesOrg salesOrg,
    required _i80.PaymentMethod oldPaymentMethod,
  }) : super(
          EditPaymentMethodsPageRoute.name,
          path: 'edit_payment_methods',
          args: EditPaymentMethodsPageRouteArgs(
            key: key,
            salesOrg: salesOrg,
            oldPaymentMethod: oldPaymentMethod,
          ),
        );

  static const String name = 'EditPaymentMethodsPageRoute';
}

class EditPaymentMethodsPageRouteArgs {
  const EditPaymentMethodsPageRouteArgs({
    this.key,
    required this.salesOrg,
    required this.oldPaymentMethod,
  });

  final _i79.Key? key;

  final _i80.SalesOrg salesOrg;

  final _i80.PaymentMethod oldPaymentMethod;

  @override
  String toString() {
    return 'EditPaymentMethodsPageRouteArgs{key: $key, salesOrg: $salesOrg, oldPaymentMethod: $oldPaymentMethod}';
  }
}

/// generated route for
/// [_i9.AddPaymentMethodsPage]
class AddPaymentMethodsPageRoute extends _i78.PageRouteInfo<void> {
  const AddPaymentMethodsPageRoute()
      : super(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        );

  static const String name = 'AddPaymentMethodsPageRoute';
}

/// generated route for
/// [_i10.BankBeneficiaryPage]
class BankBeneficiaryPageRoute extends _i78.PageRouteInfo<void> {
  const BankBeneficiaryPageRoute()
      : super(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        );

  static const String name = 'BankBeneficiaryPageRoute';
}

/// generated route for
/// [_i11.AddBeneficiaryPage]
class AddBeneficiaryPageRoute extends _i78.PageRouteInfo<void> {
  const AddBeneficiaryPageRoute()
      : super(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        );

  static const String name = 'AddBeneficiaryPageRoute';
}

/// generated route for
/// [_i12.DeductionCodeListPage]
class DeductionCodeListPageRoute extends _i78.PageRouteInfo<void> {
  const DeductionCodeListPageRoute()
      : super(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        );

  static const String name = 'DeductionCodeListPageRoute';
}

/// generated route for
/// [_i13.AddDeductionCodePage]
class AddDeductionCodePageRoute extends _i78.PageRouteInfo<void> {
  const AddDeductionCodePageRoute()
      : super(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        );

  static const String name = 'AddDeductionCodePageRoute';
}

/// generated route for
/// [_i14.EditBeneficiaryPage]
class EditBeneficiaryPageRoute extends _i78.PageRouteInfo<void> {
  const EditBeneficiaryPageRoute()
      : super(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        );

  static const String name = 'EditBeneficiaryPageRoute';
}

/// generated route for
/// [_i15.EditDeductionCodePage]
class EditDeductionCodePageRoute extends _i78.PageRouteInfo<void> {
  const EditDeductionCodePageRoute()
      : super(
          EditDeductionCodePageRoute.name,
          path: 'payments/edit_deduction_code',
        );

  static const String name = 'EditDeductionCodePageRoute';
}

/// generated route for
/// [_i16.ApproverActions]
class ApproverActionsRoute
    extends _i78.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i79.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i79.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i78.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i18.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i78.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i19.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i78.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i20.WebViewPage]
class WebViewPageRoute extends _i78.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i79.Key? key,
    String url = '',
    String? initialFile,
    String titleText = '',
  }) : super(
          WebViewPageRoute.name,
          path: 'web_view',
          args: WebViewPageRouteArgs(
            key: key,
            url: url,
            initialFile: initialFile,
            titleText: titleText,
          ),
        );

  static const String name = 'WebViewPageRoute';
}

class WebViewPageRouteArgs {
  const WebViewPageRouteArgs({
    this.key,
    this.url = '',
    this.initialFile,
    this.titleText = '',
  });

  final _i79.Key? key;

  final String url;

  final String? initialFile;

  final String titleText;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile, titleText: $titleText}';
  }
}

/// generated route for
/// [_i21.StaticHtmlViewer]
class StaticHtmlViewerRoute
    extends _i78.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i79.Key? key,
    String title = '',
    required String htmlPath,
    String styleCss = '',
  }) : super(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
          args: StaticHtmlViewerRouteArgs(
            key: key,
            title: title,
            htmlPath: htmlPath,
            styleCss: styleCss,
          ),
        );

  static const String name = 'StaticHtmlViewerRoute';
}

class StaticHtmlViewerRouteArgs {
  const StaticHtmlViewerRouteArgs({
    this.key,
    this.title = '',
    required this.htmlPath,
    this.styleCss = '',
  });

  final _i79.Key? key;

  final String title;

  final String htmlPath;

  final String styleCss;

  @override
  String toString() {
    return 'StaticHtmlViewerRouteArgs{key: $key, title: $title, htmlPath: $htmlPath, styleCss: $styleCss}';
  }
}

/// generated route for
/// [_i22.ChangePasswordPage]
class ChangePasswordPageRoute extends _i78.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i23.ContactUsPage]
class ContactUsPageRoute extends _i78.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i24.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i78.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i25.CustomerSearchPage]
class CustomerSearchPageRoute extends _i78.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i26.AupTCDialog]
class AupTCDialogRoute extends _i78.PageRouteInfo<void> {
  const AupTCDialogRoute()
      : super(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        );

  static const String name = 'AupTCDialogRoute';
}

/// generated route for
/// [_i27.CartPage]
class CartPageRoute extends _i78.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i28.CheckoutPage]
class CheckoutPageRoute extends _i78.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i29.OrderSuccessPage]
class OrderSuccessPageRoute extends _i78.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i30.ProductSuggestionPage]
class ProductSuggestionPageRoute extends _i78.PageRouteInfo<void> {
  const ProductSuggestionPageRoute()
      : super(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        );

  static const String name = 'ProductSuggestionPageRoute';
}

/// generated route for
/// [_i31.PaymentsTab]
class PaymentsTabRoute extends _i78.PageRouteInfo<void> {
  const PaymentsTabRoute({List<_i78.PageRouteInfo>? children})
      : super(
          PaymentsTabRoute.name,
          path: 'payments/tab',
          initialChildren: children,
        );

  static const String name = 'PaymentsTabRoute';
}

/// generated route for
/// [_i32.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i78.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i79.Key? key,
    List<_i78.PageRouteInfo>? children,
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

  final _i79.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i33.BonusAddPage]
class BonusAddPageRoute extends _i78.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i79.Key? key,
    required _i81.CartItem cartItem,
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

  final _i79.Key? key;

  final _i81.CartItem cartItem;

  @override
  String toString() {
    return 'BonusAddPageRouteArgs{key: $key, cartItem: $cartItem}';
  }
}

/// generated route for
/// [_i34.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i78.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i79.Key? key,
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

  final _i79.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i35.ReturnRoot]
class ReturnRootRoute extends _i78.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i78.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i36.PaymentSummaryPage]
class PaymentSummaryPageRoute
    extends _i78.PageRouteInfo<PaymentSummaryPageRouteArgs> {
  PaymentSummaryPageRoute({_i79.Key? key})
      : super(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
          args: PaymentSummaryPageRouteArgs(key: key),
        );

  static const String name = 'PaymentSummaryPageRoute';
}

class PaymentSummaryPageRouteArgs {
  const PaymentSummaryPageRouteArgs({this.key});

  final _i79.Key? key;

  @override
  String toString() {
    return 'PaymentSummaryPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i37.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute
    extends _i78.PageRouteInfo<PaymentSummaryDetailsPageRouteArgs> {
  PaymentSummaryDetailsPageRoute({
    _i79.Key? key,
    required _i82.PaymentSummaryDetails paymentSummaryDetails,
  }) : super(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
          args: PaymentSummaryDetailsPageRouteArgs(
            key: key,
            paymentSummaryDetails: paymentSummaryDetails,
          ),
        );

  static const String name = 'PaymentSummaryDetailsPageRoute';
}

class PaymentSummaryDetailsPageRouteArgs {
  const PaymentSummaryDetailsPageRouteArgs({
    this.key,
    required this.paymentSummaryDetails,
  });

  final _i79.Key? key;

  final _i82.PaymentSummaryDetails paymentSummaryDetails;

  @override
  String toString() {
    return 'PaymentSummaryDetailsPageRouteArgs{key: $key, paymentSummaryDetails: $paymentSummaryDetails}';
  }
}

/// generated route for
/// [_i38.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i78.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i39.ReturnSummaryDetails]
class ReturnSummaryDetailsRoute
    extends _i78.PageRouteInfo<ReturnSummaryDetailsRouteArgs> {
  ReturnSummaryDetailsRoute({
    _i79.Key? key,
    required _i83.CustomerCodeInfo customerCodeInfo,
    required _i84.ShipToInfo shipToInfo,
    required _i85.ReturnSummaryRequest returnSummaryRequests,
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

  final _i79.Key? key;

  final _i83.CustomerCodeInfo customerCodeInfo;

  final _i84.ShipToInfo shipToInfo;

  final _i85.ReturnSummaryRequest returnSummaryRequests;

  @override
  String toString() {
    return 'ReturnSummaryDetailsRouteArgs{key: $key, customerCodeInfo: $customerCodeInfo, shipToInfo: $shipToInfo, returnSummaryRequests: $returnSummaryRequests}';
  }
}

/// generated route for
/// [_i40.AllInvoicesPage]
class AllInvoicesPageRoute extends _i78.PageRouteInfo<void> {
  const AllInvoicesPageRoute()
      : super(
          AllInvoicesPageRoute.name,
          path: 'payments/all_invoices',
        );

  static const String name = 'AllInvoicesPageRoute';
}

/// generated route for
/// [_i41.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i78.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i79.Key? key,
    required _i86.CreditAndInvoiceItem invoiceItem,
  }) : super(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
          args: InvoiceDetailsPageRouteArgs(
            key: key,
            invoiceItem: invoiceItem,
          ),
        );

  static const String name = 'InvoiceDetailsPageRoute';
}

class InvoiceDetailsPageRouteArgs {
  const InvoiceDetailsPageRouteArgs({
    this.key,
    required this.invoiceItem,
  });

  final _i79.Key? key;

  final _i86.CreditAndInvoiceItem invoiceItem;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, invoiceItem: $invoiceItem}';
  }
}

/// generated route for
/// [_i42.AllCreditsPage]
class AllCreditsPageRoute extends _i78.PageRouteInfo<void> {
  const AllCreditsPageRoute()
      : super(
          AllCreditsPageRoute.name,
          path: 'payments/all_credits',
        );

  static const String name = 'AllCreditsPageRoute';
}

/// generated route for
/// [_i43.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i78.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i79.Key? key,
    required _i86.CreditAndInvoiceItem creditItem,
  }) : super(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
          args: CreditDetailsPageRouteArgs(
            key: key,
            creditItem: creditItem,
          ),
        );

  static const String name = 'CreditDetailsPageRoute';
}

class CreditDetailsPageRouteArgs {
  const CreditDetailsPageRouteArgs({
    this.key,
    required this.creditItem,
  });

  final _i79.Key? key;

  final _i86.CreditAndInvoiceItem creditItem;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, creditItem: $creditItem}';
  }
}

/// generated route for
/// [_i44.NewPaymentPage]
class NewPaymentPageRoute extends _i78.PageRouteInfo<void> {
  const NewPaymentPageRoute({List<_i78.PageRouteInfo>? children})
      : super(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';
}

/// generated route for
/// [_i45.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i78.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i79.Key? key,
    required _i87.BundleAggregate bundleAggregate,
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

  final _i79.Key? key;

  final _i87.BundleAggregate bundleAggregate;

  @override
  String toString() {
    return 'BundleItemDetailPageRouteArgs{key: $key, bundleAggregate: $bundleAggregate}';
  }
}

/// generated route for
/// [_i46.RequestReturnDetails]
class RequestReturnDetailsRoute extends _i78.PageRouteInfo<void> {
  const RequestReturnDetailsRoute()
      : super(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        );

  static const String name = 'RequestReturnDetailsRoute';
}

/// generated route for
/// [_i47.RequestReturnDetailsSummaryPage]
class RequestReturnDetailsSummaryPageRoute extends _i78.PageRouteInfo<void> {
  const RequestReturnDetailsSummaryPageRoute()
      : super(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        );

  static const String name = 'RequestReturnDetailsSummaryPageRoute';
}

/// generated route for
/// [_i48.ReturnRequestSuccessPage]
class ReturnRequestSuccessPageRoute extends _i78.PageRouteInfo<void> {
  const ReturnRequestSuccessPageRoute()
      : super(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        );

  static const String name = 'ReturnRequestSuccessPageRoute';
}

/// generated route for
/// [_i49.AddToCart]
class AddToCartRoute extends _i78.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i79.Key? key,
    required bool isCovid19Tab,
    required _i88.PriceAggregate material,
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

  final _i79.Key? key;

  final bool isCovid19Tab;

  final _i88.PriceAggregate material;

  final bool isShortcutAccess;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, isCovid19Tab: $isCovid19Tab, material: $material, isShortcutAccess: $isShortcutAccess}';
  }
}

/// generated route for
/// [_i50.UpdateCart]
class UpdateCartRoute extends _i78.PageRouteInfo<UpdateCartRouteArgs> {
  UpdateCartRoute({
    _i79.Key? key,
    required _i88.PriceAggregate material,
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

  final _i79.Key? key;

  final _i88.PriceAggregate material;

  @override
  String toString() {
    return 'UpdateCartRouteArgs{key: $key, material: $material}';
  }
}

/// generated route for
/// [_i51.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i78.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i79.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i79.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i52.SalesDistrictPage]
class SalesDistrictPageRoute extends _i78.PageRouteInfo<void> {
  const SalesDistrictPageRoute()
      : super(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        );

  static const String name = 'SalesDistrictPageRoute';
}

/// generated route for
/// [_i53.AddSalesDistrictPage]
class AddSalesDistrictPageRoute extends _i78.PageRouteInfo<void> {
  const AddSalesDistrictPageRoute()
      : super(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        );

  static const String name = 'AddSalesDistrictPageRoute';
}

/// generated route for
/// [_i54.EditSalesDistrictPage]
class EditSalesDistrictPageRoute extends _i78.PageRouteInfo<void> {
  const EditSalesDistrictPageRoute()
      : super(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        );

  static const String name = 'EditSalesDistrictPageRoute';
}

/// generated route for
/// [_i55.PaymentAdviceFooterPage]
class PaymentAdviceFooterPageRoute extends _i78.PageRouteInfo<void> {
  const PaymentAdviceFooterPageRoute()
      : super(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        );

  static const String name = 'PaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i56.AddPaymentAdviceFooterPage]
class AddPaymentAdviceFooterPageRoute extends _i78.PageRouteInfo<void> {
  const AddPaymentAdviceFooterPageRoute()
      : super(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        );

  static const String name = 'AddPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i57.EditPaymentAdviceFooterPage]
class EditPaymentAdviceFooterPageRoute extends _i78.PageRouteInfo<void> {
  const EditPaymentAdviceFooterPageRoute()
      : super(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        );

  static const String name = 'EditPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i58.IntroPage]
class IntroPageRoute extends _i78.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i59.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute
    extends _i78.PageRouteInfo<ViewByItemDetailsPageRouteArgs> {
  ViewByItemDetailsPageRoute({
    _i79.Key? key,
    required _i89.OrderHistoryItem orderHistoryItem,
  }) : super(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
          args: ViewByItemDetailsPageRouteArgs(
            key: key,
            orderHistoryItem: orderHistoryItem,
          ),
        );

  static const String name = 'ViewByItemDetailsPageRoute';
}

class ViewByItemDetailsPageRouteArgs {
  const ViewByItemDetailsPageRouteArgs({
    this.key,
    required this.orderHistoryItem,
  });

  final _i79.Key? key;

  final _i89.OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'ViewByItemDetailsPageRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem}';
  }
}

/// generated route for
/// [_i60.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute
    extends _i78.PageRouteInfo<ViewByOrderDetailsPageRouteArgs> {
  ViewByOrderDetailsPageRoute({
    _i79.Key? key,
    required _i90.OrderHistoryDetailsOrderHeader viewByOrderHistoryItem,
  }) : super(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
          args: ViewByOrderDetailsPageRouteArgs(
            key: key,
            viewByOrderHistoryItem: viewByOrderHistoryItem,
          ),
        );

  static const String name = 'ViewByOrderDetailsPageRoute';
}

class ViewByOrderDetailsPageRouteArgs {
  const ViewByOrderDetailsPageRouteArgs({
    this.key,
    required this.viewByOrderHistoryItem,
  });

  final _i79.Key? key;

  final _i90.OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  @override
  String toString() {
    return 'ViewByOrderDetailsPageRouteArgs{key: $key, viewByOrderHistoryItem: $viewByOrderHistoryItem}';
  }
}

/// generated route for
/// [_i61.BundleDetailPage]
class BundleDetailPageRoute extends _i78.PageRouteInfo<void> {
  const BundleDetailPageRoute()
      : super(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        );

  static const String name = 'BundleDetailPageRoute';
}

/// generated route for
/// [_i62.ProductDetailsPage]
class ProductDetailsPageRoute extends _i78.PageRouteInfo<void> {
  const ProductDetailsPageRoute()
      : super(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        );

  static const String name = 'ProductDetailsPageRoute';
}

/// generated route for
/// [_i63.AccountSummaryPage]
class AccountSummaryPageRoute extends _i78.PageRouteInfo<void> {
  const AccountSummaryPageRoute()
      : super(
          AccountSummaryPageRoute.name,
          path: 'payments/account_summary',
        );

  static const String name = 'AccountSummaryPageRoute';
}

/// generated route for
/// [_i64.PaymentsSummaryPage]
class PaymentsSummaryPageRoute extends _i78.PageRouteInfo<void> {
  const PaymentsSummaryPageRoute()
      : super(
          PaymentsSummaryPageRoute.name,
          path: 'payments/payments_summary',
        );

  static const String name = 'PaymentsSummaryPageRoute';
}

/// generated route for
/// [_i65.StatementSummaryPage]
class StatementSummaryPageRoute extends _i78.PageRouteInfo<void> {
  const StatementSummaryPageRoute()
      : super(
          StatementSummaryPageRoute.name,
          path: 'payments/statement_summary',
        );

  static const String name = 'StatementSummaryPageRoute';
}

/// generated route for
/// [_i66.HomeTab]
class HomeTabRoute extends _i78.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i67.ProductsTab]
class ProductsTabRoute extends _i78.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i68.OrdersTab]
class OrdersTabRoute extends _i78.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i78.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i69.MoreTab]
class MoreTabRoute extends _i78.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i70.NotificationTab]
class NotificationTabRoute extends _i78.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i71.ViewByItemsPage]
class ViewByItemsPageRoute extends _i78.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i72.ViewByOrdersPage]
class ViewByOrdersPageRoute
    extends _i78.PageRouteInfo<ViewByOrdersPageRouteArgs> {
  ViewByOrdersPageRoute({
    _i79.Key? key,
    required _i89.OrderHistoryItem orderHistoryItem,
  }) : super(
          ViewByOrdersPageRoute.name,
          path: 'orders/view_by_orders',
          args: ViewByOrdersPageRouteArgs(
            key: key,
            orderHistoryItem: orderHistoryItem,
          ),
        );

  static const String name = 'ViewByOrdersPageRoute';
}

class ViewByOrdersPageRouteArgs {
  const ViewByOrdersPageRouteArgs({
    this.key,
    required this.orderHistoryItem,
  });

  final _i79.Key? key;

  final _i89.OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'ViewByOrdersPageRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem}';
  }
}

/// generated route for
/// [_i73.ReturnByItemPage]
class ReturnByItemPageRoute extends _i78.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i74.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i78.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i75.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i78.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i76.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i78.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i77.PaymentMethodTab]
class PaymentMethodTabRoute extends _i78.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}
