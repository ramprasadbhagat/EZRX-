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
import 'package:auto_route/auto_route.dart' as _i76;
import 'package:flutter/material.dart' as _i77;

import '../../domain/account/entities/sales_organisation.dart' as _i82;
import '../../domain/account/entities/user.dart' as _i79;
import '../../domain/announcement_info/entities/announcement_article_info.dart'
    as _i81;
import '../../domain/auth/value/value_objects.dart' as _i78;
import '../../domain/order/entities/material_info.dart' as _i80;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i40;
import '../account/change_password/change_password_page.dart' as _i13;
import '../account/contact_us/contact_us_page.dart' as _i14;
import '../account/customer_search/customer_search.dart' as _i16;
import '../account/ez_point/ez_point_webview_page.dart' as _i24;
import '../account/notification_settings/notification_settings_page.dart'
    as _i15;
import '../account/profile/profile_page.dart' as _i23;
import '../account/sales_org_search.dart' as _i50;
import '../aup_tc/aup_tc_page.dart' as _i17;
import '../auth/forgot_password/forgot_password_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../auth/reset_password/reset_password_page.dart' as _i5;
import '../auth/reset_password_success/reset_password_success_page.dart' as _i6;
import '../core/static_html_viewer.dart' as _i12;
import '../core/webview_page.dart' as _i11;
import '../faq/faq.dart' as _i51;
import '../home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart'
    as _i32;
import '../home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i72;
import '../home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i47;
import '../home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i48;
import '../home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i71;
import '../home/home_tab.dart' as _i59;
import '../home_tab.dart' as _i27;
import '../intro/intro_page.dart' as _i41;
import '../more/more_tab.dart' as _i62;
import '../more/section/about_us/about_us_page.dart' as _i54;
import '../notification/notification_tab.dart' as _i63;
import '../orders/cart/cart_page.dart' as _i18;
import '../orders/cart/checkout/checkout_page.dart' as _i19;
import '../orders/create_order/scan_material_info.dart' as _i31;
import '../orders/order_success/order_success_page.dart' as _i20;
import '../orders/order_tab/orders_tab.dart' as _i61;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i64;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i65;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i42;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i43;
import '../payments/account_summary/account_summary_page.dart' as _i26;
import '../payments/all_credits/all_credits.dart' as _i57;
import '../payments/all_invoices/all_invoices.dart' as _i56;
import '../payments/credit_details/credit_details.dart' as _i34;
import '../payments/full_summary/full_summary.dart' as _i58;
import '../payments/invoice_details/invoice_details.dart' as _i33;
import '../payments/new_payment/new_payment_page.dart' as _i36;
import '../payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart'
    as _i69;
import '../payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart'
    as _i68;
import '../payments/new_payment/tabs/payment_method/payment_method_tab.dart'
    as _i70;
import '../payments/payment_advice_created/payment_advice_created_page.dart'
    as _i38;
import '../payments/payment_completed/payment_completed_page.dart' as _i39;
import '../payments/payment_home/payment_page.dart' as _i22;
import '../payments/payment_summary/payment_summary_page.dart' as _i25;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i30;
import '../payments/payment_webview/payment_webview_page.dart' as _i35;
import '../payments/statement_accounts/statement_accounts.dart' as _i37;
import '../products/bundle_details/bundle_detail_page.dart' as _i44;
import '../products/combo_detail/combo_detail_page.dart' as _i55;
import '../products/product_details/product_details_page.dart' as _i45;
import '../products/product_suggestion/product_suggestion_page.dart' as _i21;
import '../products/products_tab.dart' as _i60;
import '../returns/add_edit_user_restrictions.dart' as _i28;
import '../returns/approver_actions/approver_actions.dart' as _i7;
import '../returns/new_request/new_request_page.dart' as _i52;
import '../returns/new_request/new_request_success/new_request_successful_page.dart'
    as _i53;
import '../returns/new_request/tabs/return_details_tab/return_details_tab.dart'
    as _i74;
import '../returns/new_request/tabs/return_items_tab/return_items_tab.dart'
    as _i73;
