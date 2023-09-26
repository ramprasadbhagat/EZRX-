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
import 'package:auto_route/auto_route.dart' as _i88;
import 'package:flutter/material.dart' as _i89;

import '../../domain/account/entities/sales_organisation.dart' as _i95;
import '../../domain/account/value/value_objects.dart' as _i90;
import '../../domain/announcement_info/entities/announcement_article_info.dart'
    as _i93;
import '../../domain/core/aggregate/price_aggregate.dart' as _i92;
import '../../domain/order/entities/order_history_item.dart' as _i96;
import '../../domain/payments/entities/credit_and_invoice_item.dart' as _i91;
import '../../domain/returns/entities/return_item.dart' as _i94;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i48;
import '../account/change_password/change_password_page.dart' as _i21;
import '../account/contact_us/contact_us_page.dart' as _i22;
import '../account/customer_search.dart' as _i24;
import '../account/notification_settings/notification_settings_page.dart'
    as _i23;
import '../account/payment_configuration/bank_benificiary/add_beneficiary_page.dart'
    as _i10;
import '../account/payment_configuration/bank_benificiary/bank_beneficiary_page.dart'
    as _i9;
import '../account/payment_configuration/bank_benificiary/edit_beneficiary_page.dart'
    as _i13;
import '../account/payment_configuration/deduction_code/add_deduction_code_page.dart'
    as _i12;
import '../account/payment_configuration/deduction_code/deduction_code_list_page.dart'
    as _i11;
import '../account/payment_configuration/deduction_code/edit_deduction_code_page.dart'
    as _i14;
import '../account/payment_configuration/payment_advice_footer/add_payment_advice_footer.dart'
    as _i53;
import '../account/payment_configuration/payment_advice_footer/edit_payment_advice_footer.dart'
    as _i54;
import '../account/payment_configuration/payment_advice_footer/payment_advice_footer_page.dart'
    as _i52;
import '../account/payment_configuration/payment_configuration_page.dart'
    as _i5;
import '../account/payment_configuration/payment_methods/add_payment_method_page.dart'
    as _i8;
import '../account/payment_configuration/payment_methods/edit_payment_method_page.dart'
    as _i7;
import '../account/payment_configuration/payment_methods/payment_methods_page.dart'
    as _i6;
import '../account/payment_configuration/sales_district/add_sales_district_page.dart'
    as _i50;
import '../account/payment_configuration/sales_district/edit_sales_district_page.dart'
    as _i51;
import '../account/payment_configuration/sales_district/sales_district_page.dart'
    as _i49;
import '../account/profile/profile_page.dart' as _i31;
import '../account/sales_org_search.dart' as _i64;
import '../aup_tc/aup_tc.dart' as _i25;
import '../auth/forgot_password/forgot_password_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../core/static_html_viewer.dart' as _i20;
import '../core/webview_page.dart' as _i19;
import '../faq/faq.dart' as _i65;
import '../home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart'
    as _i39;
import '../home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i84;
import '../home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i61;
import '../home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i62;
import '../home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i83;
import '../home/home_tab.dart' as _i71;
import '../home_tab.dart' as _i34;
import '../intro/intro_page.dart' as _i55;
import '../more/more_tab.dart' as _i74;
import '../more/section/about_us/about_us_page.dart' as _i68;
import '../notification/notification_tab.dart' as _i75;
import '../orders/cart/add_to_cart/add_to_cart.dart' as _i46;
import '../orders/cart/add_to_cart/update_cart.dart' as _i47;
import '../orders/cart/cart_page.dart' as _i26;
import '../orders/cart/checkout/checkout_page.dart' as _i27;
import '../orders/create_order/scan_material_info.dart' as _i38;
import '../orders/order_success/order_success_page.dart' as _i28;
import '../orders/order_tab/orders_tab.dart' as _i73;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i76;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i77;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i56;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i57;
import '../payments/account_summary/account_summary_page.dart' as _i33;
import '../payments/all_credits/all_credits.dart' as _i70;
import '../payments/all_invoices/all_invoices.dart' as _i69;
import '../payments/credit_details/credit_details.dart' as _i41;
import '../payments/invoice_details/invoice_details.dart' as _i40;
import '../payments/new_payment/new_payment.dart' as _i43;
import '../payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart'
    as _i81;
import '../payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart'
    as _i80;
import '../payments/new_payment/tabs/payment_method/payment_method_tab.dart'
    as _i82;
import '../payments/payment_advice_created/payment_advice_created_page.dart'
    as _i45;
