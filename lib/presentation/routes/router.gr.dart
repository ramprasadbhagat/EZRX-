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
import 'package:auto_route/auto_route.dart' as _i79;
import 'package:flutter/material.dart' as _i80;

import '../../domain/account/entities/sales_organisation.dart' as _i88;
import '../../domain/account/entities/user.dart' as _i83;
import '../../domain/announcement_info/entities/announcement_article_info.dart'
    as _i87;
import '../../domain/auth/value/value_objects.dart' as _i82;
import '../../domain/banner/entities/ez_reach_banner.dart' as _i86;
import '../../domain/order/entities/delivery_info_data.dart' as _i84;
import '../../domain/order/entities/material_info.dart' as _i85;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i42;
import '../account/change_password/change_password_page.dart' as _i13;
import '../account/contact_us/contact_us_page.dart' as _i14;
import '../account/customer_search/customer_search.dart' as _i16;
import '../account/ez_point/ez_point_webview_page.dart' as _i24;
import '../account/notification_settings/notification_settings_page.dart'
    as _i15;
import '../account/profile/profile_page.dart' as _i23;
import '../account/sales_org_search.dart' as _i52;
import '../aup_tc/aup_tc_page.dart' as _i17;
import '../auth/forgot_password/forgot_password_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../auth/reset_password/reset_password_page.dart' as _i5;
import '../auth/reset_password_success/reset_password_success_page.dart' as _i6;
import '../core/pdfview_page.dart' as _i28;
import '../core/static_html_viewer.dart' as _i12;
import '../core/webview_page.dart' as _i11;
import '../faq/faq.dart' as _i53;
import '../home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart'
    as _i33;
import '../home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i75;
import '../home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i49;
import '../home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i50;
import '../home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i74;
import '../home/home_tab.dart' as _i62;
import '../home_tab.dart' as _i27;
import '../intro/intro_page.dart' as _i43;
import '../more/more_tab.dart' as _i65;
import '../more/section/about_us/about_us_page.dart' as _i56;
import '../notification/notification_tab.dart' as _i66;
import '../orders/cart/cart_page.dart' as _i18;
import '../orders/cart/checkout/checkout_page.dart' as _i19;
import '../orders/cart/small_order_fee_modal/small_order_fee_modal.dart'
    as _i58;
import '../orders/create_order/scan_material_info.dart' as _i32;
import '../orders/order_success/order_success_page.dart' as _i20;
import '../orders/order_tab/orders_tab.dart' as _i64;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i67;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i68;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i44;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i45;
import '../payments/account_summary/account_summary_page.dart' as _i26;
import '../payments/all_credits/all_credits.dart' as _i60;
import '../payments/all_invoices/all_invoices.dart' as _i59;
import '../payments/credit_details/credit_details.dart' as _i35;
import '../payments/full_summary/full_summary.dart' as _i61;
import '../payments/invoice_details/invoice_details.dart' as _i34;
import '../payments/new_payment/new_payment_page.dart' as _i37;
import '../payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart'
    as _i72;
import '../payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart'
    as _i71;
import '../payments/new_payment/tabs/payment_method/payment_method_tab.dart'
    as _i73;
import '../payments/payment_advice_created/payment_advice_created_page.dart'
    as _i39;
import '../payments/payment_completed/payment_completed_page.dart' as _i40;
import '../payments/payment_failed/payment_failed_page.dart' as _i41;
import '../payments/payment_home/payment_page.dart' as _i22;
import '../payments/payment_summary/payment_summary_page.dart' as _i25;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i31;
import '../payments/payment_webview/payment_webview_page.dart' as _i36;
import '../payments/statement_accounts/statement_accounts.dart' as _i38;
import '../products/bundle_details/bundle_detail_page.dart' as _i46;
import '../products/combo_detail/combo_detail_page.dart' as _i57;
import '../products/product_details/product_details_page.dart' as _i47;
import '../products/product_suggestion/product_suggestion_page.dart' as _i21;
import '../products/products_tab.dart' as _i63;
import '../returns/add_edit_user_restrictions.dart' as _i29;
import '../returns/approver_actions/approver_actions.dart' as _i7;
import '../returns/new_request/new_request_page.dart' as _i54;
import '../returns/new_request/new_request_success/new_request_successful_page.dart'
    as _i55;
import '../returns/new_request/tabs/return_details_tab/return_details_tab.dart'
    as _i77;
import '../returns/new_request/tabs/return_items_tab/return_items_tab.dart'
    as _i76;