import '../returns/new_request/tabs/return_review_tab/return_review_tab.dart'
    as _i75;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i10;
import '../returns/policy_configuration/policy_configuration.dart' as _i9;
import '../returns/return_list/return_by_item_page.dart' as _i66;
import '../returns/return_list/return_by_request_page.dart' as _i67;
import '../returns/return_list/return_root/return_root.dart' as _i29;
import '../returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i46;
import '../returns/return_summary_request_details/return_request_details.dart'
    as _i49;
import '../returns/user_restriction_list.dart' as _i8;
import '../splash/splash_page.dart' as _i1;

class AppRouter extends _i76.RootStackRouter {
  AppRouter([_i77.GlobalKey<_i77.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i76.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ResetPasswordPage(),
      );
    },
    ResetPasswordSuccessRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.ResetPasswordSuccess(),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
          titleText: args.titleText,
        ),
      );
    },
    StaticHtmlViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StaticHtmlViewerRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.StaticHtmlViewer(
          key: args.key,
          title: args.title,
          htmlPath: args.htmlPath,
          styleCss: args.styleCss,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ContactUsPageRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ContactUsPage(
          key: args.key,
          appMarket: args.appMarket,
        ),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i76.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.CustomerSearchPage(),
        transitionsBuilder: _i76.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AupTCPageRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCPageRouteArgs>();
      return _i76.CustomPage<dynamic>(
        routeData: routeData,
        child: _i17.AupTCPage(
          key: args.key,
          user: args.user,
          isMarketPlace: args.isMarketPlace,
        ),
        transitionsBuilder: _i76.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CartPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.CartPage(),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductSuggestionPageRouteArgs>();
      return _i76.CustomPage<dynamic>(
        routeData: routeData,
        child: _i21.ProductSuggestionPage(
          key: args.key,
          parentRoute: args.parentRoute,
        ),
        durationInMilliseconds: 0,
        reverseDurationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.PaymentPage(),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ProfilePage(),
      );
    },
    EZPointWebviewPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.EZPointWebviewPage(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.PaymentSummaryPage(),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i26.AccountSummary(),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.HomeNavigationTabbar(),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i29.ReturnRoot(),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.PaymentSummaryDetailsPage(),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.ScanMaterialInfo(),
      );
    },
    AnnouncementInfoDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.AnnouncementInfoDetailsPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.InvoiceDetailsPage(),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i34.CreditDetailsPage(),
      );
    },
    PaymentWebviewPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i35.PaymentWebviewPage(),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i36.NewPaymentPage(),
      );
    },
    StatementAccountsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i37.StatementAccountsPage(),
      );
    },
    PaymentAdviceCreatedPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i38.PaymentAdviceCreatedPage(),
      );
    },
    PaymentCompletedPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i39.PaymentCompletedPage(),
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i40.AdminPoAttachmentPage(key: args.key),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i76.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i41.IntroPage(),
        transitionsBuilder: _i76.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.ViewByItemDetailsPage(),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i43.ViewByOrderDetailsPage(),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleDetailPageRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i44.BundleDetailPage(
          key: args.key,
          materialInfo: args.materialInfo,
        ),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsPageRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i45.ProductDetailsPage(
          key: args.key,
          materialInfo: args.materialInfo,
        ),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.ReturnRequestSummaryByItemDetails(),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i47.AnnouncementsPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i48.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i49.ReturnRequestDetails(),
      );
    },
    SalesOrgSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SalesOrgSearchRouteArgs>();
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i50.SalesOrgSearch(
          key: args.key,
          avialableSalesOrgList: args.avialableSalesOrgList,
        ),
      );
    },
    FAQPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.FAQPage(),
      );
    },
    NewRequestPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i52.NewRequestPage(),
      );
    },
    NewRequestSuccessfulPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.NewRequestSuccessfulPage(),
      );
    },
    AboutUsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.AboutUsPage(),
      );
    },
    ComboDetailPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.ComboDetailPage(),
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i56.AllInvoicesPage(),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i57.AllCreditsPage(),
      );
    },
    FullSummaryPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i58.FullSummaryPage(),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i59.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i60.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i61.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i62.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i63.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i64.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.ViewByOrdersPage(),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.PaymentMethodTab(),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.ArticlesTab(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i72.AnnouncementsTab(),
      );
    },
    ReturnItemsTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i73.ReturnItemsTab(),
      );
    },
    ReturnDetailsTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.ReturnDetailsTab(),
      );
    },
    ReturnReviewTabRoute.name: (routeData) {
      return _i76.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.ReturnReviewTab(),
      );
    },
  };

  @override
  List<_i76.RouteConfig> get routes => [
        _i76.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i76.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i76.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i76.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i76.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i76.RouteConfig(
          ResetPasswordPageRoute.name,
          path: 'reset_password',
        ),
        _i76.RouteConfig(
          ResetPasswordSuccessRoute.name,
          path: 'reset_password_success',
        ),
        _i76.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i76.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i76.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i76.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i76.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i76.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i76.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i76.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i76.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i76.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i76.RouteConfig(
          AupTCPageRoute.name,
          path: 'terms_of_service',
        ),
        _i76.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i76.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i76.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i76.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i76.RouteConfig(
          PaymentPageRoute.name,
          path: 'payments',
        ),
        _i76.RouteConfig(
          ProfilePageRoute.name,
          path: 'profile',
        ),
        _i76.RouteConfig(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        ),
        _i76.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i76.RouteConfig(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          children: [
            _i76.RouteConfig(
              AllInvoicesPageRoute.name,
              path: 'all_invoices',
              parent: AccountSummaryRoute.name,
            ),
            _i76.RouteConfig(
              AllCreditsPageRoute.name,
              path: 'all_credits',
              parent: AccountSummaryRoute.name,
            ),
            _i76.RouteConfig(
              FullSummaryPageRoute.name,
              path: 'full_summary',
              parent: AccountSummaryRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i76.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i76.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i76.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i76.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i76.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i76.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i76.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i76.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i76.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i76.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i76.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i76.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i76.RouteConfig(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        ),
        _i76.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i76.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i76.RouteConfig(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        ),
        _i76.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i76.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i76.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i76.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
        ),
        _i76.RouteConfig(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        ),
        _i76.RouteConfig(
          PaymentCompletedPageRoute.name,
          path: 'payments/payment_completed',
        ),
        _i76.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i76.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i76.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i76.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i76.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i76.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
        _i76.RouteConfig(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        ),
        _i76.RouteConfig(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          children: [
            _i76.RouteConfig(
              ArticlesTabRoute.name,
              path: 'articles_tab',
              parent: AnnouncementsPageRoute.name,
            ),
            _i76.RouteConfig(
              AnnouncementsTabRoute.name,
              path: 'announcements_tab',
              parent: AnnouncementsPageRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          ArticleDetailsRoute.name,
          path: 'article_details',
        ),
        _i76.RouteConfig(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        ),
        _i76.RouteConfig(
          SalesOrgSearchRoute.name,
          path: 'salesOrg_search',
        ),
        _i76.RouteConfig(
          FAQPageRoute.name,
          path: 'faq_page',
        ),
        _i76.RouteConfig(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          children: [
            _i76.RouteConfig(
              ReturnItemsTabRoute.name,
              path: 'returns/new_request/return_items',
              parent: NewRequestPageRoute.name,
            ),
            _i76.RouteConfig(
              ReturnDetailsTabRoute.name,
              path: 'returns/new_request/return_details',
              parent: NewRequestPageRoute.name,
            ),
            _i76.RouteConfig(
              ReturnReviewTabRoute.name,
              path: 'returns/new_request/return_review',
              parent: NewRequestPageRoute.name,
            ),
          ],
        ),
        _i76.RouteConfig(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        ),
        _i76.RouteConfig(
          AboutUsPageRoute.name,
          path: 'about_us',
        ),
        _i76.RouteConfig(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i76.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i76.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i76.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i76.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute()
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';
}

/// generated route for
/// [_i5.ResetPasswordPage]
class ResetPasswordPageRoute extends _i76.PageRouteInfo<void> {
  const ResetPasswordPageRoute()
      : super(
          ResetPasswordPageRoute.name,
          path: 'reset_password',
        );

  static const String name = 'ResetPasswordPageRoute';
}

/// generated route for
/// [_i6.ResetPasswordSuccess]
class ResetPasswordSuccessRoute extends _i76.PageRouteInfo<void> {
  const ResetPasswordSuccessRoute()
      : super(
          ResetPasswordSuccessRoute.name,
          path: 'reset_password_success',
        );

  static const String name = 'ResetPasswordSuccessRoute';
}

/// generated route for
/// [_i7.ApproverActions]
class ApproverActionsRoute
    extends _i76.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i77.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i77.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i76.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i9.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i76.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i10.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i76.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i11.WebViewPage]
class WebViewPageRoute extends _i76.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i77.Key? key,
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

  final _i77.Key? key;

  final String url;

  final String? initialFile;

  final String titleText;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile, titleText: $titleText}';
  }
}

/// generated route for
/// [_i12.StaticHtmlViewer]
class StaticHtmlViewerRoute
    extends _i76.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i77.Key? key,
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

  final _i77.Key? key;

  final String title;

  final String htmlPath;

  final String styleCss;

  @override
  String toString() {
    return 'StaticHtmlViewerRouteArgs{key: $key, title: $title, htmlPath: $htmlPath, styleCss: $styleCss}';
  }
}