import '../payments/payment_home/payment_page.dart' as _i30;
import '../payments/payment_summary/payment_summary_page.dart' as _i32;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i37;
import '../payments/payment_webview/payment_webview_page.dart' as _i42;
import '../payments/statement_accounts/statement_accounts.dart' as _i44;
import '../products/bundle_details/bundle_detail_page.dart' as _i58;
import '../products/product_details/product_details_page.dart' as _i59;
import '../products/product_suggestion/product_suggestion_page.dart' as _i29;
import '../products/products_tab.dart' as _i72;
import '../returns/add_edit_user_restrictions.dart' as _i35;
import '../returns/approver_actions/approver_actions.dart' as _i15;
import '../returns/new_request/new_request_page.dart' as _i66;
import '../returns/new_request/new_request_success/new_request_successful_page.dart'
    as _i67;
import '../returns/new_request/tabs/return_details_tab/return_details_tab.dart'
    as _i86;
import '../returns/new_request/tabs/return_items_tab/return_items_tab.dart'
    as _i85;
import '../returns/new_request/tabs/return_review_tab/return_review_tab.dart'
    as _i87;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i18;
import '../returns/policy_configuration/policy_configuration.dart' as _i17;
import '../returns/return_list/return_by_item_page.dart' as _i78;
import '../returns/return_list/return_by_request_page.dart' as _i79;
import '../returns/return_list/return_root/return_root.dart' as _i36;
import '../returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i60;
import '../returns/return_summary_request_details/return_request_details.dart'
    as _i63;