import '../returns/new_request/tabs/return_review_tab/return_review_tab.dart'
    as _i78;
import '../returns/policy_configuration/add_policy_configuration.dart' as _i10;
import '../returns/policy_configuration/policy_configuration.dart' as _i9;
import '../returns/return_list/return_by_item_page.dart' as _i69;
import '../returns/return_list/return_by_request_page.dart' as _i70;
import '../returns/return_list/return_root/return_root.dart' as _i30;
import '../returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i48;
import '../returns/return_summary_request_details/return_request_details.dart'
    as _i51;
import '../returns/user_restriction_list.dart' as _i8;
import '../splash/splash_page.dart' as _i1;
import 'router.dart' as _i81;

class AppRouter extends _i79.RootStackRouter {
  AppRouter([_i80.GlobalKey<_i80.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i79.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordPageRouteArgs>(
          orElse: () => const ResetPasswordPageRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ResetPasswordPage(
          key: args.key,
          isFirstLogin: args.isFirstLogin,
        ),
      );
    },
    ResetPasswordSuccessRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordSuccessRouteArgs>(
          orElse: () => const ResetPasswordSuccessRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ResetPasswordSuccess(
          key: args.key,
          isFirstLogin: args.isFirstLogin,
        ),
      );
    },
    ApproverActionsRoute.name: (routeData) {
      final args = routeData.argsAs<ApproverActionsRouteArgs>(
          orElse: () => const ApproverActionsRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.UserRestrictionListPage(),
      );
    },
    PolicyConfigurationPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.PolicyConfigurationPage(),
      );
    },
    AddPolicyConfigurationRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.AddPolicyConfiguration(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i79.MaterialPageX<dynamic>(
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
      return _i79.MaterialPageX<dynamic>(
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
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ContactUsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i14.ContactUsPage(
          key: args.key,
          appMarket: args.appMarket,
        ),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i79.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i16.CustomerSearchPage(),
        transitionsBuilder: _i79.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AupTCPageRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCPageRouteArgs>();
      return _i79.CustomPage<dynamic>(
        routeData: routeData,
        child: _i17.AupTCPage(
          key: args.key,
          user: args.user,
          isMarketPlace: args.isMarketPlace,
        ),
        transitionsBuilder: _i79.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CartPageRoute.name: (routeData) {
      final args = routeData.argsAs<CartPageRouteArgs>(
          orElse: () => const CartPageRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i18.CartPage(
          key: args.key,
          isReOrder: args.isReOrder,
          deliveryInfo: args.deliveryInfo,
        ),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i19.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductSuggestionPageRouteArgs>();
      return _i79.CustomPage<dynamic>(
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
      final args = routeData.argsAs<PaymentPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i22.PaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i23.ProfilePage(),
      );
    },
    EZPointWebviewPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i24.EZPointWebviewPage(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i25.PaymentSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<AccountSummaryRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.AccountSummary(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i27.HomeNavigationTabbar(),
      );
    },
    PdfViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewPageRouteArgs>(
          orElse: () => const PdfViewPageRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i28.PdfViewPage(
          key: args.key,
          url: args.url,
          titleText: args.titleText,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.ReturnRoot(),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryDetailsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i31.PaymentSummaryDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i32.ScanMaterialInfo(),
      );
    },
    AnnouncementInfoDetailsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i33.AnnouncementInfoDetailsPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i34.InvoiceDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.CreditDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentWebviewPageRoute.name: (routeData) {
      return _i79.MaterialPageX<Uri>(
        routeData: routeData,
        child: const _i36.PaymentWebviewPage(),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewPaymentPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i37.NewPaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    StatementAccountsPageRoute.name: (routeData) {
      final args = routeData.argsAs<StatementAccountsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i38.StatementAccountsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentAdviceCreatedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentAdviceCreatedPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i39.PaymentAdviceCreatedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentCompletedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCompletedPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i40.PaymentCompletedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentFailedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentFailedPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i41.PaymentFailedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i42.AdminPoAttachmentPage(key: args.key),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i79.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i43.IntroPage(),
        transitionsBuilder: _i79.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i44.ViewByItemDetailsPage(),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i45.ViewByOrderDetailsPage(),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleDetailPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i46.BundleDetailPage(
          key: args.key,
          materialInfo: args.materialInfo,
          banner: args.banner,
        ),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i47.ProductDetailsPage(
          key: args.key,
          materialInfo: args.materialInfo,
          isEditTender: args.isEditTender,
          banner: args.banner,
        ),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i48.ReturnRequestSummaryByItemDetails(),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i49.AnnouncementsPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i50.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.ReturnRequestDetails(),
      );
    },
    SalesOrgSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SalesOrgSearchRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i52.SalesOrgSearch(
          key: args.key,
          avialableSalesOrgList: args.avialableSalesOrgList,
        ),
      );
    },
    FAQPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.FAQPage(),
      );
    },
    NewRequestPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.NewRequestPage(),
      );
    },
    NewRequestSuccessfulPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.NewRequestSuccessfulPage(),
      );
    },
    AboutUsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i56.AboutUsPage(),
      );
    },
    ComboDetailPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i57.ComboDetailPage(),
      );
    },
    SmallOrderFeePageRoute.name: (routeData) {
      return _i79.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i58.SmallOrderFeePage(),
        customRouteBuilder: _i81.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllInvoicesPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i59.AllInvoicesPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllCreditsPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i60.AllCreditsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    FullSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<FullSummaryPageRouteArgs>();
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i61.FullSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i62.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i63.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i64.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.ViewByOrdersPage(),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i72.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i73.PaymentMethodTab(),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.ArticlesTab(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.AnnouncementsTab(),
      );
    },
    ReturnItemsTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i76.ReturnItemsTab(),
      );
    },
    ReturnDetailsTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i77.ReturnDetailsTab(),
      );
    },
    ReturnReviewTabRoute.name: (routeData) {
      return _i79.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i78.ReturnReviewTab(),
      );
    },
  };

  @override
  List<_i79.RouteConfig> get routes => [
        _i79.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i79.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i79.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i79.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i79.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i79.RouteConfig(
          ResetPasswordPageRoute.name,
          path: 'reset_password',
        ),
        _i79.RouteConfig(
          ResetPasswordSuccessRoute.name,
          path: 'reset_password_success',
        ),
        _i79.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i79.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i79.RouteConfig(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        ),
        _i79.RouteConfig(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        ),
        _i79.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i79.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i79.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i79.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i79.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i79.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i79.RouteConfig(
          AupTCPageRoute.name,
          path: 'terms_of_service',
        ),
        _i79.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i79.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i79.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i79.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i79.RouteConfig(
          PaymentPageRoute.name,
          path: 'payments',
        ),
        _i79.RouteConfig(
          ProfilePageRoute.name,
          path: 'profile',
        ),
        _i79.RouteConfig(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        ),
        _i79.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i79.RouteConfig(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          children: [
            _i79.RouteConfig(
              AllInvoicesPageRoute.name,
              path: 'all_invoices',
              parent: AccountSummaryRoute.name,
            ),
            _i79.RouteConfig(
              AllCreditsPageRoute.name,
              path: 'all_credits',
              parent: AccountSummaryRoute.name,
            ),
            _i79.RouteConfig(
              FullSummaryPageRoute.name,
              path: 'full_summary',
              parent: AccountSummaryRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i79.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i79.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i79.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i79.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i79.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i79.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i79.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          PdfViewPageRoute.name,
          path: 'pdf_view',
        ),
        _i79.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i79.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i79.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i79.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i79.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i79.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i79.RouteConfig(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        ),
        _i79.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i79.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i79.RouteConfig(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        ),
        _i79.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i79.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i79.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i79.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
        ),
        _i79.RouteConfig(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        ),
        _i79.RouteConfig(
          PaymentCompletedPageRoute.name,
          path: 'payments/payment_completed',
        ),
        _i79.RouteConfig(
          PaymentFailedPageRoute.name,
          path: 'payments/payment_failed',
        ),
        _i79.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i79.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i79.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i79.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i79.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i79.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
        _i79.RouteConfig(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        ),
        _i79.RouteConfig(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          children: [
            _i79.RouteConfig(
              ArticlesTabRoute.name,
              path: 'articles_tab',
              parent: AnnouncementsPageRoute.name,
            ),
            _i79.RouteConfig(
              AnnouncementsTabRoute.name,
              path: 'announcements_tab',
              parent: AnnouncementsPageRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          ArticleDetailsRoute.name,
          path: 'article_details',
        ),
        _i79.RouteConfig(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        ),
        _i79.RouteConfig(
          SalesOrgSearchRoute.name,
          path: 'salesOrg_search',
        ),
        _i79.RouteConfig(
          FAQPageRoute.name,
          path: 'faq_page',
        ),
        _i79.RouteConfig(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          children: [
            _i79.RouteConfig(
              ReturnItemsTabRoute.name,
              path: 'returns/new_request/return_items',
              parent: NewRequestPageRoute.name,
            ),
            _i79.RouteConfig(
              ReturnDetailsTabRoute.name,
              path: 'returns/new_request/return_details',
              parent: NewRequestPageRoute.name,
            ),
            _i79.RouteConfig(
              ReturnReviewTabRoute.name,
              path: 'returns/new_request/return_review',
              parent: NewRequestPageRoute.name,
            ),
          ],
        ),
        _i79.RouteConfig(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        ),
        _i79.RouteConfig(
          AboutUsPageRoute.name,
          path: 'about_us',
        ),
        _i79.RouteConfig(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        ),
        _i79.RouteConfig(
          SmallOrderFeePageRoute.name,
          path: 'small_order_fee',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i79.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i79.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i79.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i79.PageRouteInfo<void> {
  const ForgetPasswordConfirmationPageRoute()
      : super(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        );

  static const String name = 'ForgetPasswordConfirmationPageRoute';
}

/// generated route for
/// [_i5.ResetPasswordPage]
class ResetPasswordPageRoute
    extends _i79.PageRouteInfo<ResetPasswordPageRouteArgs> {
  ResetPasswordPageRoute({
    _i80.Key? key,
    bool isFirstLogin = false,
  }) : super(
          ResetPasswordPageRoute.name,
          path: 'reset_password',
          args: ResetPasswordPageRouteArgs(
            key: key,
            isFirstLogin: isFirstLogin,
          ),
        );

  static const String name = 'ResetPasswordPageRoute';
}

class ResetPasswordPageRouteArgs {
  const ResetPasswordPageRouteArgs({
    this.key,
    this.isFirstLogin = false,
  });

  final _i80.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordPageRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i6.ResetPasswordSuccess]
class ResetPasswordSuccessRoute
    extends _i79.PageRouteInfo<ResetPasswordSuccessRouteArgs> {
  ResetPasswordSuccessRoute({
    _i80.Key? key,
    bool isFirstLogin = false,
  }) : super(
          ResetPasswordSuccessRoute.name,
          path: 'reset_password_success',
          args: ResetPasswordSuccessRouteArgs(
            key: key,
            isFirstLogin: isFirstLogin,
          ),
        );

  static const String name = 'ResetPasswordSuccessRoute';
}

class ResetPasswordSuccessRouteArgs {
  const ResetPasswordSuccessRouteArgs({
    this.key,
    this.isFirstLogin = false,
  });

  final _i80.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordSuccessRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i7.ApproverActions]
class ApproverActionsRoute
    extends _i79.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i80.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i80.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i79.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i9.PolicyConfigurationPage]
class PolicyConfigurationPageRoute extends _i79.PageRouteInfo<void> {
  const PolicyConfigurationPageRoute()
      : super(
          PolicyConfigurationPageRoute.name,
          path: 'returns/policy_configuration',
        );

  static const String name = 'PolicyConfigurationPageRoute';
}

/// generated route for
/// [_i10.AddPolicyConfiguration]
class AddPolicyConfigurationRoute extends _i79.PageRouteInfo<void> {
  const AddPolicyConfigurationRoute()
      : super(
          AddPolicyConfigurationRoute.name,
          path: 'returns/add_policy_config',
        );

  static const String name = 'AddPolicyConfigurationRoute';
}

/// generated route for
/// [_i11.WebViewPage]
class WebViewPageRoute extends _i79.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i80.Key? key,
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

  final _i80.Key? key;

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
    extends _i79.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i80.Key? key,
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

  final _i80.Key? key;

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
class ChangePasswordPageRoute extends _i79.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i14.ContactUsPage]
class ContactUsPageRoute extends _i79.PageRouteInfo<ContactUsPageRouteArgs> {
  ContactUsPageRoute({
    _i80.Key? key,
    required _i82.AppMarket appMarket,
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

  final _i80.Key? key;

  final _i82.AppMarket appMarket;

  @override
  String toString() {
    return 'ContactUsPageRouteArgs{key: $key, appMarket: $appMarket}';
  }
}

/// generated route for
/// [_i15.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i79.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i16.CustomerSearchPage]
class CustomerSearchPageRoute extends _i79.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i17.AupTCPage]
class AupTCPageRoute extends _i79.PageRouteInfo<AupTCPageRouteArgs> {
  AupTCPageRoute({
    _i80.Key? key,
    required _i83.User user,
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

  final _i80.Key? key;

  final _i83.User user;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AupTCPageRouteArgs{key: $key, user: $user, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i18.CartPage]
class CartPageRoute extends _i79.PageRouteInfo<CartPageRouteArgs> {
  CartPageRoute({
    _i80.Key? key,
    bool isReOrder = false,
    _i84.DeliveryInfoData? deliveryInfo,
  }) : super(
          CartPageRoute.name,
          path: 'orders/cart',
          args: CartPageRouteArgs(
            key: key,
            isReOrder: isReOrder,
            deliveryInfo: deliveryInfo,
          ),
        );

  static const String name = 'CartPageRoute';
}

class CartPageRouteArgs {
  const CartPageRouteArgs({
    this.key,
    this.isReOrder = false,
    this.deliveryInfo,
  });

  final _i80.Key? key;

  final bool isReOrder;

  final _i84.DeliveryInfoData? deliveryInfo;

  @override
  String toString() {
    return 'CartPageRouteArgs{key: $key, isReOrder: $isReOrder, deliveryInfo: $deliveryInfo}';
  }
}

/// generated route for
/// [_i19.CheckoutPage]
class CheckoutPageRoute extends _i79.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i20.OrderSuccessPage]
class OrderSuccessPageRoute extends _i79.PageRouteInfo<void> {
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
    extends _i79.PageRouteInfo<ProductSuggestionPageRouteArgs> {
  ProductSuggestionPageRoute({
    _i80.Key? key,
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

  final _i80.Key? key;

  final String parentRoute;

  @override
  String toString() {
    return 'ProductSuggestionPageRouteArgs{key: $key, parentRoute: $parentRoute}';
  }
}

/// generated route for
/// [_i22.PaymentPage]
class PaymentPageRoute extends _i79.PageRouteInfo<PaymentPageRouteArgs> {
  PaymentPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentPageRoute.name,
          path: 'payments',
          args: PaymentPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentPageRoute';
}

class PaymentPageRouteArgs {
  const PaymentPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i23.ProfilePage]
class ProfilePageRoute extends _i79.PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [_i24.EZPointWebviewPage]
class EZPointWebviewPageRoute extends _i79.PageRouteInfo<void> {
  const EZPointWebviewPageRoute()
      : super(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        );

  static const String name = 'EZPointWebviewPageRoute';
}

/// generated route for
/// [_i25.PaymentSummaryPage]
class PaymentSummaryPageRoute
    extends _i79.PageRouteInfo<PaymentSummaryPageRouteArgs> {
  PaymentSummaryPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
          args: PaymentSummaryPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentSummaryPageRoute';
}

class PaymentSummaryPageRouteArgs {
  const PaymentSummaryPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i26.AccountSummary]
class AccountSummaryRoute extends _i79.PageRouteInfo<AccountSummaryRouteArgs> {
  AccountSummaryRoute({
    _i80.Key? key,
    required bool isMarketPlace,
    List<_i79.PageRouteInfo>? children,
  }) : super(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          args: AccountSummaryRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountSummaryRoute';
}

class AccountSummaryRouteArgs {
  const AccountSummaryRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AccountSummaryRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i27.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i79.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i79.PageRouteInfo>? children})
      : super(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i28.PdfViewPage]
class PdfViewPageRoute extends _i79.PageRouteInfo<PdfViewPageRouteArgs> {
  PdfViewPageRoute({
    _i80.Key? key,
    String url = '',
    String titleText = '',
  }) : super(
          PdfViewPageRoute.name,
          path: 'pdf_view',
          args: PdfViewPageRouteArgs(
            key: key,
            url: url,
            titleText: titleText,
          ),
        );

  static const String name = 'PdfViewPageRoute';
}

class PdfViewPageRouteArgs {
  const PdfViewPageRouteArgs({
    this.key,
    this.url = '',
    this.titleText = '',
  });

  final _i80.Key? key;

  final String url;

  final String titleText;

  @override
  String toString() {
    return 'PdfViewPageRouteArgs{key: $key, url: $url, titleText: $titleText}';
  }
}

/// generated route for
/// [_i29.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i79.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i80.Key? key,
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

  final _i80.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i30.ReturnRoot]
class ReturnRootRoute extends _i79.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i79.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i31.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute
    extends _i79.PageRouteInfo<PaymentSummaryDetailsPageRouteArgs> {
  PaymentSummaryDetailsPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
          args: PaymentSummaryDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentSummaryDetailsPageRoute';
}

class PaymentSummaryDetailsPageRouteArgs {
  const PaymentSummaryDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i32.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i79.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i33.AnnouncementInfoDetailsPage]
class AnnouncementInfoDetailsPageRoute extends _i79.PageRouteInfo<void> {
  const AnnouncementInfoDetailsPageRoute()
      : super(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        );

  static const String name = 'AnnouncementInfoDetailsPageRoute';
}

/// generated route for
/// [_i34.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i79.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
          args: InvoiceDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'InvoiceDetailsPageRoute';
}

class InvoiceDetailsPageRouteArgs {
  const InvoiceDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i35.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i79.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
          args: CreditDetailsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'CreditDetailsPageRoute';
}

class CreditDetailsPageRouteArgs {
  const CreditDetailsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i36.PaymentWebviewPage]
class PaymentWebviewPageRoute extends _i79.PageRouteInfo<void> {
  const PaymentWebviewPageRoute()
      : super(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        );

  static const String name = 'PaymentWebviewPageRoute';
}

/// generated route for
/// [_i37.NewPaymentPage]
class NewPaymentPageRoute extends _i79.PageRouteInfo<NewPaymentPageRouteArgs> {
  NewPaymentPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
    List<_i79.PageRouteInfo>? children,
  }) : super(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          args: NewPaymentPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
          initialChildren: children,
        );

  static const String name = 'NewPaymentPageRoute';
}

class NewPaymentPageRouteArgs {
  const NewPaymentPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'NewPaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i38.StatementAccountsPage]
class StatementAccountsPageRoute
    extends _i79.PageRouteInfo<StatementAccountsPageRouteArgs> {
  StatementAccountsPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
          args: StatementAccountsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'StatementAccountsPageRoute';
}

class StatementAccountsPageRouteArgs {
  const StatementAccountsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'StatementAccountsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i39.PaymentAdviceCreatedPage]
class PaymentAdviceCreatedPageRoute
    extends _i79.PageRouteInfo<PaymentAdviceCreatedPageRouteArgs> {
  PaymentAdviceCreatedPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
          args: PaymentAdviceCreatedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentAdviceCreatedPageRoute';
}

class PaymentAdviceCreatedPageRouteArgs {
  const PaymentAdviceCreatedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentAdviceCreatedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i40.PaymentCompletedPage]
class PaymentCompletedPageRoute
    extends _i79.PageRouteInfo<PaymentCompletedPageRouteArgs> {
  PaymentCompletedPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentCompletedPageRoute.name,
          path: 'payments/payment_completed',
          args: PaymentCompletedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentCompletedPageRoute';
}

class PaymentCompletedPageRouteArgs {
  const PaymentCompletedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentCompletedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i41.PaymentFailedPage]
class PaymentFailedPageRoute
    extends _i79.PageRouteInfo<PaymentFailedPageRouteArgs> {
  PaymentFailedPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          PaymentFailedPageRoute.name,
          path: 'payments/payment_failed',
          args: PaymentFailedPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'PaymentFailedPageRoute';
}

class PaymentFailedPageRouteArgs {
  const PaymentFailedPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentFailedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i42.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i79.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i80.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i80.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i43.IntroPage]
class IntroPageRoute extends _i79.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i44.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute extends _i79.PageRouteInfo<void> {
  const ViewByItemDetailsPageRoute()
      : super(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        );

  static const String name = 'ViewByItemDetailsPageRoute';
}

/// generated route for
/// [_i45.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute extends _i79.PageRouteInfo<void> {
  const ViewByOrderDetailsPageRoute()
      : super(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        );

  static const String name = 'ViewByOrderDetailsPageRoute';
}

/// generated route for
/// [_i46.BundleDetailPage]
class BundleDetailPageRoute
    extends _i79.PageRouteInfo<BundleDetailPageRouteArgs> {
  BundleDetailPageRoute({
    _i80.Key? key,
    required _i85.MaterialInfo materialInfo,
    _i86.EZReachBanner? banner,
  }) : super(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
          args: BundleDetailPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
            banner: banner,
          ),
        );

  static const String name = 'BundleDetailPageRoute';
}

class BundleDetailPageRouteArgs {
  const BundleDetailPageRouteArgs({
    this.key,
    required this.materialInfo,
    this.banner,
  });

  final _i80.Key? key;

  final _i85.MaterialInfo materialInfo;

  final _i86.EZReachBanner? banner;

  @override
  String toString() {
    return 'BundleDetailPageRouteArgs{key: $key, materialInfo: $materialInfo, banner: $banner}';
  }
}

/// generated route for
/// [_i47.ProductDetailsPage]
class ProductDetailsPageRoute
    extends _i79.PageRouteInfo<ProductDetailsPageRouteArgs> {
  ProductDetailsPageRoute({
    _i80.Key? key,
    required _i85.MaterialInfo materialInfo,
    bool isEditTender = false,
    _i86.EZReachBanner? banner,
  }) : super(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
          args: ProductDetailsPageRouteArgs(
            key: key,
            materialInfo: materialInfo,
            isEditTender: isEditTender,
            banner: banner,
          ),
        );

  static const String name = 'ProductDetailsPageRoute';
}

class ProductDetailsPageRouteArgs {
  const ProductDetailsPageRouteArgs({
    this.key,
    required this.materialInfo,
    this.isEditTender = false,
    this.banner,
  });

  final _i80.Key? key;

  final _i85.MaterialInfo materialInfo;

  final bool isEditTender;

  final _i86.EZReachBanner? banner;

  @override
  String toString() {
    return 'ProductDetailsPageRouteArgs{key: $key, materialInfo: $materialInfo, isEditTender: $isEditTender, banner: $banner}';
  }
}

/// generated route for
/// [_i48.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute extends _i79.PageRouteInfo<void> {
  const ReturnRequestSummaryByItemDetailsRoute()
      : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';
}

/// generated route for
/// [_i49.AnnouncementsPage]
class AnnouncementsPageRoute extends _i79.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i79.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';
}

/// generated route for
/// [_i50.ArticleDetails]
class ArticleDetailsRoute extends _i79.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i80.Key? key,
    required _i87.AnnouncementArticleItem article,
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

  final _i80.Key? key;

  final _i87.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i51.ReturnRequestDetails]
class ReturnRequestDetailsRoute extends _i79.PageRouteInfo<void> {
  const ReturnRequestDetailsRoute()
      : super(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        );

  static const String name = 'ReturnRequestDetailsRoute';
}

/// generated route for
/// [_i52.SalesOrgSearch]
class SalesOrgSearchRoute extends _i79.PageRouteInfo<SalesOrgSearchRouteArgs> {
  SalesOrgSearchRoute({
    _i80.Key? key,
    required List<_i88.SalesOrganisation> avialableSalesOrgList,
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

  final _i80.Key? key;

  final List<_i88.SalesOrganisation> avialableSalesOrgList;

  @override
  String toString() {
    return 'SalesOrgSearchRouteArgs{key: $key, avialableSalesOrgList: $avialableSalesOrgList}';
  }
}

/// generated route for
/// [_i53.FAQPage]
class FAQPageRoute extends _i79.PageRouteInfo<void> {
  const FAQPageRoute()
      : super(
          FAQPageRoute.name,
          path: 'faq_page',
        );

  static const String name = 'FAQPageRoute';
}

/// generated route for
/// [_i54.NewRequestPage]
class NewRequestPageRoute extends _i79.PageRouteInfo<void> {
  const NewRequestPageRoute({List<_i79.PageRouteInfo>? children})
      : super(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          initialChildren: children,
        );

  static const String name = 'NewRequestPageRoute';
}

/// generated route for
/// [_i55.NewRequestSuccessfulPage]
class NewRequestSuccessfulPageRoute extends _i79.PageRouteInfo<void> {
  const NewRequestSuccessfulPageRoute()
      : super(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        );

  static const String name = 'NewRequestSuccessfulPageRoute';
}

/// generated route for
/// [_i56.AboutUsPage]
class AboutUsPageRoute extends _i79.PageRouteInfo<void> {
  const AboutUsPageRoute()
      : super(
          AboutUsPageRoute.name,
          path: 'about_us',
        );

  static const String name = 'AboutUsPageRoute';
}

/// generated route for
/// [_i57.ComboDetailPage]
class ComboDetailPageRoute extends _i79.PageRouteInfo<void> {
  const ComboDetailPageRoute()
      : super(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        );

  static const String name = 'ComboDetailPageRoute';
}

/// generated route for
/// [_i58.SmallOrderFeePage]
class SmallOrderFeePageRoute extends _i79.PageRouteInfo<void> {
  const SmallOrderFeePageRoute()
      : super(
          SmallOrderFeePageRoute.name,
          path: 'small_order_fee',
        );

  static const String name = 'SmallOrderFeePageRoute';
}

/// generated route for
/// [_i59.AllInvoicesPage]
class AllInvoicesPageRoute
    extends _i79.PageRouteInfo<AllInvoicesPageRouteArgs> {
  AllInvoicesPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          AllInvoicesPageRoute.name,
          path: 'all_invoices',
          args: AllInvoicesPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'AllInvoicesPageRoute';
}

class AllInvoicesPageRouteArgs {
  const AllInvoicesPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllInvoicesPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i60.AllCreditsPage]
class AllCreditsPageRoute extends _i79.PageRouteInfo<AllCreditsPageRouteArgs> {
  AllCreditsPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          AllCreditsPageRoute.name,
          path: 'all_credits',
          args: AllCreditsPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'AllCreditsPageRoute';
}

class AllCreditsPageRouteArgs {
  const AllCreditsPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllCreditsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i61.FullSummaryPage]
class FullSummaryPageRoute
    extends _i79.PageRouteInfo<FullSummaryPageRouteArgs> {
  FullSummaryPageRoute({
    _i80.Key? key,
    required bool isMarketPlace,
  }) : super(
          FullSummaryPageRoute.name,
          path: 'full_summary',
          args: FullSummaryPageRouteArgs(
            key: key,
            isMarketPlace: isMarketPlace,
          ),
        );

  static const String name = 'FullSummaryPageRoute';
}

class FullSummaryPageRouteArgs {
  const FullSummaryPageRouteArgs({
    this.key,
    required this.isMarketPlace,
  });

  final _i80.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'FullSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i62.HomeTab]
class HomeTabRoute extends _i79.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i63.ProductsTab]
class ProductsTabRoute extends _i79.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i64.OrdersTab]
class OrdersTabRoute extends _i79.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i79.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i65.MoreTab]
class MoreTabRoute extends _i79.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i66.NotificationTab]
class NotificationTabRoute extends _i79.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i67.ViewByItemsPage]
class ViewByItemsPageRoute extends _i79.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i68.ViewByOrdersPage]
class ViewByOrdersPageRoute extends _i79.PageRouteInfo<void> {
  const ViewByOrdersPageRoute()
      : super(
          ViewByOrdersPageRoute.name,
          path: 'orders/view_by_orders',
        );