/// generated route for
/// [_i13.ChangePasswordPage]
class ChangePasswordPageRoute extends _i76.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i14.ContactUsPage]
class ContactUsPageRoute extends _i76.PageRouteInfo<ContactUsPageRouteArgs> {
  ContactUsPageRoute({
    _i77.Key? key,
    required _i78.AppMarket appMarket,
  }) : super(
          ContactUsPageRoute.name,
          path: 'contact_us',
          args: ContactUsPageRouteArgs(
            key: key,
            appMarket: appMarket,
          ),
        );

  static const String name = 'ContactUsPageRoute';
}

class ContactUsPageRouteArgs {
  const ContactUsPageRouteArgs({
    this.key,
    required this.appMarket,
  });

  final _i77.Key? key;

  final _i78.AppMarket appMarket;

  @override
  String toString() {
    return 'ContactUsPageRouteArgs{key: $key, appMarket: $appMarket}';
  }
}

/// generated route for
/// [_i15.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i76.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i16.CustomerSearchPage]
class CustomerSearchPageRoute extends _i76.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i17.AupTCPage]
class AupTCPageRoute extends _i76.PageRouteInfo<AupTCPageRouteArgs> {
  AupTCPageRoute({
    _i77.Key? key,
    required _i79.User user,
    required bool isMarketPlace,
  }) : super(
          AupTCPageRoute.name,
          path: 'terms_of_service',
          args: AupTCPageRouteArgs(
            key: key,
            user: user,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'AupTCPageRoute';
}

class AupTCPageRouteArgs {
  const AupTCPageRouteArgs({
    this.key,
    required this.user,
    required this.isMarketPlace,
  });

  final _i77.Key? key;

  final _i79.User user;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AupTCPageRouteArgs{key: $key, user: $user, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i18.CartPage]
class CartPageRoute extends _i76.PageRouteInfo<void> {
  const CartPageRoute()
      : super(
          CartPageRoute.name,
          path: 'orders/cart',
        );

  static const String name = 'CartPageRoute';
}

/// generated route for
/// [_i19.CheckoutPage]
class CheckoutPageRoute extends _i76.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i20.OrderSuccessPage]
class OrderSuccessPageRoute extends _i76.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i21.ProductSuggestionPage]
class ProductSuggestionPageRoute
    extends _i76.PageRouteInfo<ProductSuggestionPageRouteArgs> {
  ProductSuggestionPageRoute({
    _i77.Key? key,
    required String parentRoute,
  }) : super(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
          args: ProductSuggestionPageRouteArgs(
            key: key,
            parentRoute: parentRoute,
          ),
        );

  static const String name = 'ProductSuggestionPageRoute';
}

class ProductSuggestionPageRouteArgs {
  const ProductSuggestionPageRouteArgs({
    this.key,
    required this.parentRoute,
  });

