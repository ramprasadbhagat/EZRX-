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
import 'package:auto_route/auto_route.dart' as _i81;
import 'package:flutter/material.dart' as _i82;

import '../../domain/account/value/value_objects.dart' as _i83;
import '../../domain/announcement_info/entities/announcement_article_info.dart'
    as _i92;
import '../../domain/core/aggregate/bundle_aggregate.dart' as _i87;
import '../../domain/core/aggregate/price_aggregate.dart' as _i88;
import '../../domain/order/entities/cart_item.dart' as _i84;
import '../../domain/order/entities/order_history_details_order_header.dart'
    as _i90;
import '../../domain/order/entities/order_history_item.dart' as _i89;
import '../../domain/payments/entities/credit_and_invoice_item.dart' as _i86;
import '../../domain/payments/entities/payment_summary_details.dart' as _i85;
import '../../domain/returns/entities/return_item.dart' as _i91;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i49;
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
    as _i54;
import '../account/payment_configuration/payment_advice_footer/edit_payment_advice_footer.dart'
    as _i55;
import '../account/payment_configuration/payment_advice_footer/payment_advice_footer_page.dart'
    as _i53;
import '../account/payment_configuration/payment_configuration_page.dart'
    as _i6;
import '../account/payment_configuration/payment_methods/add_payment_method_page.dart'
    as _i9;
import '../account/payment_configuration/payment_methods/edit_payment_method_page.dart'
    as _i8;
import '../account/payment_configuration/payment_methods/payment_methods_page.dart'
    as _i7;
import '../account/payment_configuration/sales_district/add_sales_district_page.dart'
    as _i51;
import '../account/payment_configuration/sales_district/edit_sales_district_page.dart'
    as _i52;
import '../account/payment_configuration/sales_district/sales_district_page.dart'
    as _i50;
import '../account/settings_page.dart' as _i5;
import '../aup_tc/aup_tc.dart' as _i26;
import '../auth/forgot_password/forgot_passoword_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../core/static_html_viewer.dart' as _i21;
import '../core/webview_page.dart' as _i20;
import '../home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i80;
import '../home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i62;
import '../home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i63;
import '../home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i79;
import '../home/home_tab.dart' as _i67;
import '../home_tab.dart' as _i34;
import '../intro/intro_page.dart' as _i56;
import '../more/more_tab.dart' as _i70;
import '../notification/notificatoin_tab.dart' as _i71;
import '../orders/cart/add_to_cart/add_to_cart.dart' as _i47;
import '../orders/cart/add_to_cart/update_cart.dart' as _i48;
import '../orders/cart/bonus/search_bonus_page.dart' as _i35;
import '../orders/cart/cart_page.dart' as _i27;
import '../orders/cart/checkout/checkout_page.dart' as _i28;
import '../orders/create_order/bundle_item_detail_page.dart' as _i43;
import '../orders/create_order/scan_material_info.dart' as _i39;
import '../orders/order_success/order_success_page.dart' as _i29;
import '../orders/order_tab/orders_tab.dart' as _i69;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i72;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i73;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i57;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i58;
import '../payments/account_summary/account_summary_page.dart' as _i33;
import '../payments/all_credits/all_credits.dart' as _i66;
import '../payments/all_invoices/all_invoices.dart' as _i65;
import '../payments/credit_details/credit_details.dart' as _i41;
import '../payments/invoice_details/invoice_details.dart' as _i40;
import '../payments/new_payment/new_payment.dart' as _i42;
import '../payments/new_payment/tabs/available_credits_tab.dart' as _i77;
import '../payments/new_payment/tabs/outstanding_invoices_tab.dart' as _i76;
import '../payments/new_payment/tabs/payment_method_tab.dart' as _i78;
import '../payments/payment_page.dart' as _i31;
import '../payments/payment_summary/payment_summary.dart' as _i32;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i38;
import '../products/bundle_details/bundle_detail_page.dart' as _i59;
import '../products/product_details/product_details_page.dart' as _i60;
import '../products/product_suggestion_page.dart' as _i30;
import '../products/products_tab.dart' as _i68;
import '../returns/add_edit_user_restrictions.dart' as _i36;
import '../returns/approver_actions/approver_actions.dart' as _i16;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i19;
import '../returns/policy_configuration/policy_configuration.dart' as _i18;
import '../returns/request_return/request_return_details.dart' as _i44;
import '../returns/request_return/return_details_summary_page.dart' as _i45;
import '../returns/request_return/return_request_success.dart' as _i46;
import '../returns/return_list/return_by_item_page.dart' as _i74;
import '../returns/return_list/return_by_request_page.dart' as _i75;
import '../returns/return_list/return_root.dart' as _i37;
import '../returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i61;
import '../returns/return_summary_request_details/return_request_details.dart'
    as _i64;
