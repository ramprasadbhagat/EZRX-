//ignore_for_file: unused-files
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/account/admin_po_attachment/admin_po_attachment_page.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/search_bonus_page.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/combo_deal_material_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/combo_deal/combo_deal_principle_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';
import 'package:ezrxmobile/presentation/account/account_tab.dart';
import 'package:ezrxmobile/presentation/account/change_password/change_password_page.dart';
import 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';
import 'package:ezrxmobile/presentation/account/customer_search.dart';
import 'package:ezrxmobile/presentation/account/notification_settings/notification_settings_page.dart';
import 'package:ezrxmobile/presentation/account/settings_page.dart';
import 'package:ezrxmobile/presentation/account/ship_to_search.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/auth/login_page.dart';
import 'package:ezrxmobile/presentation/auth/proxy_login_page.dart';
import 'package:ezrxmobile/presentation/core/webview_page.dart';
import 'package:ezrxmobile/presentation/favourites/favourite_tab.dart';
import 'package:ezrxmobile/presentation/history/history_tab.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/home_tab.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bundle_item_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_filter.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_root.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/order_template/order_template_list_page.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_detail_page.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_list_page.dart';
import 'package:ezrxmobile/presentation/returns/add_edit_user_restrictions.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/add_policy_configuration.dart';
import 'package:ezrxmobile/presentation/returns/approver_actions/approver_actions.dart';
import 'package:ezrxmobile/presentation/returns/policy_configuration/policy_configuration.dart';
import 'package:ezrxmobile/presentation/returns/request_return/request_return.dart';
import 'package:ezrxmobile/presentation/returns/return_summary/return_summary.dart';
import 'package:ezrxmobile/presentation/returns/return_summary_details/return_summary_details.dart';
import 'package:ezrxmobile/presentation/returns/user_restriction_list.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';

import 'package:ezrxmobile/presentation/history/detail/history_details.dart';

import 'package:ezrxmobile/presentation/orders/create_order/scan_material_info.dart';

//ignore: unused-code
@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Tab',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashPage, initial: true),
    AutoRoute(path: 'login', page: LoginPage),
    AutoRoute(path: 'login_on_behalf', page: LoginOnBehalfPage),
    AutoRoute(path: 'settings', page: SettingsPage),
    AutoRoute(path: 'returns/request_return', page: RequestReturn),
    AutoRoute(path: 'returns/approver_actions', page: ApproverActions),
    AutoRoute(path: 'returns/return_summary', page: ReturnSummary),
    AutoRoute(
      path: 'returns/user_restrictions',
      page: UserRestrictionListPage,
    ),
    AutoRoute(
      path: 'returns/policy_configuration',
      page: PolicyConfigurationPage,
    ),
    AutoRoute(path: 'returns/add_policy_config', page: AddPolicyConfiguration),
    AutoRoute(path: 'web_view', page: WebViewPage),
    AutoRoute(path: 'change_password', page: ChangePasswordPage),
    AutoRoute(path: 'contact_us', page: ContactUsPage),
    AutoRoute(
      path: 'notification_settings',
      page: NotificationSettingsPage,
    ),
    AutoRoute(path: 'customer_search', page: CustomerSearchPage),
    AutoRoute(path: 'ship_to_search', page: ShiptToSearchPage),
    AutoRoute(path: 'orders/material_list', page: MaterialRoot),
    AutoRoute(path: 'orders/material_filter', page: MaterialFilterPage),
    AutoRoute(path: 'tos', page: AupTCDialog),
    AutoRoute(path: 'orders/order_template_list', page: OrderTemplateListPage),
    AutoRoute(path: 'orders/cart', page: CartPage),
    AutoRoute(path: 'orders/order_summary', page: OrderSummaryPage),
    AutoRoute(path: 'orders/order_confirmation', page: OrderSuccessPage),
    AutoRoute(
      path: 'orders/order_template_detail',
      page: OrderTemplateDetailPage,
    ),
    AutoRoute(
      path: 'main_tabbar',
      page: HomeNavigationTabbar,
      children: [
        AutoRoute(page: HomeTab, path: 'home'),
        AutoRoute(page: HistoryTab, path: 'orders/history'),
        AutoRoute(page: FavouritesTab, path: 'orders/favourites'),
        AutoRoute(page: AccountTab, path: 'core/account'),
      ],
    ),
    AutoRoute(path: 'orders/saved_order_list', page: SavedOrderListPage),
    AutoRoute(path: 'orders/saved_order_detail', page: SavedOrderDetailPage),
    AutoRoute(path: 'orders/history_details', page: HistoryDetails),
    AutoRoute(path: 'orders/add_bonus', page: BonusAddPage),
    AutoRoute(
      path: 'returns/add_edit_user_restriction',
      page: AddEditUserRestrictionPage,
    ),
    AutoRoute(
      path: 'orders/scan_material_info',
      page: ScanMaterialInfo,
    ),
    AutoRoute(
      path: 'returns/return_summary_details',
      page: ReturnSummaryDetails,
    ),
    CustomRoute(
      path: 'orders/bundle_item_detail',
      page: BundleItemDetailPage,
      transitionsBuilder: TransitionsBuilders.slideBottom,
      fullscreenDialog: true,
    ),
    AutoRoute(
      path: 'orders/combo_deal_material_detail',
      page: ComboDealMaterialDetailPage,
    ),
    AutoRoute(
      path: 'orders/combo_deal_principle_detail',
      page: ComboDealPrincipleDetailPage,
    ),
    AutoRoute(
      path: 'admin_po_attachment',
      page: AdminPoAttachmentPage,
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