  final _i77.Key? key;

  final String parentRoute;

  @override
  String toString() {
    return 'ProductSuggestionPageRouteArgs{key: $key, parentRoute: $parentRoute}';
  }
}

/// generated route for
/// [_i22.PaymentPage]
class PaymentPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentPageRoute()
      : super(
          PaymentPageRoute.name,
          path: 'payments',
        );

  static const String name = 'PaymentPageRoute';
}

/// generated route for
/// [_i23.ProfilePage]
class ProfilePageRoute extends _i76.PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [_i24.EZPointWebviewPage]
class EZPointWebviewPageRoute extends _i76.PageRouteInfo<void> {
  const EZPointWebviewPageRoute()
      : super(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        );

  static const String name = 'EZPointWebviewPageRoute';
}

/// generated route for
/// [_i25.PaymentSummaryPage]
class PaymentSummaryPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentSummaryPageRoute()
      : super(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        );

  static const String name = 'PaymentSummaryPageRoute';
}

/// generated route for
/// [_i26.AccountSummary]
class AccountSummaryRoute extends _i76.PageRouteInfo<void> {
  const AccountSummaryRoute({List<_i76.PageRouteInfo>? children})
      : super(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          initialChildren: children,
        );

  static const String name = 'AccountSummaryRoute';
}