import '../returns/user_restriction_list.dart' as _i16;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i88.RootStackRouter {
  AppRouter([_i89.GlobalKey<_i89.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i88.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    PaymentConfigurationPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PaymentConfigurationPage(),
      );
    },
    PaymentMethodsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.PaymentMethodsPage(),
      );
    },
    EditPaymentMethodsPageRoute.name: (routeData) {
      final args = routeData.argsAs<EditPaymentMethodsPageRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.EditPaymentMethodsPage(
          key: args.key,
          salesOrg: args.salesOrg,
          oldPaymentMethod: args.oldPaymentMethod,
        ),
      );
    },
    AddPaymentMethodsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.AddPaymentMethodsPage(),
      );
    },
    BankBeneficiaryPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.BankBeneficiaryPage(),
      );
    },
    AddBeneficiaryPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddBeneficiaryPage(),
      );
    },
    DeductionCodeListPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.DeductionCodeListPage(),
      );
    },
    AddDeductionCodePageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.AddDeductionCodePage(),
      );
    },
    EditBeneficiaryPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.EditBeneficiaryPage(),
      );
    },
    EditDeductionCodePageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.EditDeductionCodePage(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
          titleText: args.titleText,
        ),
      );
    },
    StaticHtmlViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StaticHtmlViewerRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.StaticHtmlViewer(
          key: args.key,
          title: args.title,
          htmlPath: args.htmlPath,
          styleCss: args.styleCss,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.ContactUsPage(),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.CustomerSearchPage(),
      );
    },
    AupTCDialogRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.AupTCDialog(),
      );
    },
    CartPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.CartPage(),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      return _i88.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i29.ProductSuggestionPage(),
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.PaymentPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.ProfilePage(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.PaymentSummaryPage(),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.AccountSummary(),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationTabbarRouteArgs>(
          orElse: () => const HomeNavigationTabbarRouteArgs());
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.HomeNavigationTabbar(key: args.key),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.ReturnRoot(),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.PaymentSummaryDetailsPage(),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i38.ScanMaterialInfo(),
      );
    },
    AnnouncementInfoDetailsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.AnnouncementInfoDetailsPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i40.InvoiceDetailsPage(
          key: args.key,
          invoiceItem: args.invoiceItem,
        ),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.CreditDetailsPage(
          key: args.key,
          creditItem: args.creditItem,
        ),
      );
    },
    PaymentWebviewPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.PaymentWebviewPage(),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i43.NewPaymentPage(),
      );
    },
    StatementAccountsPageRoute.name: (routeData) {
      final args = routeData.argsAs<StatementAccountsPageRouteArgs>(
          orElse: () => const StatementAccountsPageRouteArgs());
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i44.StatementAccountsPage(key: args.key),
      );
    },
    PaymentAdviceCreatedPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.PaymentAdviceCreatedPage(),
      );
    },
    AddToCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddToCartRouteArgs>();
      return _i88.CustomPage<dynamic>(
        routeData: routeData,
        child: _i88.WrappedRoute(
            child: _i46.AddToCart(
          key: args.key,
          isCovid19Tab: args.isCovid19Tab,
          material: args.material,
          isShortcutAccess: args.isShortcutAccess,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i88.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    UpdateCartRoute.name: (routeData) {
      final args = routeData.argsAs<UpdateCartRouteArgs>();
      return _i88.CustomPage<dynamic>(
        routeData: routeData,
        child: _i88.WrappedRoute(
            child: _i47.UpdateCart(
          key: args.key,
          material: args.material,
        )),
        fullscreenDialog: true,
        transitionsBuilder: _i88.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i48.AdminPoAttachmentPage(key: args.key),
      );
    },
    SalesDistrictPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i49.SalesDistrictPage(),
      );
    },
    AddSalesDistrictPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i50.AddSalesDistrictPage(),
      );
    },
    EditSalesDistrictPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.EditSalesDistrictPage(),
      );
    },
    PaymentAdviceFooterPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i52.PaymentAdviceFooterPage(),
      );
    },
    AddPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.AddPaymentAdviceFooterPage(),
      );
    },
    EditPaymentAdviceFooterPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.EditPaymentAdviceFooterPage(),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.IntroPage(),
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i56.ViewByItemDetailsPage(),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i57.ViewByOrderDetailsPage(),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i58.BundleDetailPage(),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i59.ProductDetailsPage(),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i60.ReturnRequestSummaryByItemDetails(),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i61.AnnouncementsPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i62.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ReturnRequestDetailsRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i63.ReturnRequestDetails(
          key: args.key,
          returnItem: args.returnItem,
        ),
      );
    },
    SalesOrgSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SalesOrgSearchRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i64.SalesOrgSearch(
          key: args.key,
          avialableSalesOrgList: args.avialableSalesOrgList,
        ),
      );
    },
    FAQPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.FAQPage(),
      );
    },
    NewRequestPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.NewRequestPage(),
      );
    },
    NewRequestSuccessfulPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.NewRequestSuccessfulPage(),
      );
    },
    AboutUsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.AboutUsPage(),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.AllInvoicesPage(),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.AllCreditsPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i72.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i73.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i76.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      final args = routeData.argsAs<ViewByOrdersPageRouteArgs>();
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i77.ViewByOrdersPage(
          key: args.key,
          orderHistoryItem: args.orderHistoryItem,
        ),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i78.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i79.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i80.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i81.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i82.PaymentMethodTab(),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i83.ArticlesTab(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i84.AnnouncementsTab(),
      );
    },
    ReturnItemsTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i85.ReturnItemsTab(),
      );
    },
    ReturnDetailsTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i86.ReturnDetailsTab(),
      );
    },
    ReturnReviewTabRoute.name: (routeData) {
      return _i88.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i87.ReturnReviewTab(),
      );
    },
  };

  @override
  List<_i88.RouteConfig> get routes => [
        _i88.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i88.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i88.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i88.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i88.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i88.RouteConfig(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        ),
        _i88.RouteConfig(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        ),
        _i88.RouteConfig(
          EditPaymentMethodsPageRoute.name,
          path: 'edit_payment_methods',
        ),
        _i88.RouteConfig(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        ),
        _i88.RouteConfig(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        ),
        _i88.RouteConfig(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        ),
        _i88.RouteConfig(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        ),
        _i88.RouteConfig(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        ),
        _i88.RouteConfig(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        ),
        _i88.RouteConfig(
          EditDeductionCodePageRoute.name,
          path: 'payments/edit_deduction_code',
        ),
        _i88.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i88.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i88.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i88.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i88.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i88.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i88.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i88.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i88.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i88.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i88.RouteConfig(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        ),
        _i88.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i88.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i88.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i88.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i88.RouteConfig(
          PaymentPageRoute.name,
          path: 'payments',
        ),
        _i88.RouteConfig(
          ProfilePageRoute.name,
          path: 'profile',
        ),
        _i88.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i88.RouteConfig(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          children: [
            _i88.RouteConfig(
              AllInvoicesPageRoute.name,
              path: 'all_invoices',
              parent: AccountSummaryRoute.name,
            ),
            _i88.RouteConfig(
              AllCreditsPageRoute.name,
              path: 'all_credits',
              parent: AccountSummaryRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i88.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i88.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i88.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i88.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i88.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i88.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i88.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i88.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i88.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i88.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i88.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i88.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i88.RouteConfig(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        ),
        _i88.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i88.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i88.RouteConfig(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        ),
        _i88.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i88.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i88.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i88.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
        ),
        _i88.RouteConfig(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        ),
        _i88.RouteConfig(
          AddToCartRoute.name,
          path: 'orders/add_to_cart',
        ),
        _i88.RouteConfig(
          UpdateCartRoute.name,
          path: 'orders/update_cart',
        ),
        _i88.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i88.RouteConfig(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        ),
        _i88.RouteConfig(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        ),
        _i88.RouteConfig(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        ),
        _i88.RouteConfig(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        ),
        _i88.RouteConfig(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        ),
        _i88.RouteConfig(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        ),
        _i88.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i88.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i88.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i88.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i88.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
        _i88.RouteConfig(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        ),
        _i88.RouteConfig(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          children: [
            _i88.RouteConfig(
              ArticlesTabRoute.name,
              path: 'articles_tab',
              parent: AnnouncementsPageRoute.name,
            ),
            _i88.RouteConfig(
              AnnouncementsTabRoute.name,
              path: 'announcements_tab',
              parent: AnnouncementsPageRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          ArticleDetailsRoute.name,
          path: 'article_details',
        ),
        _i88.RouteConfig(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        ),
        _i88.RouteConfig(
          SalesOrgSearchRoute.name,
          path: 'salesOrg_search',
        ),
        _i88.RouteConfig(
          FAQPageRoute.name,
          path: 'faq_page',
        ),
        _i88.RouteConfig(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          children: [
            _i88.RouteConfig(
              ReturnItemsTabRoute.name,
              path: 'returns/new_request/return_items',
              parent: NewRequestPageRoute.name,
            ),
            _i88.RouteConfig(
              ReturnDetailsTabRoute.name,
              path: 'returns/new_request/return_details',
              parent: NewRequestPageRoute.name,
            ),
            _i88.RouteConfig(
              ReturnReviewTabRoute.name,
              path: 'returns/new_request/return_review',
              parent: NewRequestPageRoute.name,
            ),
          ],
        ),
        _i88.RouteConfig(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        ),
        _i88.RouteConfig(
          AboutUsPageRoute.name,
          path: 'about_us',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i88.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i88.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i88.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i88.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute()
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';
}

/// generated route for
/// [_i5.PaymentConfigurationPage]
class PaymentConfigurationPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentConfigurationPageRoute()
      : super(
          PaymentConfigurationPageRoute.name,
          path: 'payment_configuration',
        );

  static const String name = 'PaymentConfigurationPageRoute';
}

/// generated route for
/// [_i6.PaymentMethodsPage]
class PaymentMethodsPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentMethodsPageRoute()
      : super(
          PaymentMethodsPageRoute.name,
          path: 'payment_methods',
        );

  static const String name = 'PaymentMethodsPageRoute';
}

/// generated route for
/// [_i7.EditPaymentMethodsPage]
class EditPaymentMethodsPageRoute
    extends _i88.PageRouteInfo<EditPaymentMethodsPageRouteArgs> {
  EditPaymentMethodsPageRoute({
    _i89.Key? key,
    required _i90.SalesOrg salesOrg,
    required _i90.PaymentMethod oldPaymentMethod,
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

  final _i89.Key? key;

  final _i90.SalesOrg salesOrg;

  final _i90.PaymentMethod oldPaymentMethod;

  @override
  String toString() {
    return 'EditPaymentMethodsPageRouteArgs{key: $key, salesOrg: $salesOrg, oldPaymentMethod: $oldPaymentMethod}';
  }
}

/// generated route for
/// [_i8.AddPaymentMethodsPage]
class AddPaymentMethodsPageRoute extends _i88.PageRouteInfo<void> {
  const AddPaymentMethodsPageRoute()
      : super(
          AddPaymentMethodsPageRoute.name,
          path: 'add_payment_methods',
        );

  static const String name = 'AddPaymentMethodsPageRoute';
}

/// generated route for
/// [_i9.BankBeneficiaryPage]
class BankBeneficiaryPageRoute extends _i88.PageRouteInfo<void> {
  const BankBeneficiaryPageRoute()
      : super(
          BankBeneficiaryPageRoute.name,
          path: 'payments/bank_beneficiary',
        );

  static const String name = 'BankBeneficiaryPageRoute';
}

/// generated route for
/// [_i10.AddBeneficiaryPage]
class AddBeneficiaryPageRoute extends _i88.PageRouteInfo<void> {
  const AddBeneficiaryPageRoute()
      : super(
          AddBeneficiaryPageRoute.name,
          path: 'payments/add_beneficiary',
        );

  static const String name = 'AddBeneficiaryPageRoute';
}

/// generated route for
/// [_i11.DeductionCodeListPage]
class DeductionCodeListPageRoute extends _i88.PageRouteInfo<void> {
  const DeductionCodeListPageRoute()
      : super(
          DeductionCodeListPageRoute.name,
          path: 'payments/deduction_code',
        );

  static const String name = 'DeductionCodeListPageRoute';
}

/// generated route for
/// [_i12.AddDeductionCodePage]
class AddDeductionCodePageRoute extends _i88.PageRouteInfo<void> {
  const AddDeductionCodePageRoute()
      : super(
          AddDeductionCodePageRoute.name,
          path: 'payments/add_deduction_code',
        );

  static const String name = 'AddDeductionCodePageRoute';
}

/// generated route for
/// [_i13.EditBeneficiaryPage]
class EditBeneficiaryPageRoute extends _i88.PageRouteInfo<void> {
  const EditBeneficiaryPageRoute()
      : super(
          EditBeneficiaryPageRoute.name,
          path: 'payments/edit_beneficiary',
        );

  static const String name = 'EditBeneficiaryPageRoute';
}

/// generated route for
/// [_i14.EditDeductionCodePage]
class EditDeductionCodePageRoute extends _i88.PageRouteInfo<void> {
  const EditDeductionCodePageRoute()
      : super(
          EditDeductionCodePageRoute.name,
          path: 'payments/edit_deduction_code',
        );

  static const String name = 'EditDeductionCodePageRoute';
}

/// generated route for
/// [_i15.ApproverActions]
class ApproverActionsRoute
    extends _i88.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i89.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i89.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i16.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i88.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i17.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i88.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i18.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i88.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i19.WebViewPage]
class WebViewPageRoute extends _i88.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i89.Key? key,
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

  final _i89.Key? key;

  final String url;

  final String? initialFile;

  final String titleText;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile, titleText: $titleText}';
  }
}

/// generated route for
/// [_i20.StaticHtmlViewer]
class StaticHtmlViewerRoute
    extends _i88.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i89.Key? key,
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

  final _i89.Key? key;

  final String title;

  final String htmlPath;

  final String styleCss;

  @override
  String toString() {
    return 'StaticHtmlViewerRouteArgs{key: $key, title: $title, htmlPath: $htmlPath, styleCss: $styleCss}';
  }
}

