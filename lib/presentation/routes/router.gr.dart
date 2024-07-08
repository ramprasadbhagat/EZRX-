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
import 'package:auto_route/auto_route.dart' as _i77;
import 'package:flutter/material.dart' as _i78;

import '../../domain/account/entities/sales_organisation.dart' as _i86;
import '../../domain/account/entities/user.dart' as _i81;
import '../../domain/announcement_info/entities/announcement_article_info.dart'
    as _i85;
import '../../domain/auth/value/value_objects.dart' as _i80;
import '../../domain/banner/entities/ez_reach_banner.dart' as _i84;
import '../../domain/order/entities/delivery_info_data.dart' as _i82;
import '../../domain/order/entities/material_info.dart' as _i83;
import '../account/admin_po_attachment/admin_po_attachment_page.dart' as _i40;
import '../account/change_password/change_password_page.dart' as _i11;
import '../account/contact_us/contact_us_page.dart' as _i12;
import '../account/customer_search/customer_search.dart' as _i14;
import '../account/ez_point/ez_point_webview_page.dart' as _i22;
import '../account/notification_settings/notification_settings_page.dart'
    as _i13;
import '../account/profile/profile_page.dart' as _i21;
import '../account/sales_org_search.dart' as _i50;
import '../aup_tc/aup_tc_page.dart' as _i15;
import '../auth/forgot_password/forgot_password_confirmation_page.dart' as _i4;
import '../auth/forgot_password/forgot_password_page.dart' as _i3;
import '../auth/login/login_page.dart' as _i2;
import '../auth/reset_password/reset_password_page.dart' as _i5;
import '../auth/reset_password_success/reset_password_success_page.dart' as _i6;
import '../core/pdfview_page.dart' as _i26;
import '../core/static_html_viewer.dart' as _i10;
import '../core/webview_page.dart' as _i9;
import '../faq/faq.dart' as _i51;
import '../home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart'
    as _i31;
import '../home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart'
    as _i73;
import '../home/announcement_section/announcement_articles_tab/announcements_page.dart'
    as _i47;
import '../home/announcement_section/announcement_articles_tab/articles/article_details.dart'
    as _i48;
import '../home/announcement_section/announcement_articles_tab/articles/articles_tab.dart'
    as _i72;
import '../home/home_tab.dart' as _i60;
import '../home_tab.dart' as _i25;
import '../intro/intro_page.dart' as _i41;
import '../more/more_tab.dart' as _i63;
import '../more/section/about_us/about_us_page.dart' as _i54;
import '../notification/notification_tab.dart' as _i64;
import '../orders/cart/cart_page.dart' as _i16;
import '../orders/cart/checkout/checkout_page.dart' as _i17;
import '../orders/cart/small_order_fee_modal/small_order_fee_modal.dart'
    as _i56;
import '../orders/create_order/scan_material_info.dart' as _i30;
import '../orders/order_success/order_success_page.dart' as _i18;
import '../orders/order_tab/orders_tab.dart' as _i62;
import '../orders/order_tab/section/view_by_item/view_by_item_section.dart'
    as _i65;
import '../orders/order_tab/section/view_by_order/view_by_order_section.dart'
    as _i66;
import '../orders/order_tab/view_by_item_details/view_by_item_details.dart'
    as _i42;
import '../orders/order_tab/view_by_order_details/view_by_order_details.dart'
    as _i43;
import '../payments/account_summary/account_summary_page.dart' as _i24;
import '../payments/all_credits/all_credits.dart' as _i58;
import '../payments/all_invoices/all_invoices.dart' as _i57;
import '../payments/credit_details/credit_details.dart' as _i33;
import '../payments/full_summary/full_summary.dart' as _i59;
import '../payments/invoice_details/invoice_details.dart' as _i32;
import '../payments/new_payment/new_payment_page.dart' as _i35;
import '../payments/new_payment/tabs/available_credits_tab/available_credits_tab.dart'
    as _i70;
import '../payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart'
    as _i69;
import '../payments/new_payment/tabs/payment_method/payment_method_tab.dart'
    as _i71;
import '../payments/payment_advice_created/payment_advice_created_page.dart'
    as _i37;
import '../payments/payment_completed/payment_completed_page.dart' as _i38;
import '../payments/payment_failed/payment_failed_page.dart' as _i39;
import '../payments/payment_home/payment_page.dart' as _i20;
import '../payments/payment_summary/payment_summary_page.dart' as _i23;
import '../payments/payment_summary_details/payment_summary_details_screen.dart'
    as _i29;
import '../payments/payment_webview/payment_webview_page.dart' as _i34;
import '../payments/statement_accounts/statement_accounts.dart' as _i36;
import '../products/bundle_details/bundle_detail_page.dart' as _i44;
import '../products/combo_detail/combo_detail_page.dart' as _i55;
import '../products/product_details/product_details_page.dart' as _i45;
import '../products/product_suggestion/product_suggestion_page.dart' as _i19;
import '../products/products_tab.dart' as _i61;
import '../returns/add_edit_user_restrictions.dart' as _i27;
import '../returns/approver_actions/approver_actions.dart' as _i7;
import '../returns/new_request/new_request_page.dart' as _i52;
import '../returns/new_request/new_request_success/new_request_successful_page.dart'
    as _i53;
import '../returns/new_request/tabs/return_details_tab/return_details_tab.dart'
    as _i75;
import '../returns/new_request/tabs/return_items_tab/return_items_tab.dart'
    as _i74;
import '../returns/new_request/tabs/return_review_tab/return_review_tab.dart'
    as _i76;
import '../returns/return_list/return_by_item_page.dart' as _i67;
import '../returns/return_list/return_by_request_page.dart' as _i68;
import '../returns/return_list/return_root/return_root.dart' as _i28;
import '../returns/return_summary_by_item_details/return_summary_by_item_details.dart'
    as _i46;
import '../returns/return_summary_request_details/return_request_details.dart'
    as _i49;
import '../returns/user_restriction_list.dart' as _i8;
import '../splash/splash_page.dart' as _i1;
import 'router.dart' as _i79;