/// generated route for
/// [_i27.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i76.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i76.PageRouteInfo>? children})
      : super(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i28.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i76.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i77.Key? key,
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

  final _i77.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i29.ReturnRoot]
class ReturnRootRoute extends _i76.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i76.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i30.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentSummaryDetailsPageRoute()
      : super(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        );

  static const String name = 'PaymentSummaryDetailsPageRoute';
}

/// generated route for
/// [_i31.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i76.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i32.AnnouncementInfoDetailsPage]
class AnnouncementInfoDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const AnnouncementInfoDetailsPageRoute()
      : super(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        );

  static const String name = 'AnnouncementInfoDetailsPageRoute';
}

/// generated route for
/// [_i33.InvoiceDetailsPage]
class InvoiceDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const InvoiceDetailsPageRoute()
      : super(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        );

  static const String name = 'InvoiceDetailsPageRoute';
}

/// generated route for
/// [_i34.CreditDetailsPage]
class CreditDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const CreditDetailsPageRoute()
      : super(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        );

  static const String name = 'CreditDetailsPageRoute';
}

/// generated route for
/// [_i35.PaymentWebviewPage]
class PaymentWebviewPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentWebviewPageRoute()
      : super(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        );

  static const String name = 'PaymentWebviewPageRoute';
}

/// generated route for
/// [_i36.NewPaymentPage]
class NewPaymentPageRoute extends _i76.PageRouteInfo<void> {
  const NewPaymentPageRoute({List<_i76.PageRouteInfo>? children})
      : super(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';
}

/// generated route for
/// [_i37.StatementAccountsPage]
class StatementAccountsPageRoute extends _i76.PageRouteInfo<void> {
  const StatementAccountsPageRoute()
      : super(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
        );

  static const String name = 'StatementAccountsPageRoute';
}

/// generated route for
/// [_i38.PaymentAdviceCreatedPage]
class PaymentAdviceCreatedPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentAdviceCreatedPageRoute()
      : super(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        );

  static const String name = 'PaymentAdviceCreatedPageRoute';
}

/// generated route for
/// [_i39.PaymentCompletedPage]
class PaymentCompletedPageRoute extends _i76.PageRouteInfo<void> {
  const PaymentCompletedPageRoute()
      : super(
          PaymentCompletedPageRoute.name,
          path: 'payments/payment_completed',
        );

  static const String name = 'PaymentCompletedPageRoute';
}

/// generated route for
/// [_i40.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i76.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i77.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i77.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i41.IntroPage]
class IntroPageRoute extends _i76.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i42.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const ViewByItemDetailsPageRoute()
      : super(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        );

  static const String name = 'ViewByItemDetailsPageRoute';
}

/// generated route for
/// [_i43.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute extends _i76.PageRouteInfo<void> {
  const ViewByOrderDetailsPageRoute()
      : super(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        );

  static const String name = 'ViewByOrderDetailsPageRoute';
}