/// generated route for
/// [_i21.ChangePasswordPage]
class ChangePasswordPageRoute extends _i88.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i22.ContactUsPage]
class ContactUsPageRoute extends _i88.PageRouteInfo<void> {
  const ContactUsPageRoute()
      : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
        );

  static const String name = 'ContactUsPageRoute';
}

/// generated route for
/// [_i23.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i88.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i24.CustomerSearchPage]
class CustomerSearchPageRoute extends _i88.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i25.AupTCDialog]
class AupTCDialogRoute extends _i88.PageRouteInfo<void> {
  const AupTCDialogRoute()
      : super(
          AupTCDialogRoute.name,
          path: 'terms_of_service',
        );

  static const String name = 'AupTCDialogRoute';
}

/// generated route for
/// [_i26.CartPage]
class CartPageRoute extends _i88.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i27.CheckoutPage]
class CheckoutPageRoute extends _i88.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i28.OrderSuccessPage]
class OrderSuccessPageRoute extends _i88.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i29.ProductSuggestionPage]
class ProductSuggestionPageRoute extends _i88.PageRouteInfo<void> {
  const ProductSuggestionPageRoute()
      : super(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        );

  static const String name = 'ProductSuggestionPageRoute';
}

/// generated route for
/// [_i30.PaymentPage]
class PaymentPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentPageRoute()
      : super(
          PaymentPageRoute.name,
          path: 'payments',
        );

  static const String name = 'PaymentPageRoute';
}