import '../returns/user_restriction_list.dart' as _i17;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i81.RootStackRouter {
  AppRouter([_i82.GlobalKey<_i82.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i81.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SettingsPage(),
      );
    },
    PaymentConfigurationPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentConfigurationPage(),
      );
    },
    PaymentMethodsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.PaymentMethodsPage(),
      );
    },
    EditPaymentMethodsPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditPaymentMethodsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EditPaymentMethodsPage(
          key: args.key,
          salesOrg: args.salesOrg,
          oldPaymentMethod: args.oldPaymentMethod,
        ),
      );
    },
    AddPaymentMethodsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.AddPaymentMethodsPage(),
      );
    },
    BankBeneficiaryPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.BankBeneficiaryPage(),
      );
    },
    AddBeneficiaryPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.AddBeneficiaryPage(),
      );
    },
    DeductionCodeListPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.DeductionCodeListPage(),
      );
    },
    AddDeductionCodePageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.AddDeductionCodePage(),
      );
    },
    EditBeneficiaryPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.EditBeneficiaryPage(),
      );
    },
    EditDeductionCodePageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.EditDeductionCodePage(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i81.MaterialPageX<dynamic>(
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
      return _i81.MaterialPageX<dynamic>(
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
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.CustomerSearchPage(),
      );
    },
    AupTCDialogRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.AupTCDialog(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.CartPage(),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      return _i81.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i30.ProductSuggestionPage(),
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.PaymentPage(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryPageRouteArgs>(
          orElse: () => const PaymentSummaryPageRouteArgs());
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.PaymentSummaryPage(key: args.key),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.AccountSummary(),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.HomeNavigationTabbar(key: args.key),
      );
    },
    BonusAddPageRoute.name: (routeData) {
      final args = routeData.argsAs<BonusAddPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.BonusAddPage(
          key: args.key,
          cartItem: args.cartItem,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.ReturnRoot(),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryDetailsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i38.PaymentSummaryDetailsPage(
          key: args.key,
          paymentSummaryDetails: args.paymentSummaryDetails,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.ScanMaterialInfo(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i40.InvoiceDetailsPage(
          key: args.key,
          invoiceItem: args.invoiceItem,
        ),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.CreditDetailsPage(
          key: args.key,
          creditItem: args.creditItem,
        ),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.NewPaymentPage(),
      );
    },
    BundleItemDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleItemDetailPageRouteArgs>();
      return _i81.CustomPage<dynamic>(
        routeData: routeData,
        child: _i43.BundleItemDetailPage(
          key: args.key,
          bundleAggregate: args.bundleAggregate,
        ),
        fullscreenDialog: true,
        transitionsBuilder: _i81.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    RequestReturnDetailsRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i44.RequestReturnDetails(),
      );
    },
    RequestReturnDetailsSummaryPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.RequestReturnDetailsSummaryPage(),
      );
    },
    ReturnRequestSuccessPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.ReturnRequestSuccessPage(),
      );
    },
    AddToCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddToCartRouteArgs>();
      return _i81.CustomPage<dynamic>(
        routeData: routeData,
        child: _i81.WrappedRoute(
            child: _i47.AddToCart(
          key: args.key,
          isCovid19Tab: args.isCovid19Tab,
          material: args.material,
          isShortcutAccess: args.isShortcutAccess,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i81.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdateCartRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCartRouteArgs>();
      return _i81.CustomPage<dynamic>(
        routeData: routeData,
        child: _i81.WrappedRoute(
            child: _i48.UpdateCart(
          key: args.key,
          material: args.material,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i81.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i49.AdminPoAttachmentPage(key: args.key),
      );
    },
    SalesDistrictPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i50.SalesDistrictPage(),
      );
    },
    AddSalesDistrictPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.AddSalesDistrictPage(),
      );
    },
    EditSalesDistrictPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i52.EditSalesDistrictPage(),
      );
    },
    PaymentAdviceFooterPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.PaymentAdviceFooterPage(),
      );
    },
    AddPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.AddPaymentAdviceFooterPage(),
      );
    },
    EditPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.EditPaymentAdviceFooterPage(),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i56.IntroPage(),
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByItemDetailsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i57.ViewByItemDetailsPage(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
        ),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByOrderDetailsPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i58.ViewByOrderDetailsPage(
          key: args.key,
          viewByOrderHistoryItem: args.viewByOrderHistoryItem,
        ),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i59.BundleDetailPage(),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i60.ProductDetailsPage(),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      final args =
          routeData.argsAs<ReturnRequestSummaryByItemDetailsRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i61.ReturnRequestSummaryByItemDetails(
          key: args.key,
          returnItem: args.returnItem,
        ),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i62.AnnouncementsPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i63.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnRequestDetailsRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i64.ReturnRequestDetails(
          key: args.key,
          returnItem: args.returnItem,
        ),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.AllInvoicesPage(),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.AllCreditsPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i72.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByOrdersPageRouteArgs>();
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i73.ViewByOrdersPage(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
        ),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i76.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i77.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i78.PaymentMethodTab(),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i79.ArticlesTab(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i81.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i80.AnnouncementsTab(),
      );
    },
  };

  @override
  List<_i81.RouteConfig> get routes => [
        _i81.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i81.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i81.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i81.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i81.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i81.RouteConfig(
          SettingsPageRoute.name,
          path: 'settings',
        ),
        _i81.RouteConfig(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        ),
        _i81.RouteConfig(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        ),
        _i81.RouteConfig(
          EditPaymentMethodsPageRoute.name,
          path: 'edit_payment_methods',
        ),
        _i81.RouteConfig(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        ),
        _i81.RouteConfig(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        ),
        _i81.RouteConfig(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        ),
        _i81.RouteConfig(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        ),
        _i81.RouteConfig(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        ),
        _i81.RouteConfig(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        ),
        _i81.RouteConfig(
          EditDeductionCodePageRoute.name,
          path: 'payments/edit_deduction_code',
        ),
        _i81.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i81.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i81.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i81.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i81.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i81.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i81.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i81.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i81.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i81.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i81.RouteConfig(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        ),
        _i81.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i81.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i81.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i81.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i81.RouteConfig(
          PaymentPageRoute.name,
          path: 'payments',
        ),
        _i81.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i81.RouteConfig(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          children: [
            _i81.RouteConfig(
              AllInvoicesPageRoute.name,
              path: 'all_invoices',
              parent: AccountSummaryRoute.name,
            ),
            _i81.RouteConfig(
              AllCreditsPageRoute.name,
              path: 'all_credits',
              parent: AccountSummaryRoute.name,
            ),
          ],
        ),
        _i81.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i81.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i81.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i81.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i81.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i81.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i81.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i81.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i81.RouteConfig(
          BonusAddPageRoute.name,
          path: 'orders/add_bonus',
        ),
        _i81.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i81.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i81.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i81.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i81.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i81.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i81.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i81.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i81.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i81.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i81.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i81.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i81.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i81.RouteConfig(
          BundleItemDetailPageRoute.name,
          path: 'orders/bundle_item_detail',
        ),
        _i81.RouteConfig(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        ),
        _i81.RouteConfig(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        ),
        _i81.RouteConfig(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        ),
        _i81.RouteConfig(
          AddToCartRoute.name,
          path: 'orders/add_to_cart',
        ),
        _i81.RouteConfig(
          UpdateCartRoute.name,
          path: 'orders/update_cart',
        ),
        _i81.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i81.RouteConfig(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        ),
        _i81.RouteConfig(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        ),
        _i81.RouteConfig(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        ),
        _i81.RouteConfig(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        ),
        _i81.RouteConfig(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        ),
        _i81.RouteConfig(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        ),
        _i81.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i81.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i81.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i81.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i81.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
        _i81.RouteConfig(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        ),
        _i81.RouteConfig(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          children: [
            _i81.RouteConfig(
              ArticlesTabRoute.name,
              path: 'articles_tab',
              parent: AnnouncementsPageRoute.name,
            ),
            _i81.RouteConfig(
              AnnouncementsTabRoute.name,
              path: 'announcements_tab',
              parent: AnnouncementsPageRoute.name,
            ),
          ],
        ),
        _i81.RouteConfig(
          ArticleDetailsRoute.name,
          path: 'article_details',
        ),
        _i81.RouteConfig(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i81.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i81.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i81.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i81.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute()
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsPageRoute extends _i81.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(
          SettingsPageRoute.name,
          path: 'settings',
        );

  static const String name = 'SettingsPageRoute';
}

/// generated route for
/// [_i6.PaymentConfigurationPage]
class PaymentConfigurationPageRoute extends _i81.PageRouteInfo<void> {
  const PaymentConfigurationPageRoute()
      : super(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        );

  static const String name = 'PaymentConfigurationPageRoute';
}

/// generated route for
/// [_i7.PaymentMethodsPage]
class PaymentMethodsPageRoute extends _i81.PageRouteInfo<void> {
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
    extends _i81.PageRouteInfo<EditPaymentMethodsPageRouteArgs> {
  EditPaymentMethodsPageRoute({
    _i82.Key? key,
    required _i83.SalesOrg salesOrg,
    required _i83.PaymentMethod oldPaymentMethod,
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

  final _i82.Key? key;

  final _i83.SalesOrg salesOrg;

  final _i83.PaymentMethod oldPaymentMethod;

  @override
  String toString() {
    return 'EditPaymentMethodsPageRouteArgs{key: $key, salesOrg: $salesOrg, oldPaymentMethod: $oldPaymentMethod}';
  }
}

/// generated route for
/// [_i9.AddPaymentMethodsPage]
class AddPaymentMethodsPageRoute extends _i81.PageRouteInfo<void> {
  const AddPaymentMethodsPageRoute()
      : super(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        );

  static const String name = 'AddPaymentMethodsPageRoute';
}

/// generated route for
/// [_i10.BankBeneficiaryPage]
class BankBeneficiaryPageRoute extends _i81.PageRouteInfo<void> {
  const BankBeneficiaryPageRoute()
      : super(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        );

  static const String name = 'BankBeneficiaryPageRoute';
}

/// generated route for
/// [_i11.AddBeneficiaryPage]
class AddBeneficiaryPageRoute extends _i81.PageRouteInfo<void> {
  const AddBeneficiaryPageRoute()
      : super(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        );

  static const String name = 'AddBeneficiaryPageRoute';
}

/// generated route for
/// [_i12.DeductionCodeListPage]
class DeductionCodeListPageRoute extends _i81.PageRouteInfo<void> {
  const DeductionCodeListPageRoute()
      : super(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        );

  static const String name = 'DeductionCodeListPageRoute';
}

/// generated route for
/// [_i13.AddDeductionCodePage]
class AddDeductionCodePageRoute extends _i81.PageRouteInfo<void> {
  const AddDeductionCodePageRoute()
      : super(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        );

  static const String name = 'AddDeductionCodePageRoute';
}

/// generated route for
/// [_i14.EditBeneficiaryPage]
class EditBeneficiaryPageRoute extends _i81.PageRouteInfo<void> {
  const EditBeneficiaryPageRoute()
      : super(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        );

  static const String name = 'EditBeneficiaryPageRoute';
}

/// generated route for
/// [_i15.EditDeductionCodePage]
class EditDeductionCodePageRoute extends _i81.PageRouteInfo<void> {
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
    extends _i81.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i82.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i82.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i17.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i81.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i18.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i81.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i19.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i81.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i20.WebViewPage]
class WebViewPageRoute extends _i81.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

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
    extends _i81.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

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
class ChangePasswordPageRoute extends _i81.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i23.ContactUsPage]
class ContactUsPageRoute extends _i81.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i24.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i81.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i25.CustomerSearchPage]
class CustomerSearchPageRoute extends _i81.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i26.AupTCDialog]
class AupTCDialogRoute extends _i81.PageRouteInfo<void> {
  const AupTCDialogRoute()
      : super(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        );

  static const String name = 'AupTCDialogRoute';
}

/// generated route for
/// [_i27.CartPage]
class CartPageRoute extends _i81.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i28.CheckoutPage]
class CheckoutPageRoute extends _i81.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i29.OrderSuccessPage]
class OrderSuccessPageRoute extends _i81.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i30.ProductSuggestionPage]
class ProductSuggestionPageRoute extends _i81.PageRouteInfo<void> {
  const ProductSuggestionPageRoute()
      : super(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        );