/// generated route for
/// [_i44.BundleDetailPage]
class BundleDetailPageRoute
    extends _i76.PageRouteInfo<BundleDetailPageRouteArgs> {
  BundleDetailPageRoute({
    _i77.Key? key,
    required _i80.MaterialInfo materialInfo,
  }) : super(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
          args: BundleDetailPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
          ),
        );

  static const String name = 'BundleDetailPageRoute';
}

class BundleDetailPageRouteArgs {
  const BundleDetailPageRouteArgs({
    this.key,
    required this.materialInfo,
  });

  final _i77.Key? key;

  final _i80.MaterialInfo materialInfo;

  @override
  String toString() {
    return 'BundleDetailPageRouteArgs{key: $key, materialInfo: $materialInfo}';
  }
}

/// generated route for
/// [_i45.ProductDetailsPage]
class ProductDetailsPageRoute
    extends _i76.PageRouteInfo<ProductDetailsPageRouteArgs> {
  ProductDetailsPageRoute({
    _i77.Key? key,
    required _i80.MaterialInfo materialInfo,
  }) : super(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
          args: ProductDetailsPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
          ),
        );

  static const String name = 'ProductDetailsPageRoute';
}

class ProductDetailsPageRouteArgs {
  const ProductDetailsPageRouteArgs({
    this.key,
    required this.materialInfo,
  });

  final _i77.Key? key;

  final _i80.MaterialInfo materialInfo;

  @override
  String toString() {
    return 'ProductDetailsPageRouteArgs{key: $key, materialInfo: $materialInfo}';
  }
}

/// generated route for
/// [_i46.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute extends _i76.PageRouteInfo<void> {
  const ReturnRequestSummaryByItemDetailsRoute()
      : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';
}

/// generated route for
/// [_i47.AnnouncementsPage]
class AnnouncementsPageRoute extends _i76.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i76.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';
}

/// generated route for
/// [_i48.ArticleDetails]
class ArticleDetailsRoute extends _i76.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i77.Key? key,
    required _i81.AnnouncementArticleItem article,
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

  final _i77.Key? key;

  final _i81.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i49.ReturnRequestDetails]
class ReturnRequestDetailsRoute extends _i76.PageRouteInfo<void> {
  const ReturnRequestDetailsRoute()
      : super(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        );

  static const String name = 'ReturnRequestDetailsRoute';
}

