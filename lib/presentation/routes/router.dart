//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/account/sales_org_search.dart';
import 'package:ezrxmobile/presentation/account/profile/profile_page.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_passoword_confirmation_page.dart';
import 'package:ezrxmobile/presentation/auth/forgot_password/forgot_password_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/bank_beneficiary_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/add_beneficiary_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/deduction_code/add_deduction_code_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/deduction_code/deduction_code_list_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/bank_benificiary/edit_beneficiary_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_advice_footer/add_payment_advice_footer.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/deduction_code/edit_deduction_code_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_advice_footer/edit_payment_advice_footer.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_configuration_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/add_payment_method_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/edit_payment_method_page.dart';
import 'package:ezrxmobile/presentation/core/static_html_viewer.dart';
import 'package:ezrxmobile/presentation/faq/faq.dart';
import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcement_info_details_page.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/presentation/notification/notification_tab.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/admin_po_attachment_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_methods/payment_methods_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';
import 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';
import 'package:ezrxmobile/presentation/account/customer_search.dart';
import 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/auth/login/login_page.dart';
import 'package:ezrxmobile/presentation/core/webview_page.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bundle_item_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/payment_advice_footer/payment_advice_footer_page.dart';
import 'package:ezrxmobile/presentation/payments/credit_details/credit_details.dart';
import 'package:ezrxmobile/presentation/payments/invoice_details/invoice_details.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/available_credits_tab.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method_tab.dart';
import 'package:ezrxmobile/presentation/payments/new_payment/new_payment.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:ezrxmobile/presentation/payments/payment_page.dart';
import 'package:ezrxmobile/presentation/payments/statement_accounts/statement_accounts.dart';
import 'package:ezrxmobile/presentation/products/bundle_details/bundle_detail_page.dart';
import 'package:ezrxmobile/presentation/products/product_details/product_details_page.dart';
import 'package:ezrxmobile/presentation/returns/add_edit_user_restrictions.dart';
import 'package:ezrxmobile/presentation/returns/new_request/new_request_page.dart';
import 'package:ezrxmobile/presentation/returns/new_request/new_request_successful_page.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_details_tab/return_details_tab.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_items_tab/return_items_tab.dart';
import 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/add_policy_configuration.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/approver_actions.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/policy_configuration.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_item_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_by_request_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_root.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_by_item_details/return_summary_by_item_details.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_request_details/return_request_details.dart';
import 'package:ezrxmobile/presentation/returns/user_restriction_list.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';
import 'package:ezrxmobile/presentation/orders/create_order/scan_material_info.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/sales_district/sales_district_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/sales_district/add_sales_district_page.dart';
import 'package:ezrxmobile/presentation/account/payment_configuration/sales_district/edit_sales_district_page.dart';
import 'package:ezrxmobile/presentation/products/products_tab.dart';
import 'package:ezrxmobile/presentation/more/more_tab.dart';

import 'package:ezrxmobile/presentation/products/product_suggestion_page.dart';

import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements_page.dart';

import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/announcements/announcements_tab.dart';

import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/article_details.dart';

import 'package:ezrxmobile/presentation/home/announcement_section/announcement_articles_tab/articles/articles_tab.dart';