  static const String name = 'ViewByOrdersPageRoute';
}

/// generated route for
/// [_i69.ReturnByItemPage]
class ReturnByItemPageRoute extends _i79.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i70.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i79.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i71.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i79.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i72.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i79.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i73.PaymentMethodTab]
class PaymentMethodTabRoute extends _i79.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}

/// generated route for
/// [_i74.ArticlesTab]
class ArticlesTabRoute extends _i79.PageRouteInfo<void> {
  const ArticlesTabRoute()
      : super(
          ArticlesTabRoute.name,
          path: 'articles_tab',
        );

  static const String name = 'ArticlesTabRoute';
}

/// generated route for
/// [_i75.AnnouncementsTab]
class AnnouncementsTabRoute extends _i79.PageRouteInfo<void> {
  const AnnouncementsTabRoute()
      : super(
          AnnouncementsTabRoute.name,
          path: 'announcements_tab',
        );

  static const String name = 'AnnouncementsTabRoute';
}

/// generated route for
/// [_i76.ReturnItemsTab]
class ReturnItemsTabRoute extends _i79.PageRouteInfo<void> {
  const ReturnItemsTabRoute()
      : super(
          ReturnItemsTabRoute.name,
          path: 'returns/new_request/return_items',
        );

  static const String name = 'ReturnItemsTabRoute';
}

/// generated route for
/// [_i77.ReturnDetailsTab]
class ReturnDetailsTabRoute extends _i79.PageRouteInfo<void> {
  const ReturnDetailsTabRoute()
      : super(
          ReturnDetailsTabRoute.name,
          path: 'returns/new_request/return_details',
        );

  static const String name = 'ReturnDetailsTabRoute';
}

/// generated route for
/// [_i78.ReturnReviewTab]
class ReturnReviewTabRoute extends _i79.PageRouteInfo<void> {
  const ReturnReviewTabRoute()
      : super(
          ReturnReviewTabRoute.name,
          path: 'returns/new_request/return_review',
        );

  static const String name = 'ReturnReviewTabRoute';
}