  static const String name = 'ProductSuggestionPageRoute';
}

/// generated route for
/// [_i31.PaymentPage]
class PaymentPageRoute extends _i81.PageRouteInfo<void> {
  const PaymentPageRoute()
      : super(
          PaymentPageRoute.name,
          path: 'payments',
        );

  static const String name = 'PaymentPageRoute';
}

/// generated route for
/// [_i32.PaymentSummaryPage]
class PaymentSummaryPageRoute
    extends _i81.PageRouteInfo<PaymentSummaryPageRouteArgs> {
  PaymentSummaryPageRoute({_i82.Key? key})
      : super(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
          args: PaymentSummaryPageRouteArgs(key: key),
        );

  static const String name = 'PaymentSummaryPageRoute';
}

class PaymentSummaryPageRouteArgs {
  const PaymentSummaryPageRouteArgs({this.key});

  final _i82.Key? key;

  @override
  String toString() {
    return 'PaymentSummaryPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i33.AccountSummary]
class AccountSummaryRoute extends _i81.PageRouteInfo<void> {
  const AccountSummaryRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          initialChildren: children,
        );

  static const String name = 'AccountSummaryRoute';
}

/// generated route for
/// [_i34.HomeNavigationTabbar]
class HomeNavigationTabbarRoute
    extends _i81.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i82.Key? key,
    List<_i81.PageRouteInfo>? children,
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