//ignore: unused-code
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Tab',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashPage, initial: true),
    AutoRoute(path: 'login', page: LoginPage),
    AutoRoute(path: 'forgot_password', page: ForgetPasswordPage),
    AutoRoute(
      path: 'forgot_password_confirmation',
      page: ForgetPasswordConfirmationPage,
    ),
    AutoRoute(path: 'settings', page: SettingsPage),
    AutoRoute(path: 'payment_configuration', page: PaymentConfigurationPage),
    AutoRoute(path: 'payment_methods', page: PaymentMethodsPage),
    AutoRoute(path: 'edit_payment_methods', page: EditPaymentMethodsPage),
    AutoRoute(path: 'add_payment_methods', page: AddPaymentMethodsPage),
    AutoRoute(path: 'payments/bank_beneficiary', page: BankBeneficiaryPage),
    AutoRoute(path: 'payments/add_beneficiary', page: AddBeneficiaryPage),
    AutoRoute(path: 'payments/deduction_code', page: DeductionCodeListPage),
    AutoRoute(path: 'payments/add_deduction_code', page: AddDeductionCodePage),
    AutoRoute(path: 'payments/edit_beneficiary', page: EditBeneficiaryPage),
    AutoRoute(
      path: 'payments/edit_deduction_code',
      page: EditDeductionCodePage,
    ),
    //AutoRoute(path: 'returns/request_return', page: RequestReturn),
    AutoRoute(path: 'returns/approver_actions', page: ApproverActions),
    AutoRoute(
      path: 'returns/user_restrictions',
      page: UserRestrictionListPage,
    ),
    AutoRoute(
      path: 'returns/policy_configuration',
      page: PolicyConfigurationPage,
    ),
    AutoRoute(
      path: 'returns/add_policy_config',
      page: AddPolicyConfiguration,
    ),
    AutoRoute(
      path: 'web_view',
      page: WebViewPage,
    ),
    AutoRoute(
      path: 'static_html_viewer',
      page: StaticHtmlViewer,
    ),
    AutoRoute(
      path: 'change_password',
      page: ChangePasswordPage,
    ),
    AutoRoute(
      path: 'contact_us',
      page: ContactUsPage,
    ),
    AutoRoute(
      path: 'notification_settings',
      page: NotificationSettingsPage,
    ),
    AutoRoute(
      path: 'customer_search',
      page: CustomerSearchPage,
    ),
    AutoRoute(
      path: 'terms_of_service',
      page: AupTCDialog,
    ),
    AutoRoute(
      path: 'orders/cart',
      page: CartPage,
    ),
    AutoRoute(
      path: 'orders/cart/checkout',
      page: CheckoutPage,
    ),
    AutoRoute(
      path: 'orders/order_confirmation',
      page: OrderSuccessPage,
    ),
    CustomRoute(
      path: 'product_suggestion_page',
      page: ProductSuggestionPage,
      durationInMilliseconds: 0,
      reverseDurationInMilliseconds: 0,
    ),
    AutoRoute(
      page: PaymentPage,
      path: 'payments',
    ),
    AutoRoute(
      page: ProfilePage,
      path: 'profile',
    ),
    AutoRoute(
      path: 'payments/payment_summary',
      page: PaymentSummaryPage,
    ),
    AutoRoute(
      path: 'payments/invoice_credit',
      page: AccountSummary,
      children: [
        AutoRoute(
          path: 'all_invoices',
          page: AllInvoicesPage,
        ),
        AutoRoute(
          path: 'all_credits',
          page: AllCreditsPage,
        ),
      ],
    ),
    AutoRoute(
      path: 'main',
      page: HomeNavigationTabbar,
      children: [
        AutoRoute(
          page: HomeTab,
          path: 'home',
        ),
        AutoRoute(
          page: ProductsTab,
          path: 'products',
        ),
        AutoRoute(
          page: OrdersTab,
          path: 'orders_tab',
          children: [
            AutoRoute(
              page: ViewByItemsPage,
              path: 'orders/view_by_items',
            ),
            AutoRoute(
              page: ViewByOrdersPage,
              path: 'orders/view_by_orders',
            ),
          ],
        ),
        AutoRoute(
          page: MoreTab,
          path: 'more',
        ),
        AutoRoute(
          page: NotificationTab,
          path: 'notification_tab',
        ),
      ],
    ),

    // =========
    // TODO:  will remove in future
    // ========

    AutoRoute(
      path: 'returns/add_edit_user_restriction',
      page: AddEditUserRestrictionPage,
    ),
    AutoRoute(
      path: 'return_root',
      page: ReturnRoot,
      children: [
        AutoRoute(
          page: ReturnByItemPage,
          path: 'return_by_item',
          initial: true,
        ),
        AutoRoute(
          page: ReturnByRequestPage,
          path: 'return_by_request',
        ),
      ],
    ),
    AutoRoute(
      path: 'payments/payment_summary/payment_summary_details',
      page: PaymentSummaryDetailsPage,
    ),
    AutoRoute(
      path: 'orders/scan_material_info',
      page: ScanMaterialInfo,
    ),
    AutoRoute(
      path: 'announcement_info_details',
      page: AnnouncementInfoDetailsPage,
    ),
    AutoRoute(
      path: 'payments/invoice_details',
      page: InvoiceDetailsPage,
    ),
    AutoRoute(
      path: 'payments/credit_details',
      page: CreditDetailsPage,
    ),
    AutoRoute(
      path: 'payments/new_payment',
      page: NewPaymentPage,
      children: [
        AutoRoute(
          page: OutstandingInvoicesTab,
          path: 'payments/new_payment/outstanding_invoices',
        ),
        AutoRoute(
          page: AvailableCreditsTab,
          path: 'payments/new_payment/available_credits',
        ),
        AutoRoute(
          page: PaymentMethodTab,
          path: 'payments/new_payment/payment_method',
        ),
      ],
    ),
    AutoRoute(
      path: 'payments/statement_accounts',
      page: StatementAccountsPage,
    ),
    CustomRoute(
      path: 'orders/bundle_item_detail',
      page: BundleItemDetailPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
    ),
    CustomRoute(
      path: 'orders/add_to_cart',
      page: AddToCart,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
    ),
    CustomRoute(
      path: 'orders/update_cart',
      page: UpdateCart,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: 'admin_po_attachment',
      page: AdminPoAttachmentPage,
    ),
    AutoRoute(path: 'payments/sales_district', page: SalesDistrictPage),
    AutoRoute(
      path: 'payments/sales_district/add_sales_district',
      page: AddSalesDistrictPage,
    ),
    AutoRoute(
      path: 'payments/sales_district/edit_sales_district',
      page: EditSalesDistrictPage,
    ),
    AutoRoute(
      path: 'payments/advice_footer',
      page: PaymentAdviceFooterPage,
    ),
    AutoRoute(
      path: 'payments/advice_footer/add_advice_footer',
      page: AddPaymentAdviceFooterPage,
    ),
    AutoRoute(
      path: 'payments/advice_footer/edit_advice_footer',
      page: EditPaymentAdviceFooterPage,
    ),
    AutoRoute(path: 'intro_page', page: IntroPage),
    AutoRoute(
      page: ViewByItemDetailsPage,
      path: 'orders/view_by_item_details_page',
    ),
    AutoRoute(
      page: ViewByOrderDetailsPage,
      path: 'orders/view_by_order_details_page',
    ),
    AutoRoute(
      page: BundleDetailPage,
      path: 'orders/bundle_detail_page',
    ),
    AutoRoute(
      path: 'orders/material_details',
      page: ProductDetailsPage,
    ),
    AutoRoute(
      path: 'returns/return_summary_details_v3',
      page: ReturnRequestSummaryByItemDetails,
    ),
    AutoRoute(
      path: 'announcements_page',
      page: AnnouncementsPage,
      children: [
        AutoRoute(
          page: ArticlesTab,
          path: 'articles_tab',
        ),
        AutoRoute(
          page: AnnouncementsTab,
          path: 'announcements_tab',
        ),
      ],
    ),
    AutoRoute(
      path: 'article_details',
      page: ArticleDetails,
    ),
    AutoRoute(
      page: ReturnRequestDetails,
      path: 'returns/return_summary_details_by_request',
    ),
    AutoRoute(
      page: SalesOrgSearch,
      path: 'salesOrg_search',
    ),
    AutoRoute(
      page: FAQPage,
      path: 'faq_page',
    ),
    AutoRoute(
      page: NewRequestPage,
      path: 'returns/new_request',
      children: [
        AutoRoute(
          page: ReturnItemsTab,
          path: 'returns/new_request/return_items',
        ),
        AutoRoute(
          page: ReturnDetailsTab,
          path: 'returns/new_request/return_details',
        ),
        AutoRoute(
          page: ReturnReviewTab,
          path: 'returns/new_request/return_review',
        ),
      ],
    ),
    AutoRoute(
      page: NewRequestSuccessfulPage,
      path: 'returns/new_request_successful',
    ),
  ],
)
class $AppRouter {}