class AppRouter extends _i77.RootStackRouter {
  AppRouter([_i78.GlobalKey<_i78.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i77.PageFactory> pagesMap = {
    SplashPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ForgetPasswordPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ForgetPasswordPage(),
      );
    },
    ForgetPasswordConfirmationPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ForgetPasswordConfirmationPage(),
      );
    },
    ResetPasswordPageRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordPageRouteArgs>(
          orElse: () => const ResetPasswordPageRouteArgs());
      return _i77.MaterialPageX<dynamic>(
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
      return _i77.MaterialPageX<dynamic>(
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
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.ApproverActions(key: args.key),
      );
    },
    UserRestrictionListPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.UserRestrictionListPage(),
      );
    },
    WebViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPageRouteArgs>(
          orElse: () => const WebViewPageRouteArgs());
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.WebViewPage(
          key: args.key,
          url: args.url,
          initialFile: args.initialFile,
          titleText: args.titleText,
        ),
      );
    },
    StaticHtmlViewerRoute.name: (routeData) {
      final args = routeData.argsAs<StaticHtmlViewerRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.StaticHtmlViewer(
          key: args.key,
          title: args.title,
          htmlPath: args.htmlPath,
          styleCss: args.styleCss,
        ),
      );
    },
    ChangePasswordPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.ChangePasswordPage(),
      );
    },
    ContactUsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ContactUsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i12.ContactUsPage(
          key: args.key,
          appMarket: args.appMarket,
        ),
      );
    },
    NotificationSettingsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationSettingsPage(),
      );
    },
    CustomerSearchPageRoute.name: (routeData) {
      return _i77.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i14.CustomerSearchPage(),
        transitionsBuilder: _i77.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AupTCPageRoute.name: (routeData) {
      final args = routeData.argsAs<AupTCPageRouteArgs>();
      return _i77.CustomPage<dynamic>(
        routeData: routeData,
        child: _i15.AupTCPage(
          key: args.key,
          user: args.user,
          isMarketPlace: args.isMarketPlace,
        ),
        transitionsBuilder: _i77.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CartPageRoute.name: (routeData) {
      final args = routeData.argsAs<CartPageRouteArgs>(
          orElse: () => const CartPageRouteArgs());
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i16.CartPage(
          key: args.key,
          isReOrder: args.isReOrder,
          deliveryInfo: args.deliveryInfo,
        ),
      );
    },
    CheckoutPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.CheckoutPage(),
      );
    },
    OrderSuccessPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.OrderSuccessPage(),
      );
    },
    ProductSuggestionPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductSuggestionPageRouteArgs>();
      return _i77.CustomPage<dynamic>(
        routeData: routeData,
        child: _i19.ProductSuggestionPage(
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
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i20.PaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    ProfilePageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.ProfilePage(),
      );
    },
    EZPointWebviewPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.EZPointWebviewPage(),
      );
    },
    PaymentSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i23.PaymentSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AccountSummaryRoute.name: (routeData) {
      final args = routeData.argsAs<AccountSummaryRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i24.AccountSummary(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    HomeNavigationTabbarRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i25.HomeNavigationTabbar(),
      );
    },
    PdfViewPageRoute.name: (routeData) {
      final args = routeData.argsAs<PdfViewPageRouteArgs>(
          orElse: () => const PdfViewPageRouteArgs());
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i26.PdfViewPage(
          key: args.key,
          url: args.url,
          titleText: args.titleText,
        ),
      );
    },
    AddEditUserRestrictionPageRoute.name: (routeData) {
      final args = routeData.argsAs<AddEditUserRestrictionPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i27.AddEditUserRestrictionPage(
          key: args.key,
          isEditing: args.isEditing,
        ),
      );
    },
    ReturnRootRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i28.ReturnRoot(),
      );
    },
    PaymentSummaryDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentSummaryDetailsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i29.PaymentSummaryDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    ScanMaterialInfoRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i30.ScanMaterialInfo(),
      );
    },
    AnnouncementInfoDetailsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i31.AnnouncementInfoDetailsPage(),
      );
    },
    InvoiceDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<InvoiceDetailsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i32.InvoiceDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    CreditDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<CreditDetailsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i33.CreditDetailsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentWebviewPageRoute.name: (routeData) {
      return _i77.MaterialPageX<Uri>(
        routeData: routeData,
        child: const _i34.PaymentWebviewPage(),
      );
    },
    NewPaymentPageRoute.name: (routeData) {
      final args = routeData.argsAs<NewPaymentPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i35.NewPaymentPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    StatementAccountsPageRoute.name: (routeData) {
      final args = routeData.argsAs<StatementAccountsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i36.StatementAccountsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentAdviceCreatedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentAdviceCreatedPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i37.PaymentAdviceCreatedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentCompletedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCompletedPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i38.PaymentCompletedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    PaymentFailedPageRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentFailedPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i39.PaymentFailedPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AdminPoAttachmentPageRoute.name: (routeData) {
      final args = routeData.argsAs<AdminPoAttachmentPageRouteArgs>(
          orElse: () => const AdminPoAttachmentPageRouteArgs());
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i40.AdminPoAttachmentPage(key: args.key),
      );
    },
    IntroPageRoute.name: (routeData) {
      return _i77.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i41.IntroPage(),
        transitionsBuilder: _i77.TransitionsBuilders.slideBottom,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ViewByItemDetailsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i42.ViewByItemDetailsPage(),
      );
    },
    ViewByOrderDetailsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i43.ViewByOrderDetailsPage(),
      );
    },
    BundleDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<BundleDetailPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i44.BundleDetailPage(
          key: args.key,
          materialInfo: args.materialInfo,
          banner: args.banner,
        ),
      );
    },
    ProductDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i45.ProductDetailsPage(
          key: args.key,
          materialInfo: args.materialInfo,
          isEditTender: args.isEditTender,
          banner: args.banner,
        ),
      );
    },
    ReturnRequestSummaryByItemDetailsRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i46.ReturnRequestSummaryByItemDetails(),
      );
    },
    AnnouncementsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i47.AnnouncementsPage(),
      );
    },
    ArticleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ArticleDetailsRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i48.ArticleDetails(
          key: args.key,
          article: args.article,
        ),
      );
    },
    ReturnRequestDetailsRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i49.ReturnRequestDetails(),
      );
    },
    SalesOrgSearchRoute.name: (routeData) {
      final args = routeData.argsAs<SalesOrgSearchRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i50.SalesOrgSearch(
          key: args.key,
          avialableSalesOrgList: args.avialableSalesOrgList,
        ),
      );
    },
    FAQPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i51.FAQPage(),
      );
    },
    NewRequestPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i52.NewRequestPage(),
      );
    },
    NewRequestSuccessfulPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i53.NewRequestSuccessfulPage(),
      );
    },
    AboutUsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i54.AboutUsPage(),
      );
    },
    ComboDetailPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i55.ComboDetailPage(),
      );
    },
    SmallOrderFeePageRoute.name: (routeData) {
      return _i77.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i56.SmallOrderFeePage(),
        customRouteBuilder: _i79.modalSheetBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AllInvoicesPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllInvoicesPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i57.AllInvoicesPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    AllCreditsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AllCreditsPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i58.AllCreditsPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    FullSummaryPageRoute.name: (routeData) {
      final args = routeData.argsAs<FullSummaryPageRouteArgs>();
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i59.FullSummaryPage(
          key: args.key,
          isMarketPlace: args.isMarketPlace,
        ),
      );
    },
    HomeTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i60.HomeTab(),
      );
    },
    ProductsTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i61.ProductsTab(),
      );
    },
    OrdersTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i62.OrdersTab(),
      );
    },
    MoreTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i63.MoreTab(),
      );
    },
    NotificationTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i64.NotificationTab(),
      );
    },
    ViewByItemsPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i65.ViewByItemsPage(),
      );
    },
    ViewByOrdersPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i66.ViewByOrdersPage(),
      );
    },
    ReturnByItemPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i67.ReturnByItemPage(),
      );
    },
    ReturnByRequestPageRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i68.ReturnByRequestPage(),
      );
    },
    OutstandingInvoicesTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i69.OutstandingInvoicesTab(),
      );
    },
    AvailableCreditsTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i70.AvailableCreditsTab(),
      );
    },
    PaymentMethodTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i71.PaymentMethodTab(),
      );
    },
    ArticlesTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i72.ArticlesTab(),
      );
    },
    AnnouncementsTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i73.AnnouncementsTab(),
      );
    },
    ReturnItemsTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i74.ReturnItemsTab(),
      );
    },
    ReturnDetailsTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i75.ReturnDetailsTab(),
      );
    },
    ReturnReviewTabRoute.name: (routeData) {
      return _i77.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i76.ReturnReviewTab(),
      );
    },
  };

  @override
  List<_i77.RouteConfig> get routes => [
        _i77.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'splash',
          fullMatch: true,
        ),
        _i77.RouteConfig(
          SplashPageRoute.name,
          path: 'splash',
        ),
        _i77.RouteConfig(
          LoginPageRoute.name,
          path: 'login',
        ),
        _i77.RouteConfig(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        ),
        _i77.RouteConfig(
          ForgetPasswordConfirmationPageRoute.name,
          path: 'forgot_password_confirmation',
        ),
        _i77.RouteConfig(
          ResetPasswordPageRoute.name,
          path: 'reset_password',
        ),
        _i77.RouteConfig(
          ResetPasswordSuccessRoute.name,
          path: 'reset_password_success',
        ),
        _i77.RouteConfig(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
        ),
        _i77.RouteConfig(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        ),
        _i77.RouteConfig(
          WebViewPageRoute.name,
          path: 'web_view',
        ),
        _i77.RouteConfig(
          StaticHtmlViewerRoute.name,
          path: 'static_html_viewer',
        ),
        _i77.RouteConfig(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        ),
        _i77.RouteConfig(
          ContactUsPageRoute.name,
          path: 'contact_us',
        ),
        _i77.RouteConfig(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        ),
        _i77.RouteConfig(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        ),
        _i77.RouteConfig(
          AupTCPageRoute.name,
          path: 'terms_of_service',
        ),
        _i77.RouteConfig(
          CartPageRoute.name,
          path: 'orders/cart',
        ),
        _i77.RouteConfig(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        ),
        _i77.RouteConfig(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        ),
        _i77.RouteConfig(
          ProductSuggestionPageRoute.name,
          path: 'product_suggestion_page',
        ),
        _i77.RouteConfig(
          PaymentPageRoute.name,
          path: 'payments',
        ),
        _i77.RouteConfig(
          ProfilePageRoute.name,
          path: 'profile',
        ),
        _i77.RouteConfig(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        ),
        _i77.RouteConfig(
          PaymentSummaryPageRoute.name,
          path: 'payments/payment_summary',
        ),
        _i77.RouteConfig(
          AccountSummaryRoute.name,
          path: 'payments/invoice_credit',
          children: [
            _i77.RouteConfig(
              AllInvoicesPageRoute.name,
              path: 'all_invoices',
              parent: AccountSummaryRoute.name,
            ),
            _i77.RouteConfig(
              AllCreditsPageRoute.name,
              path: 'all_credits',
              parent: AccountSummaryRoute.name,
            ),
            _i77.RouteConfig(
              FullSummaryPageRoute.name,
              path: 'full_summary',
              parent: AccountSummaryRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          children: [
            _i77.RouteConfig(
              HomeTabRoute.name,
              path: 'home',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i77.RouteConfig(
              ProductsTabRoute.name,
              path: 'products',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i77.RouteConfig(
              OrdersTabRoute.name,
              path: 'orders_tab',
              parent: HomeNavigationTabbarRoute.name,
              children: [
                _i77.RouteConfig(
                  ViewByItemsPageRoute.name,
                  path: 'orders/view_by_items',
                  parent: OrdersTabRoute.name,
                ),
                _i77.RouteConfig(
                  ViewByOrdersPageRoute.name,
                  path: 'orders/view_by_orders',
                  parent: OrdersTabRoute.name,
                ),
              ],
            ),
            _i77.RouteConfig(
              MoreTabRoute.name,
              path: 'more',
              parent: HomeNavigationTabbarRoute.name,
            ),
            _i77.RouteConfig(
              NotificationTabRoute.name,
              path: 'notification_tab',
              parent: HomeNavigationTabbarRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          PdfViewPageRoute.name,
          path: 'pdf_view',
        ),
        _i77.RouteConfig(
          AddEditUserRestrictionPageRoute.name,
          path: 'returns/add_edit_user_restriction',
        ),
        _i77.RouteConfig(
          ReturnRootRoute.name,
          path: 'return_root',
          children: [
            _i77.RouteConfig(
              '#redirect',
              path: '',
              parent: ReturnRootRoute.name,
              redirectTo: 'return_by_item',
              fullMatch: true,
            ),
            _i77.RouteConfig(
              ReturnByItemPageRoute.name,
              path: 'return_by_item',
              parent: ReturnRootRoute.name,
            ),
            _i77.RouteConfig(
              ReturnByRequestPageRoute.name,
              path: 'return_by_request',
              parent: ReturnRootRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          PaymentSummaryDetailsPageRoute.name,
          path: 'payments/payment_summary/payment_summary_details',
        ),
        _i77.RouteConfig(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        ),
        _i77.RouteConfig(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        ),
        _i77.RouteConfig(
          InvoiceDetailsPageRoute.name,
          path: 'payments/invoice_details',
        ),
        _i77.RouteConfig(
          CreditDetailsPageRoute.name,
          path: 'payments/credit_details',
        ),
        _i77.RouteConfig(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        ),
        _i77.RouteConfig(
          NewPaymentPageRoute.name,
          path: 'payments/new_payment',
          children: [
            _i77.RouteConfig(
              OutstandingInvoicesTabRoute.name,
              path: 'payments/new_payment/outstanding_invoices',
              parent: NewPaymentPageRoute.name,
            ),
            _i77.RouteConfig(
              AvailableCreditsTabRoute.name,
              path: 'payments/new_payment/available_credits',
              parent: NewPaymentPageRoute.name,
            ),
            _i77.RouteConfig(
              PaymentMethodTabRoute.name,
              path: 'payments/new_payment/payment_method',
              parent: NewPaymentPageRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          StatementAccountsPageRoute.name,
          path: 'payments/statement_accounts',
        ),
        _i77.RouteConfig(
          PaymentAdviceCreatedPageRoute.name,
          path: 'payments/payment_advice_created',
        ),
        _i77.RouteConfig(
          PaymentCompletedPageRoute.name,
          path: 'payments/payment_completed',
        ),
        _i77.RouteConfig(
          PaymentFailedPageRoute.name,
          path: 'payments/payment_failed',
        ),
        _i77.RouteConfig(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
        ),
        _i77.RouteConfig(
          IntroPageRoute.name,
          path: 'intro_page',
        ),
        _i77.RouteConfig(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        ),
        _i77.RouteConfig(
          ViewByOrderDetailsPageRoute.name,
          path: 'orders/view_by_order_details_page',
        ),
        _i77.RouteConfig(
          BundleDetailPageRoute.name,
          path: 'orders/bundle_detail_page',
        ),
        _i77.RouteConfig(
          ProductDetailsPageRoute.name,
          path: 'orders/material_details',
        ),
        _i77.RouteConfig(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        ),
        _i77.RouteConfig(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          children: [
            _i77.RouteConfig(
              ArticlesTabRoute.name,
              path: 'articles_tab',
              parent: AnnouncementsPageRoute.name,
            ),
            _i77.RouteConfig(
              AnnouncementsTabRoute.name,
              path: 'announcements_tab',
              parent: AnnouncementsPageRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          ArticleDetailsRoute.name,
          path: 'article_details',
        ),
        _i77.RouteConfig(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        ),
        _i77.RouteConfig(
          SalesOrgSearchRoute.name,
          path: 'salesOrg_search',
        ),
        _i77.RouteConfig(
          FAQPageRoute.name,
          path: 'faq_page',
        ),
        _i77.RouteConfig(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          children: [
            _i77.RouteConfig(
              ReturnItemsTabRoute.name,
              path: 'returns/new_request/return_items',
              parent: NewRequestPageRoute.name,
            ),
            _i77.RouteConfig(
              ReturnDetailsTabRoute.name,
              path: 'returns/new_request/return_details',
              parent: NewRequestPageRoute.name,
            ),
            _i77.RouteConfig(
              ReturnReviewTabRoute.name,
              path: 'returns/new_request/return_review',
              parent: NewRequestPageRoute.name,
            ),
          ],
        ),
        _i77.RouteConfig(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        ),
        _i77.RouteConfig(
          AboutUsPageRoute.name,
          path: 'about_us',
        ),
        _i77.RouteConfig(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        ),
        _i77.RouteConfig(
          SmallOrderFeePageRoute.name,
          path: 'small_order_fee',
        ),
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashPageRoute extends _i77.PageRouteInfo<void> {
  const SplashPageRoute()
      : super(
          SplashPageRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashPageRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginPageRoute extends _i77.PageRouteInfo<void> {
  const LoginPageRoute()
      : super(
          LoginPageRoute.name,
          path: 'login',
        );

  static const String name = 'LoginPageRoute';
}

/// generated route for
/// [_i3.ForgetPasswordPage]
class ForgetPasswordPageRoute extends _i77.PageRouteInfo<void> {
  const ForgetPasswordPageRoute()
      : super(
          ForgetPasswordPageRoute.name,
          path: 'forgot_password',
        );

  static const String name = 'ForgetPasswordPageRoute';
}

/// generated route for
/// [_i4.ForgetPasswordConfirmationPage]
class ForgetPasswordConfirmationPageRoute extends _i77.PageRouteInfo<void> {
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
    extends _i77.PageRouteInfo<ResetPasswordPageRouteArgs> {
  ResetPasswordPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordPageRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i6.ResetPasswordSuccess]
class ResetPasswordSuccessRoute
    extends _i77.PageRouteInfo<ResetPasswordSuccessRouteArgs> {
  ResetPasswordSuccessRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isFirstLogin;

  @override
  String toString() {
    return 'ResetPasswordSuccessRouteArgs{key: $key, isFirstLogin: $isFirstLogin}';
  }
}

/// generated route for
/// [_i7.ApproverActions]
class ApproverActionsRoute
    extends _i77.PageRouteInfo<ApproverActionsRouteArgs> {
  ApproverActionsRoute({_i78.Key? key})
      : super(
          ApproverActionsRoute.name,
          path: 'returns/approver_actions',
          args: ApproverActionsRouteArgs(key: key),
        );

  static const String name = 'ApproverActionsRoute';
}

class ApproverActionsRouteArgs {
  const ApproverActionsRouteArgs({this.key});

  final _i78.Key? key;

  @override
  String toString() {
    return 'ApproverActionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.UserRestrictionListPage]
class UserRestrictionListPageRoute extends _i77.PageRouteInfo<void> {
  const UserRestrictionListPageRoute()
      : super(
          UserRestrictionListPageRoute.name,
          path: 'returns/user_restrictions',
        );

  static const String name = 'UserRestrictionListPageRoute';
}

/// generated route for
/// [_i9.WebViewPage]
class WebViewPageRoute extends _i77.PageRouteInfo<WebViewPageRouteArgs> {
  WebViewPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final String url;

  final String? initialFile;

  final String titleText;

  @override
  String toString() {
    return 'WebViewPageRouteArgs{key: $key, url: $url, initialFile: $initialFile, titleText: $titleText}';
  }
}

/// generated route for
/// [_i10.StaticHtmlViewer]
class StaticHtmlViewerRoute
    extends _i77.PageRouteInfo<StaticHtmlViewerRouteArgs> {
  StaticHtmlViewerRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final String title;

  final String htmlPath;

  final String styleCss;

  @override
  String toString() {
    return 'StaticHtmlViewerRouteArgs{key: $key, title: $title, htmlPath: $htmlPath, styleCss: $styleCss}';
  }
}

/// generated route for
/// [_i11.ChangePasswordPage]
class ChangePasswordPageRoute extends _i77.PageRouteInfo<void> {
  const ChangePasswordPageRoute()
      : super(
          ChangePasswordPageRoute.name,
          path: 'change_password',
        );

  static const String name = 'ChangePasswordPageRoute';
}

/// generated route for
/// [_i12.ContactUsPage]
class ContactUsPageRoute extends _i77.PageRouteInfo<ContactUsPageRouteArgs> {
  ContactUsPageRoute({
    _i78.Key? key,
    required _i80.AppMarket appMarket,
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

  final _i78.Key? key;

  final _i80.AppMarket appMarket;

  @override
  String toString() {
    return 'ContactUsPageRouteArgs{key: $key, appMarket: $appMarket}';
  }
}

/// generated route for
/// [_i13.NotificationSettingsPage]
class NotificationSettingsPageRoute extends _i77.PageRouteInfo<void> {
  const NotificationSettingsPageRoute()
      : super(
          NotificationSettingsPageRoute.name,
          path: 'notification_settings',
        );

  static const String name = 'NotificationSettingsPageRoute';
}

/// generated route for
/// [_i14.CustomerSearchPage]
class CustomerSearchPageRoute extends _i77.PageRouteInfo<void> {
  const CustomerSearchPageRoute()
      : super(
          CustomerSearchPageRoute.name,
          path: 'customer_search',
        );

  static const String name = 'CustomerSearchPageRoute';
}

/// generated route for
/// [_i15.AupTCPage]
class AupTCPageRoute extends _i77.PageRouteInfo<AupTCPageRouteArgs> {
  AupTCPageRoute({
    _i78.Key? key,
    required _i81.User user,
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

  final _i78.Key? key;

  final _i81.User user;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AupTCPageRouteArgs{key: $key, user: $user, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i16.CartPage]
class CartPageRoute extends _i77.PageRouteInfo<CartPageRouteArgs> {
  CartPageRoute({
    _i78.Key? key,
    bool isReOrder = false,
    _i82.DeliveryInfoData? deliveryInfo,
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

  final _i78.Key? key;

  final bool isReOrder;

  final _i82.DeliveryInfoData? deliveryInfo;

  @override
  String toString() {
    return 'CartPageRouteArgs{key: $key, isReOrder: $isReOrder, deliveryInfo: $deliveryInfo}';
  }
}

/// generated route for
/// [_i17.CheckoutPage]
class CheckoutPageRoute extends _i77.PageRouteInfo<void> {
  const CheckoutPageRoute()
      : super(
          CheckoutPageRoute.name,
          path: 'orders/cart/checkout',
        );

  static const String name = 'CheckoutPageRoute';
}

/// generated route for
/// [_i18.OrderSuccessPage]
class OrderSuccessPageRoute extends _i77.PageRouteInfo<void> {
  const OrderSuccessPageRoute()
      : super(
          OrderSuccessPageRoute.name,
          path: 'orders/order_confirmation',
        );

  static const String name = 'OrderSuccessPageRoute';
}

/// generated route for
/// [_i19.ProductSuggestionPage]
class ProductSuggestionPageRoute
    extends _i77.PageRouteInfo<ProductSuggestionPageRouteArgs> {
  ProductSuggestionPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final String parentRoute;

  @override
  String toString() {
    return 'ProductSuggestionPageRouteArgs{key: $key, parentRoute: $parentRoute}';
  }
}

/// generated route for
/// [_i20.PaymentPage]
class PaymentPageRoute extends _i77.PageRouteInfo<PaymentPageRouteArgs> {
  PaymentPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i21.ProfilePage]
class ProfilePageRoute extends _i77.PageRouteInfo<void> {
  const ProfilePageRoute()
      : super(
          ProfilePageRoute.name,
          path: 'profile',
        );

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [_i22.EZPointWebviewPage]
class EZPointWebviewPageRoute extends _i77.PageRouteInfo<void> {
  const EZPointWebviewPageRoute()
      : super(
          EZPointWebviewPageRoute.name,
          path: 'eZPoint',
        );

  static const String name = 'EZPointWebviewPageRoute';
}

/// generated route for
/// [_i23.PaymentSummaryPage]
class PaymentSummaryPageRoute
    extends _i77.PageRouteInfo<PaymentSummaryPageRouteArgs> {
  PaymentSummaryPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i24.AccountSummary]
class AccountSummaryRoute extends _i77.PageRouteInfo<AccountSummaryRouteArgs> {
  AccountSummaryRoute({
    _i78.Key? key,
    required bool isMarketPlace,
    List<_i77.PageRouteInfo>? children,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AccountSummaryRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i25.HomeNavigationTabbar]
class HomeNavigationTabbarRoute extends _i77.PageRouteInfo<void> {
  const HomeNavigationTabbarRoute({List<_i77.PageRouteInfo>? children})
      : super(
          HomeNavigationTabbarRoute.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'HomeNavigationTabbarRoute';
}

/// generated route for
/// [_i26.PdfViewPage]
class PdfViewPageRoute extends _i77.PageRouteInfo<PdfViewPageRouteArgs> {
  PdfViewPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final String url;

  final String titleText;

  @override
  String toString() {
    return 'PdfViewPageRouteArgs{key: $key, url: $url, titleText: $titleText}';
  }
}

/// generated route for
/// [_i27.AddEditUserRestrictionPage]
class AddEditUserRestrictionPageRoute
    extends _i77.PageRouteInfo<AddEditUserRestrictionPageRouteArgs> {
  AddEditUserRestrictionPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isEditing;

  @override
  String toString() {
    return 'AddEditUserRestrictionPageRouteArgs{key: $key, isEditing: $isEditing}';
  }
}

/// generated route for
/// [_i28.ReturnRoot]
class ReturnRootRoute extends _i77.PageRouteInfo<void> {
  const ReturnRootRoute({List<_i77.PageRouteInfo>? children})
      : super(
          ReturnRootRoute.name,
          path: 'return_root',
          initialChildren: children,
        );

  static const String name = 'ReturnRootRoute';
}

/// generated route for
/// [_i29.PaymentSummaryDetailsPage]
class PaymentSummaryDetailsPageRoute
    extends _i77.PageRouteInfo<PaymentSummaryDetailsPageRouteArgs> {
  PaymentSummaryDetailsPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentSummaryDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i30.ScanMaterialInfo]
class ScanMaterialInfoRoute extends _i77.PageRouteInfo<void> {
  const ScanMaterialInfoRoute()
      : super(
          ScanMaterialInfoRoute.name,
          path: 'orders/scan_material_info',
        );

  static const String name = 'ScanMaterialInfoRoute';
}

/// generated route for
/// [_i31.AnnouncementInfoDetailsPage]
class AnnouncementInfoDetailsPageRoute extends _i77.PageRouteInfo<void> {
  const AnnouncementInfoDetailsPageRoute()
      : super(
          AnnouncementInfoDetailsPageRoute.name,
          path: 'announcement_info_details',
        );

  static const String name = 'AnnouncementInfoDetailsPageRoute';
}

/// generated route for
/// [_i32.InvoiceDetailsPage]
class InvoiceDetailsPageRoute
    extends _i77.PageRouteInfo<InvoiceDetailsPageRouteArgs> {
  InvoiceDetailsPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'InvoiceDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i33.CreditDetailsPage]
class CreditDetailsPageRoute
    extends _i77.PageRouteInfo<CreditDetailsPageRouteArgs> {
  CreditDetailsPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'CreditDetailsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i34.PaymentWebviewPage]
class PaymentWebviewPageRoute extends _i77.PageRouteInfo<void> {
  const PaymentWebviewPageRoute()
      : super(
          PaymentWebviewPageRoute.name,
          path: 'payments/payments_webview',
        );

  static const String name = 'PaymentWebviewPageRoute';
}

/// generated route for
/// [_i35.NewPaymentPage]
class NewPaymentPageRoute extends _i77.PageRouteInfo<NewPaymentPageRouteArgs> {
  NewPaymentPageRoute({
    _i78.Key? key,
    required bool isMarketPlace,
    List<_i77.PageRouteInfo>? children,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'NewPaymentPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i36.StatementAccountsPage]
class StatementAccountsPageRoute
    extends _i77.PageRouteInfo<StatementAccountsPageRouteArgs> {
  StatementAccountsPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'StatementAccountsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i37.PaymentAdviceCreatedPage]
class PaymentAdviceCreatedPageRoute
    extends _i77.PageRouteInfo<PaymentAdviceCreatedPageRouteArgs> {
  PaymentAdviceCreatedPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentAdviceCreatedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i38.PaymentCompletedPage]
class PaymentCompletedPageRoute
    extends _i77.PageRouteInfo<PaymentCompletedPageRouteArgs> {
  PaymentCompletedPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentCompletedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i39.PaymentFailedPage]
class PaymentFailedPageRoute
    extends _i77.PageRouteInfo<PaymentFailedPageRouteArgs> {
  PaymentFailedPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'PaymentFailedPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i40.AdminPoAttachmentPage]
class AdminPoAttachmentPageRoute
    extends _i77.PageRouteInfo<AdminPoAttachmentPageRouteArgs> {
  AdminPoAttachmentPageRoute({_i78.Key? key})
      : super(
          AdminPoAttachmentPageRoute.name,
          path: 'admin_po_attachment',
          args: AdminPoAttachmentPageRouteArgs(key: key),
        );

  static const String name = 'AdminPoAttachmentPageRoute';
}

class AdminPoAttachmentPageRouteArgs {
  const AdminPoAttachmentPageRouteArgs({this.key});

  final _i78.Key? key;

  @override
  String toString() {
    return 'AdminPoAttachmentPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i41.IntroPage]
class IntroPageRoute extends _i77.PageRouteInfo<void> {
  const IntroPageRoute()
      : super(
          IntroPageRoute.name,
          path: 'intro_page',
        );

  static const String name = 'IntroPageRoute';
}

/// generated route for
/// [_i42.ViewByItemDetailsPage]
class ViewByItemDetailsPageRoute extends _i77.PageRouteInfo<void> {
  const ViewByItemDetailsPageRoute()
      : super(
          ViewByItemDetailsPageRoute.name,
          path: 'orders/view_by_item_details_page',
        );

  static const String name = 'ViewByItemDetailsPageRoute';
}

/// generated route for
/// [_i43.ViewByOrderDetailsPage]
class ViewByOrderDetailsPageRoute extends _i77.PageRouteInfo<void> {
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
    extends _i77.PageRouteInfo<BundleDetailPageRouteArgs> {
  BundleDetailPageRoute({
    _i78.Key? key,
    required _i83.MaterialInfo materialInfo,
    _i84.EZReachBanner? banner,
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

  final _i78.Key? key;

  final _i83.MaterialInfo materialInfo;

  final _i84.EZReachBanner? banner;

  @override
  String toString() {
    return 'BundleDetailPageRouteArgs{key: $key, materialInfo: $materialInfo, banner: $banner}';
  }
}

/// generated route for
/// [_i45.ProductDetailsPage]
class ProductDetailsPageRoute
    extends _i77.PageRouteInfo<ProductDetailsPageRouteArgs> {
  ProductDetailsPageRoute({
    _i78.Key? key,
    required _i83.MaterialInfo materialInfo,
    bool isEditTender = false,
    _i84.EZReachBanner? banner,
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

  final _i78.Key? key;

  final _i83.MaterialInfo materialInfo;

  final bool isEditTender;

  final _i84.EZReachBanner? banner;

  @override
  String toString() {
    return 'ProductDetailsPageRouteArgs{key: $key, materialInfo: $materialInfo, isEditTender: $isEditTender, banner: $banner}';
  }
}

/// generated route for
/// [_i46.ReturnRequestSummaryByItemDetails]
class ReturnRequestSummaryByItemDetailsRoute extends _i77.PageRouteInfo<void> {
  const ReturnRequestSummaryByItemDetailsRoute()
      : super(
          ReturnRequestSummaryByItemDetailsRoute.name,
          path: 'returns/return_summary_details_v3',
        );

  static const String name = 'ReturnRequestSummaryByItemDetailsRoute';
}

/// generated route for
/// [_i47.AnnouncementsPage]
class AnnouncementsPageRoute extends _i77.PageRouteInfo<void> {
  const AnnouncementsPageRoute({List<_i77.PageRouteInfo>? children})
      : super(
          AnnouncementsPageRoute.name,
          path: 'announcements_page',
          initialChildren: children,
        );

  static const String name = 'AnnouncementsPageRoute';
}

/// generated route for
/// [_i48.ArticleDetails]
class ArticleDetailsRoute extends _i77.PageRouteInfo<ArticleDetailsRouteArgs> {
  ArticleDetailsRoute({
    _i78.Key? key,
    required _i85.AnnouncementArticleItem article,
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

  final _i78.Key? key;

  final _i85.AnnouncementArticleItem article;

  @override
  String toString() {
    return 'ArticleDetailsRouteArgs{key: $key, article: $article}';
  }
}

/// generated route for
/// [_i49.ReturnRequestDetails]
class ReturnRequestDetailsRoute extends _i77.PageRouteInfo<void> {
  const ReturnRequestDetailsRoute()
      : super(
          ReturnRequestDetailsRoute.name,
          path: 'returns/return_summary_details_by_request',
        );

  static const String name = 'ReturnRequestDetailsRoute';
}

/// generated route for
/// [_i50.SalesOrgSearch]
class SalesOrgSearchRoute extends _i77.PageRouteInfo<SalesOrgSearchRouteArgs> {
  SalesOrgSearchRoute({
    _i78.Key? key,
    required List<_i86.SalesOrganisation> avialableSalesOrgList,
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

  final _i78.Key? key;

  final List<_i86.SalesOrganisation> avialableSalesOrgList;

  @override
  String toString() {
    return 'SalesOrgSearchRouteArgs{key: $key, avialableSalesOrgList: $avialableSalesOrgList}';
  }
}

/// generated route for
/// [_i51.FAQPage]
class FAQPageRoute extends _i77.PageRouteInfo<void> {
  const FAQPageRoute()
      : super(
          FAQPageRoute.name,
          path: 'faq_page',
        );

  static const String name = 'FAQPageRoute';
}

/// generated route for
/// [_i52.NewRequestPage]
class NewRequestPageRoute extends _i77.PageRouteInfo<void> {
  const NewRequestPageRoute({List<_i77.PageRouteInfo>? children})
      : super(
          NewRequestPageRoute.name,
          path: 'returns/new_request',
          initialChildren: children,
        );

  static const String name = 'NewRequestPageRoute';
}

/// generated route for
/// [_i53.NewRequestSuccessfulPage]
class NewRequestSuccessfulPageRoute extends _i77.PageRouteInfo<void> {
  const NewRequestSuccessfulPageRoute()
      : super(
          NewRequestSuccessfulPageRoute.name,
          path: 'returns/new_request_successful',
        );

  static const String name = 'NewRequestSuccessfulPageRoute';
}

/// generated route for
/// [_i54.AboutUsPage]
class AboutUsPageRoute extends _i77.PageRouteInfo<void> {
  const AboutUsPageRoute()
      : super(
          AboutUsPageRoute.name,
          path: 'about_us',
        );

  static const String name = 'AboutUsPageRoute';
}

/// generated route for
/// [_i55.ComboDetailPage]
class ComboDetailPageRoute extends _i77.PageRouteInfo<void> {
  const ComboDetailPageRoute()
      : super(
          ComboDetailPageRoute.name,
          path: 'combo_detail',
        );

  static const String name = 'ComboDetailPageRoute';
}

/// generated route for
/// [_i56.SmallOrderFeePage]
class SmallOrderFeePageRoute extends _i77.PageRouteInfo<void> {
  const SmallOrderFeePageRoute()
      : super(
          SmallOrderFeePageRoute.name,
          path: 'small_order_fee',
        );

  static const String name = 'SmallOrderFeePageRoute';
}

/// generated route for
/// [_i57.AllInvoicesPage]
class AllInvoicesPageRoute
    extends _i77.PageRouteInfo<AllInvoicesPageRouteArgs> {
  AllInvoicesPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllInvoicesPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i58.AllCreditsPage]
class AllCreditsPageRoute extends _i77.PageRouteInfo<AllCreditsPageRouteArgs> {
  AllCreditsPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'AllCreditsPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i59.FullSummaryPage]
class FullSummaryPageRoute
    extends _i77.PageRouteInfo<FullSummaryPageRouteArgs> {
  FullSummaryPageRoute({
    _i78.Key? key,
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

  final _i78.Key? key;

  final bool isMarketPlace;

  @override
  String toString() {
    return 'FullSummaryPageRouteArgs{key: $key, isMarketPlace: $isMarketPlace}';
  }
}

/// generated route for
/// [_i60.HomeTab]
class HomeTabRoute extends _i77.PageRouteInfo<void> {
  const HomeTabRoute()
      : super(
          HomeTabRoute.name,
          path: 'home',
        );

  static const String name = 'HomeTabRoute';
}

/// generated route for
/// [_i61.ProductsTab]
class ProductsTabRoute extends _i77.PageRouteInfo<void> {
  const ProductsTabRoute()
      : super(
          ProductsTabRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsTabRoute';
}

/// generated route for
/// [_i62.OrdersTab]
class OrdersTabRoute extends _i77.PageRouteInfo<void> {
  const OrdersTabRoute({List<_i77.PageRouteInfo>? children})
      : super(
          OrdersTabRoute.name,
          path: 'orders_tab',
          initialChildren: children,
        );

  static const String name = 'OrdersTabRoute';
}

/// generated route for
/// [_i63.MoreTab]
class MoreTabRoute extends _i77.PageRouteInfo<void> {
  const MoreTabRoute()
      : super(
          MoreTabRoute.name,
          path: 'more',
        );

  static const String name = 'MoreTabRoute';
}

/// generated route for
/// [_i64.NotificationTab]
class NotificationTabRoute extends _i77.PageRouteInfo<void> {
  const NotificationTabRoute()
      : super(
          NotificationTabRoute.name,
          path: 'notification_tab',
        );

  static const String name = 'NotificationTabRoute';
}

/// generated route for
/// [_i65.ViewByItemsPage]
class ViewByItemsPageRoute extends _i77.PageRouteInfo<void> {
  const ViewByItemsPageRoute()
      : super(
          ViewByItemsPageRoute.name,
          path: 'orders/view_by_items',
        );

  static const String name = 'ViewByItemsPageRoute';
}

/// generated route for
/// [_i66.ViewByOrdersPage]
class ViewByOrdersPageRoute extends _i77.PageRouteInfo<void> {
  const ViewByOrdersPageRoute()
      : super(
          ViewByOrdersPageRoute.name,
          path: 'orders/view_by_orders',
        );

  static const String name = 'ViewByOrdersPageRoute';
}

/// generated route for
/// [_i67.ReturnByItemPage]
class ReturnByItemPageRoute extends _i77.PageRouteInfo<void> {
  const ReturnByItemPageRoute()
      : super(
          ReturnByItemPageRoute.name,
          path: 'return_by_item',
        );

  static const String name = 'ReturnByItemPageRoute';
}

/// generated route for
/// [_i68.ReturnByRequestPage]
class ReturnByRequestPageRoute extends _i77.PageRouteInfo<void> {
  const ReturnByRequestPageRoute()
      : super(
          ReturnByRequestPageRoute.name,
          path: 'return_by_request',
        );

  static const String name = 'ReturnByRequestPageRoute';
}

/// generated route for
/// [_i69.OutstandingInvoicesTab]
class OutstandingInvoicesTabRoute extends _i77.PageRouteInfo<void> {
  const OutstandingInvoicesTabRoute()
      : super(
          OutstandingInvoicesTabRoute.name,
          path: 'payments/new_payment/outstanding_invoices',
        );

  static const String name = 'OutstandingInvoicesTabRoute';
}

/// generated route for
/// [_i70.AvailableCreditsTab]
class AvailableCreditsTabRoute extends _i77.PageRouteInfo<void> {
  const AvailableCreditsTabRoute()
      : super(
          AvailableCreditsTabRoute.name,
          path: 'payments/new_payment/available_credits',
        );

  static const String name = 'AvailableCreditsTabRoute';
}

/// generated route for
/// [_i71.PaymentMethodTab]
class PaymentMethodTabRoute extends _i77.PageRouteInfo<void> {
  const PaymentMethodTabRoute()
      : super(
          PaymentMethodTabRoute.name,
          path: 'payments/new_payment/payment_method',
        );

  static const String name = 'PaymentMethodTabRoute';
}

/// generated route for
/// [_i72.ArticlesTab]
class ArticlesTabRoute extends _i77.PageRouteInfo<void> {
  const ArticlesTabRoute()
      : super(
          ArticlesTabRoute.name,
          path: 'articles_tab',
        );

  static const String name = 'ArticlesTabRoute';
}

/// generated route for
/// [_i73.AnnouncementsTab]
class AnnouncementsTabRoute extends _i77.PageRouteInfo<void> {
  const AnnouncementsTabRoute()
      : super(
          AnnouncementsTabRoute.name,
          path: 'announcements_tab',
        );

  static const String name = 'AnnouncementsTabRoute';
}

/// generated route for
/// [_i74.ReturnItemsTab]
class ReturnItemsTabRoute extends _i77.PageRouteInfo<void> {
  const ReturnItemsTabRoute()
      : super(
          ReturnItemsTabRoute.name,
          path: 'returns/new_request/return_items',
        );

  static const String name = 'ReturnItemsTabRoute';
}

/// generated route for
/// [_i75.ReturnDetailsTab]
class ReturnDetailsTabRoute extends _i77.PageRouteInfo<void> {
  const ReturnDetailsTabRoute()
      : super(
          ReturnDetailsTabRoute.name,
          path: 'returns/new_request/return_details',
        );

  static const String name = 'ReturnDetailsTabRoute';
}

/// generated route for
/// [_i76.ReturnReviewTab]
class ReturnReviewTabRoute extends _i77.PageRouteInfo<void> {
  const ReturnReviewTabRoute()
      : super(
          ReturnReviewTabRoute.name,
          path: 'returns/new_request/return_review',
        );

  static const String name = 'ReturnReviewTabRoute';
}