  final _i82.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.BonusAddPage]
class BonusAddPageRoute extends _i81.PageRouteInfo<BonusAddPageRouteArgs> {
  BonusAddPageRoute({
    _i82.Key? key,
    required _i84.CartItem cartItem,
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

  final _i82.Key? key;

  final _i84.CartItem cartItem;

  @override
  String toString() {
    return 'BonusAddPageRouteArgs{key: $key, cartItem: $cartItem}';
  }
}

/// generated route for
/// [_i36.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i81.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i37.ReturnRoot]
class ReturnRootRoute extends _i81.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i81.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i38.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute
    extends _i81.PageRouteInfo<PaymentSummaryDetailsPageRouteArgs> {
  PaymentSummaryDetailsPageRoute({
    _i82.Key? key,
    required _i85.PaymentSummaryDetails paymentSummaryDetails,
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

  final _i82.Key? key;

  final _i85.PaymentSummaryDetails paymentSummaryDetails;

  @override
  String toString() {
    return 'PaymentSummaryDetailsPageRouteArgs{key: $key, paymentSummaryDetails: $paymentSummaryDetails}';
  }
}

/// generated route for
/// [_i39.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i81.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i40.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i81.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i86.CreditAndInvoiceItem invoiceItem;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, invoiceItem: $invoiceItem}';
  }
}

/// generated route for
/// [_i41.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i81.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i86.CreditAndInvoiceItem creditItem;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, creditItem: $creditItem}';
  }
}