/// generated route for
/// [_i50.SalesOrgSearch]
class SalesOrgSearchRoute extends _i76.PageRouteInfo<SalesOrgSearchRouteArgs> {
  SalesOrgSearchRoute({
    _i77.Key? key,
    required List<_i82.SalesOrganisation> avialableSalesOrgList,
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

  final _i77.Key? key;

  final List<_i82.SalesOrganisation> avialableSalesOrgList;

  @override
  String toString() {
    return 'SalesOrgSearchRouteArgs{key: $key, avialableSalesOrgList: $avialableSalesOrgList}';
  }
}

/// generated route for
/// [_i51.FAQPage]
class FAQPageRoute extends _i76.PageRouteInfo<void> {
  const FAQPageRoute()
      : super(
          FAQPageRoute.name,
          path: 'faq_page',
        );

  static const String name = 'FAQPageRoute';
}

/// generated route for
/// [_i52.NewRequestPage]
class NewRequestPageRoute extends _i76.PageRouteInfo<void> {
  const NewRequestPageRoute({List<_i76.PageRouteInfo>? children})
      : super(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          initialChildren: children,
        );

  static const String name = 'NewRequestPageRoute';
}

/// generated route for
/// [_i53.NewRequestSuccessfulPage]
class NewRequestSuccessfulPageRoute extends _i76.PageRouteInfo<void> {
  const NewRequestSuccessfulPageRoute()
      : super(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        );

  static const String name = 'NewRequestSuccessfulPageRoute';
}

/// generated route for
/// [_i54.AboutUsPage]
class AboutUsPageRoute extends _i76.PageRouteInfo<void> {
  const AboutUsPageRoute()
      : super(
          AboutUsPageRoute.name,
          path: 'about_us',
        );

  static const String name = 'AboutUsPageRoute';
}

/// generated route for
/// [_i55.ComboDetailPage]
class ComboDetailPageRoute extends _i76.PageRouteInfo<void> {
  const ComboDetailPageRoute()
      : super(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        );

  static const String name = 'ComboDetailPageRoute';
}

/// generated route for
/// [_i56.AllInvoicesPage]
class AllInvoicesPageRoute extends _i76.PageRouteInfo<void> {
  const AllInvoicesPageRoute()
      : super(
          AllInvoicesPageRoute.name,
          path: 'all_invoices',
        );

  static const String name = 'AllInvoicesPageRoute';
}

/// generated route for
/// [_i57.AllCreditsPage]
class AllCreditsPageRoute extends _i76.PageRouteInfo<void> {
  const AllCreditsPageRoute()
      : super(
          AllCreditsPageRoute.name,
          path: 'all_credits',
        );

  static const String name = 'AllCreditsPageRoute';
}

/// generated route for
/// [_i58.FullSummaryPage]
class FullSummaryPageRoute extends _i76.PageRouteInfo<void> {
  const FullSummaryPageRoute()
      : super(
          FullSummaryPageRoute.name,
          path: 'full_summary',
        );

  static const String name = 'FullSummaryPageRoute';
}

/// generated route for
/// [_i59.HomeTab]
class HomeTabRoute extends _i76.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i60.ProductsTab]
class ProductsTabRoute extends _i76.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i61.OrdersTab]
class OrdersTabRoute extends _i76.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i76.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i62.MoreTab]
class MoreTabRoute extends _i76.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i63.NotificationTab]
class NotificationTabRoute extends _i76.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i64.ViewByItemsPage]
class ViewByItemsPageRoute extends _i76.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i65.ViewByOrdersPage]
class ViewByOrdersPageRoute extends _i76.PageRouteInfo<void> {
  const ViewByOrdersPageRoute()
      : super(
          ViewByOrdersPageRoute.name,
          path: 'orders/view_by_orders',
        );

  static const String name = 'ViewByOrdersPageRoute';
}

/// generated route for
/// [_i66.ReturnByItemPage]
class ReturnByItemPageRoute extends _i76.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i67.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i76.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i68.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i76.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i69.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i76.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i70.PaymentMethodTab]
class PaymentMethodTabRoute extends _i76.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}

/// generated route for
/// [_i71.ArticlesTab]
class ArticlesTabRoute extends _i76.PageRouteInfo<void> {
  const ArticlesTabRoute()
      : super(
          ArticlesTabRoute.name,
          path: 'articles_tab',
        );

  static const String name = 'ArticlesTabRoute';
}

/// generated route for
/// [_i72.AnnouncementsTab]
class AnnouncementsTabRoute extends _i76.PageRouteInfo<void> {
  const AnnouncementsTabRoute()
      : super(
          AnnouncementsTabRoute.name,
          path: 'announcements_tab',
        );

  static const String name = 'AnnouncementsTabRoute';
}

/// generated route for
/// [_i73.ReturnItemsTab]
class ReturnItemsTabRoute extends _i76.PageRouteInfo<void> {
  const ReturnItemsTabRoute()
      : super(
          ReturnItemsTabRoute.name,
          path: 'returns/new_request/return_items',
        );

  static const String name = 'ReturnItemsTabRoute';
}

/// generated route for
/// [_i74.ReturnDetailsTab]
class ReturnDetailsTabRoute extends _i76.PageRouteInfo<void> {
  const ReturnDetailsTabRoute()
      : super(
          ReturnDetailsTabRoute.name,
          path: 'returns/new_request/return_details',
        );

  static const String name = 'ReturnDetailsTabRoute';
}

/// generated route for
/// [_i75.ReturnReviewTab]
class ReturnReviewTabRoute extends _i76.PageRouteInfo<void> {
  const ReturnReviewTabRoute()
      : super(
          ReturnReviewTabRoute.name,
          path: 'returns/new_request/return_review',
        );

  static const String name = 'ReturnReviewTabRoute';
}