/// generated route for
/// [_i31.ProfilePage]
class ProfilePageRoute extends _i88.PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [_i32.PaymentSummaryPage]
class PaymentSummaryPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentSummaryPageRoute()
      : super(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        );

  static const String name = 'PaymentSummaryPageRoute';
}

/// generated route for
/// [_i33.AccountSummary]
class AccountSummaryRoute extends _i88.PageRouteInfo<void> {
  const AccountSummaryRoute({List<_i88.PageRouteInfo>? children})
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
    extends _i88.PageRouteInfo<HomeNavigationTabbarRouteArgs> {
  HomeNavigationTabbarRoute({
    _i89.Key? key,
    List<_i88.PageRouteInfo>? children,
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

  final _i89.Key? key;

  @override
  String toString() {
    return 'HomeNavigationTabbarRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i35.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i88.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i89.Key? key,
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

  final _i89.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i36.ReturnRoot]
class ReturnRootRoute extends _i88.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i88.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i37.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentSummaryDetailsPageRoute()
      : super(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        );

  static const String name = 'PaymentSummaryDetailsPageRoute';
}

/// generated route for
/// [_i38.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i88.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i39.AnnouncementInfoDetailsPage]
class AnnouncementInfoDetailsPageRoute extends _i88.PageRouteInfo<void> {
  const AnnouncementInfoDetailsPageRoute()
      : super(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        );

  static const String name = 'AnnouncementInfoDetailsPageRoute';
}

/// generated route for
/// [_i40.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i88.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i89.Key? key,
    required _i91.CreditAndInvoiceItem invoiceItem,
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

  final _i89.Key? key;

  final _i91.CreditAndInvoiceItem invoiceItem;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, invoiceItem: $invoiceItem}';
  }
}