/// generated route for
/// [_i42.NewPaymentPage]
class NewPaymentPageRoute extends _i81.PageRouteInfo<void> {
  const NewPaymentPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';
}

/// generated route for
/// [_i43.BundleItemDetailPage]
class BundleItemDetailPageRoute
    extends _i81.PageRouteInfo<BundleItemDetailPageRouteArgs> {
  BundleItemDetailPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i87.BundleAggregate bundleAggregate;

  @override
  String toString() {
    return 'BundleItemDetailPageRouteArgs{key: $key, bundleAggregate: $bundleAggregate}';
  }
}

/// generated route for
/// [_i44.RequestReturnDetails]
class RequestReturnDetailsRoute extends _i81.PageRouteInfo<void> {
  const RequestReturnDetailsRoute()
      : super(
          RequestReturnDetailsRoute.name,
          path: 'request_return_details',
        );

  static const String name = 'RequestReturnDetailsRoute';
}

/// generated route for
/// [_i45.RequestReturnDetailsSummaryPage]
class RequestReturnDetailsSummaryPageRoute extends _i81.PageRouteInfo<void> {
  const RequestReturnDetailsSummaryPageRoute()
      : super(
          RequestReturnDetailsSummaryPageRoute.name,
          path: 'request_return_details_summary',
        );

  static const String name = 'RequestReturnDetailsSummaryPageRoute';
}