// const authRouter = AutoRoute(
//   name: 'AuthRouter',
//   page: AuthWrapperPage,
//   path: 'auth',
//   children: [
//     AutoRoute(path: 'login', page: LoginPage, initial: true),
//     RedirectRoute(path: '*', redirectTo: ''),
//   ],
// );

// const mainRouter = AutoRoute(
//   initial: true,
//   name: 'MainRouter',
//   page: MainWrapperPage,
//   path: 'main',
//   children: [
//     AutoRoute(
//       path: 'main_tabbar',
//       page: HomeNavigationTabbar,
//       children: [
//         AutoRoute(page: HomeTab),
//         AutoRoute(page: OrderTab),
//         AutoRoute(page: HistoryTab),
//         AutoRoute(page: FavoriteTab),
//       ],
//     ),
//     RedirectRoute(path: '*', redirectTo: ''),
//   ],
// );

// class AuthGuard extends AutoRouteGuard {
//   final AuthBloc authBloc;

//   AuthGuard(this.authBloc);

//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router) {
//     authBloc.state.map(
//       initial: (_) => null,
//       loading: (_) => null,
//       failure: (_) => null,
//       unauthenticated: (_) => router.push(const LoginPageRoute()),
//       authenticated: (_) => resolver.next(),
//     );
//   }
// }