/// generated route for
/// [_i41.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i88.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i89.Key? key,
    required _i91.CreditAndInvoiceItem creditItem,
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

  final _i89.Key? key;

  final _i91.CreditAndInvoiceItem creditItem;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, creditItem: $creditItem}';
  }
}

/// generated route for
/// [_i42.PaymentWebviewPage]
class PaymentWebviewPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentWebviewPageRoute()
      : super(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        );

  static const String name = 'PaymentWebviewPageRoute';
}

/// generated route for
/// [_i43.NewPaymentPage]
class NewPaymentPageRoute extends _i88.PageRouteInfo<void> {
  const NewPaymentPageRoute({List<_i88.PageRouteInfo>? children})
      : super(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';
}

/// generated route for
/// [_i44.StatementAccountsPage]
class StatementAccountsPageRoute
    extends _i88.PageRouteInfo<StatementAccountsPageRouteArgs> {
  StatementAccountsPageRoute({_i89.Key? key})
      : super(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
          args: StatementAccountsPageRouteArgs(key: key),
        );

  static const String name = 'StatementAccountsPageRoute';
}

class StatementAccountsPageRouteArgs {
  const StatementAccountsPageRouteArgs({this.key});

  final _i89.Key? key;

  @override
  String toString() {
    return 'StatementAccountsPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i45.PaymentAdviceCreatedPage]
class PaymentAdviceCreatedPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentAdviceCreatedPageRoute()
      : super(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        );

  static const String name = 'PaymentAdviceCreatedPageRoute';
}

/// generated route for
/// [_i46.AddToCart]
class AddToCartRoute extends _i88.PageRouteInfo<AddToCartRouteArgs> {
  AddToCartRoute({
    _i89.Key? key,
    required bool isCovid19Tab,
    required _i92.PriceAggregate material,
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

  final _i89.Key? key;

  final bool isCovid19Tab;

  final _i92.PriceAggregate material;

  final bool isShortcutAccess;

  @override
  String toString() {
    return 'AddToCartRouteArgs{key: $key, isCovid19Tab: $isCovid19Tab, material: $material, isShortcutAccess: $isShortcutAccess}';
  }
}

/// generated route for
/// [_i47.UpdateCart]
class UpdateCartRoute extends _i88.PageRouteInfo<UpdateCartRouteArgs> {
  UpdateCartRoute({
    _i89.Key? key,
    required _i92.PriceAggregate material,
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

  final _i89.Key? key;

  final _i92.PriceAggregate material;

  @override
  String toString() {
    return 'UpdateCartRouteArgs{key: $key, material: $material}';
  }
}

/// generated route for
/// [_i48.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i88.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i89.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i89.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i49.SalesDistrictPage]
class SalesDistrictPageRoute extends _i88.PageRouteInfo<void> {
  const SalesDistrictPageRoute()
      : super(
          SalesDistrictPageRoute.name,
          path: 'payments/sales_district',
        );

  static const String name = 'SalesDistrictPageRoute';
}

/// generated route for
/// [_i50.AddSalesDistrictPage]
class AddSalesDistrictPageRoute extends _i88.PageRouteInfo<void> {
  const AddSalesDistrictPageRoute()
      : super(
          AddSalesDistrictPageRoute.name,
          path: 'payments/sales_district/add_sales_district',
        );

  static const String name = 'AddSalesDistrictPageRoute';
}

/// generated route for
/// [_i51.EditSalesDistrictPage]
class EditSalesDistrictPageRoute extends _i88.PageRouteInfo<void> {
  const EditSalesDistrictPageRoute()
      : super(
          EditSalesDistrictPageRoute.name,
          path: 'payments/sales_district/edit_sales_district',
        );

  static const String name = 'EditSalesDistrictPageRoute';
}

/// generated route for
/// [_i52.PaymentAdviceFooterPage]
class PaymentAdviceFooterPageRoute extends _i88.PageRouteInfo<void> {
  const PaymentAdviceFooterPageRoute()
      : super(
          PaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer',
        );

  static const String name = 'PaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i53.AddPaymentAdviceFooterPage]
class AddPaymentAdviceFooterPageRoute extends _i88.PageRouteInfo<void> {
  const AddPaymentAdviceFooterPageRoute()
      : super(
          AddPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/add_advice_footer',
        );

  static const String name = 'AddPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i54.EditPaymentAdviceFooterPage]
class EditPaymentAdviceFooterPageRoute extends _i88.PageRouteInfo<void> {
  const EditPaymentAdviceFooterPageRoute()
      : super(
          EditPaymentAdviceFooterPageRoute.name,
          path: 'payments/advice_footer/edit_advice_footer',
        );

  static const String name = 'EditPaymentAdviceFooterPageRoute';
}

/// generated route for
/// [_i55.IntroPage]
class IntroPageRoute extends _i88.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i56.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute extends _i88.PageRouteInfo<void> {
  const ViewByItemDetailsPageRoute()
      : super(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        );

  static const String name = 'ViewByItemDetailsPageRoute';
}

/// generated route for
/// [_i57.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute extends _i88.PageRouteInfo<void> {
  const ViewByOrderDetailsPageRoute()
      : super(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        );

  static const String name = 'ViewByOrderDetailsPageRoute';
}

/// generated route for
/// [_i58.BundleDetailPage]
class BundleDetailPageRoute extends _i88.PageRouteInfo<void> {
  const BundleDetailPageRoute()
      : super(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        );

  static const String name = 'BundleDetailPageRoute';
}

/// generated route for
/// [_i59.ProductDetailsPage]
class ProductDetailsPageRoute extends _i88.PageRouteInfo<void> {
  const ProductDetailsPageRoute()
      : super(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        );

  static const String name = 'ProductDetailsPageRoute';
}

/// generated route for
/// [_i60.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute extends _i88.PageRouteInfo<void> {
  const ReturnRequestSummaryByItemDetailsRoute()
      : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';
}

/// generated route for
/// [_i61.AnnouncementsPage]
class AnnouncementsPageRoute extends _i88.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i88.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';
}

/// generated route for
/// [_i62.ArticleDetails]
class ArticleDetailsRoute extends _i88.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i89.Key? key,
    required _i93.AnnouncementArticleItem article,
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

  final _i89.Key? key;

  final _i93.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i63.ReturnRequestDetails]
class ReturnRequestDetailsRoute
    extends _i88.PageRouteInfo<ReturnRequestDetailsRouteArgs> {
  ReturnRequestDetailsRoute({
    _i89.Key? key,
    required _i94.ReturnItem returnItem,
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

  final _i89.Key? key;

  final _i94.ReturnItem returnItem;

  @override
  String toString() {
    return 'ReturnRequestDetailsRouteArgs{key: $key, returnItem: $returnItem}';
  }
}

/// generated route for
/// [_i64.SalesOrgSearch]
class SalesOrgSearchRoute extends _i88.PageRouteInfo<SalesOrgSearchRouteArgs> {
  SalesOrgSearchRoute({
    _i89.Key? key,
    required List<_i95.SalesOrganisation> avialableSalesOrgList,
  }) : super(
          SalesOrgSearchRoute.name,
          path: 'salesOrg_search',
          args: SalesOrgSearchRouteArgs(
            key: key,
            avialableSalesOrgList: avialableSalesOrgList,
          ),
        );

  static const String name = 'SalesOrgSearchRoute';
}

class SalesOrgSearchRouteArgs {
  const SalesOrgSearchRouteArgs({
    this.key,
    required this.avialableSalesOrgList,
  });

  final _i89.Key? key;

  final List<_i95.SalesOrganisation> avialableSalesOrgList;

  @override
  String toString() {
    return 'SalesOrgSearchRouteArgs{key: $key, avialableSalesOrgList: $avialableSalesOrgList}';
  }
}

/// generated route for
/// [_i65.FAQPage]
class FAQPageRoute extends _i88.PageRouteInfo<void> {
  const FAQPageRoute()
      : super(
          FAQPageRoute.name,
          path: 'faq_page',
        );

  static const String name = 'FAQPageRoute';
}

/// generated route for
/// [_i66.NewRequestPage]
class NewRequestPageRoute extends _i88.PageRouteInfo<void> {
  const NewRequestPageRoute({List<_i88.PageRouteInfo>? children})
      : super(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          initialChildren: children,
        );

  static const String name = 'NewRequestPageRoute';
}

/// generated route for
/// [_i67.NewRequestSuccessfulPage]
class NewRequestSuccessfulPageRoute extends _i88.PageRouteInfo<void> {
  const NewRequestSuccessfulPageRoute()
      : super(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        );

  static const String name = 'NewRequestSuccessfulPageRoute';
}

/// generated route for
/// [_i68.AboutUsPage]
class AboutUsPageRoute extends _i88.PageRouteInfo<void> {
  const AboutUsPageRoute()
      : super(
          AboutUsPageRoute.name,
          path: 'about_us',
        );

  static const String name = 'AboutUsPageRoute';
}

/// generated route for
/// [_i69.AllInvoicesPage]
class AllInvoicesPageRoute extends _i88.PageRouteInfo<void> {
  const AllInvoicesPageRoute()
      : super(
          AllInvoicesPageRoute.name,
          path: 'all_invoices',
        );

  static const String name = 'AllInvoicesPageRoute';
}

/// generated route for
/// [_i70.AllCreditsPage]
class AllCreditsPageRoute extends _i88.PageRouteInfo<void> {
  const AllCreditsPageRoute()
      : super(
          AllCreditsPageRoute.name,
          path: 'all_credits',
        );

  static const String name = 'AllCreditsPageRoute';
}

/// generated route for
/// [_i71.HomeTab]
class HomeTabRoute extends _i88.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i72.ProductsTab]
class ProductsTabRoute extends _i88.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i73.OrdersTab]
class OrdersTabRoute extends _i88.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i88.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i74.MoreTab]
class MoreTabRoute extends _i88.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i75.NotificationTab]
class NotificationTabRoute extends _i88.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i76.ViewByItemsPage]
class ViewByItemsPageRoute extends _i88.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i77.ViewByOrdersPage]
class ViewByOrdersPageRoute
    extends _i88.PageRouteInfo<ViewByOrdersPageRouteArgs> {
  ViewByOrdersPageRoute({
    _i89.Key? key,
    required _i96.OrderHistoryItem orderHistoryItem,
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

  final _i89.Key? key;

  final _i96.OrderHistoryItem orderHistoryItem;

  @override
  String toString() {
    return 'ViewByOrdersPageRouteArgs{key: $key, orderHistoryItem: $orderHistoryItem}';
  }
}

/// generated route for
/// [_i78.ReturnByItemPage]
class ReturnByItemPageRoute extends _i88.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i79.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i88.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i80.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i88.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i81.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i88.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i82.PaymentMethodTab]
class PaymentMethodTabRoute extends _i88.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}