/// generated route for
/// [_i46.ReturnRequestSuccessPage]
class ReturnRequestSuccessPageRoute extends _i81.PageRouteInfo<void> {
  const ReturnRequestSuccessPageRoute()
      : super(
          ReturnRequestSuccessPageRoute.name,
          path: 'request_return_success',
        );

  static const String name = 'ReturnRequestSuccessPageRoute';
}

/// generated route for
/// [_i47.AddToCart]
class AddToCartRoute extends _i81.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final bool isCovid19Tab;

  final _i88.PriceAggregate material;

  final bool isShortcutAccess;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, isCovid19Tab: $isCovid19Tab, material: $material, isShortcutAccess: $isShortcutAccess}';
  }
}

/// generated route for
/// [_i48.UpdateCart]
class UpdateCartRoute extends _i81.PageRouteInfo<UpdateCartRouteArgs> {
  UpdateCartRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i88.PriceAggregate material;

  @override
  String toString() {
    return 'UpdateCartRouteArgs{key: $key, material: $material}';
  }
}

/// generated route for
/// [_i49.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i81.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i82.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i82.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i50.SalesDistrictPage]
class SalesDistrictPageRoute extends _i81.PageRouteInfo<void> {
  const SalesDistrictPageRoute()
      : super(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        );

  static const String name = 'SalesDistrictPageRoute';
}

/// generated route for
/// [_i51.AddSalesDistrictPage]
class AddSalesDistrictPageRoute extends _i81.PageRouteInfo<void> {
  const AddSalesDistrictPageRoute()
      : super(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        );

  static const String name = 'AddSalesDistrictPageRoute';
}

/// generated route for
/// [_i52.EditSalesDistrictPage]
class EditSalesDistrictPageRoute extends _i81.PageRouteInfo<void> {
  const EditSalesDistrictPageRoute()
      : super(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        );

  static const String name = 'EditSalesDistrictPageRoute';
}

/// generated route for
/// [_i53.PaymentAdviceFooterPage]
class PaymentAdviceFooterPageRoute extends _i81.PageRouteInfo<void> {
  const PaymentAdviceFooterPageRoute()
      : super(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        );

  static const String name = 'PaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i54.AddPaymentAdviceFooterPage]
class AddPaymentAdviceFooterPageRoute extends _i81.PageRouteInfo<void> {
  const AddPaymentAdviceFooterPageRoute()
      : super(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        );

  static const String name = 'AddPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i55.EditPaymentAdviceFooterPage]
class EditPaymentAdviceFooterPageRoute extends _i81.PageRouteInfo<void> {
  const EditPaymentAdviceFooterPageRoute()
      : super(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        );

  static const String name = 'EditPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i56.IntroPage]
class IntroPageRoute extends _i81.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i57.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute
    extends _i81.PageRouteInfo<ViewByItemDetailsPageRouteArgs> {
  ViewByItemDetailsPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i89.OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'ViewByItemDetailsPageRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem}';
  }
}

/// generated route for
/// [_i58.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute
    extends _i81.PageRouteInfo<ViewByOrderDetailsPageRouteArgs> {
  ViewByOrderDetailsPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i90.OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  @override
  String toString() {
    return 'ViewByOrderDetailsPageRouteArgs{key: $key, viewByOrderHistoryItem: $viewByOrderHistoryItem}';
  }
}

/// generated route for
/// [_i59.BundleDetailPage]
class BundleDetailPageRoute extends _i81.PageRouteInfo<void> {
  const BundleDetailPageRoute()
      : super(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        );

  static const String name = 'BundleDetailPageRoute';
}

/// generated route for
/// [_i60.ProductDetailsPage]
class ProductDetailsPageRoute extends _i81.PageRouteInfo<void> {
  const ProductDetailsPageRoute()
      : super(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        );

  static const String name = 'ProductDetailsPageRoute';
}

/// generated route for
/// [_i61.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute
    extends _i81.PageRouteInfo<ReturnRequestSummaryByItemDetailsRouteArgs> {
  ReturnRequestSummaryByItemDetailsRoute({
    _i82.Key? key,
    required _i91.ReturnItem returnItem,
  }) : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
          args: ReturnRequestSummaryByItemDetailsRouteArgs(
            key: key,
            returnItem: returnItem,
          ),
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';
}

class ReturnRequestSummaryByItemDetailsRouteArgs {
  const ReturnRequestSummaryByItemDetailsRouteArgs({
    this.key,
    required this.returnItem,
  });

  final _i82.Key? key;

  final _i91.ReturnItem returnItem;

  @override
  String toString() {
    return 'ReturnRequestSummaryByItemDetailsRouteArgs{key: $key, returnItem: $returnItem}';
  }
}

/// generated route for
/// [_i62.AnnouncementsPage]
class AnnouncementsPageRoute extends _i81.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i81.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';
}

/// generated route for
/// [_i63.ArticleDetails]
class ArticleDetailsRoute extends _i81.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i82.Key? key,
    required _i92.AnnouncementArticleItem article,
  }) : super(
          ArticleDetailsRoute.name,
          path: 'article_details',
          args: ArticleDetailsRouteArgs(
            key: key,
            article: article,
          ),
        );

  static const String name = 'ArticleDetailsRoute';
}

class ArticleDetailsRouteArgs {
  const ArticleDetailsRouteArgs({
    this.key,
    required this.article,
  });

  final _i82.Key? key;

  final _i92.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i64.ReturnRequestDetails]
class ReturnRequestDetailsRoute
    extends _i81.PageRouteInfo<ReturnRequestDetailsRouteArgs> {
  ReturnRequestDetailsRoute({
    _i82.Key? key,
    required _i91.ReturnItem returnItem,
  }) : super(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
          args: ReturnRequestDetailsRouteArgs(
            key: key,
            returnItem: returnItem,
          ),
        );

  static const String name = 'ReturnRequestDetailsRoute';
}

class ReturnRequestDetailsRouteArgs {
  const ReturnRequestDetailsRouteArgs({
    this.key,
    required this.returnItem,
  });

  final _i82.Key? key;

  final _i91.ReturnItem returnItem;

  @override
  String toString() {
    return 'ReturnRequestDetailsRouteArgs{key: $key, returnItem: $returnItem}';
  }
}

/// generated route for
/// [_i65.AllInvoicesPage]
class AllInvoicesPageRoute extends _i81.PageRouteInfo<void> {
  const AllInvoicesPageRoute()
      : super(
          AllInvoicesPageRoute.name,
          path: 'all_invoices',
        );

  static const String name = 'AllInvoicesPageRoute';
}

/// generated route for
/// [_i66.AllCreditsPage]
class AllCreditsPageRoute extends _i81.PageRouteInfo<void> {
  const AllCreditsPageRoute()
      : super(
          AllCreditsPageRoute.name,
          path: 'all_credits',
        );

  static const String name = 'AllCreditsPageRoute';
}

/// generated route for
/// [_i67.HomeTab]
class HomeTabRoute extends _i81.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i68.ProductsTab]
class ProductsTabRoute extends _i81.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i69.OrdersTab]
class OrdersTabRoute extends _i81.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i81.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i70.MoreTab]
class MoreTabRoute extends _i81.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i71.NotificationTab]
class NotificationTabRoute extends _i81.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i72.ViewByItemsPage]
class ViewByItemsPageRoute extends _i81.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i73.ViewByOrdersPage]
class ViewByOrdersPageRoute
    extends _i81.PageRouteInfo<ViewByOrdersPageRouteArgs> {
  ViewByOrdersPageRoute({
    _i82.Key? key,
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

  final _i82.Key? key;

  final _i89.OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'ViewByOrdersPageRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem}';
  }
}

/// generated route for
/// [_i74.ReturnByItemPage]
class ReturnByItemPageRoute extends _i81.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i75.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i81.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i76.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i81.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i77.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i81.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i78.PaymentMethodTab]
class PaymentMethodTabRoute extends _i81.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}

/// generated route for
/// [_i79.ArticlesTab]
class ArticlesTabRoute extends _i81.PageRouteInfo<void> {
  const ArticlesTabRoute()
      : super(
          ArticlesTabRoute.name,
          path: 'articles_tab',
        );

  static const String name = 'ArticlesTabRoute';
}

/// generated route for
/// [_i80.AnnouncementsTab]
class AnnouncementsTabRoute extends _i81.PageRouteInfo<void> {
  const AnnouncementsTabRoute()
      : super(
          AnnouncementsTabRoute.name,
          path: 'announcements_tab',
        );

  static const String name = 'AnnouncementsTabRoute';
}