/// generated route for
/// [_i83.ArticlesTab]
class ArticlesTabRoute extends _i88.PageRouteInfo<void> {
  const ArticlesTabRoute()
      : super(
          ArticlesTabRoute.name,
          path: 'articles_tab',
        );

  static const String name = 'ArticlesTabRoute';
}

/// generated route for
/// [_i84.AnnouncementsTab]
class AnnouncementsTabRoute extends _i88.PageRouteInfo<void> {
  const AnnouncementsTabRoute()
      : super(
          AnnouncementsTabRoute.name,
          path: 'announcements_tab',
        );

  static const String name = 'AnnouncementsTabRoute';
}

/// generated route for
/// [_i85.ReturnItemsTab]
class ReturnItemsTabRoute extends _i88.PageRouteInfo<void> {
  const ReturnItemsTabRoute()
      : super(
          ReturnItemsTabRoute.name,
          path: 'returns/new_request/return_items',
        );

  static const String name = 'ReturnItemsTabRoute';
}

/// generated route for
/// [_i86.ReturnDetailsTab]
class ReturnDetailsTabRoute extends _i88.PageRouteInfo<void> {
  const ReturnDetailsTabRoute()
      : super(
          ReturnDetailsTabRoute.name,
          path: 'returns/new_request/return_details',
        );

  static const String name = 'ReturnDetailsTabRoute';
}

/// generated route for
/// [_i87.ReturnReviewTab]
class ReturnReviewTabRoute extends _i88.PageRouteInfo<void> {
  const ReturnReviewTabRoute()
      : super(
          ReturnReviewTabRoute.name,
          path: 'returns/new_request/return_review',
        );

  static const String name = 'ReturnReviewTabRoute';
}
