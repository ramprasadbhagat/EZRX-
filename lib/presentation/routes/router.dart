import 'package:auto_route/auto_route.dart';
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
import 'package:ezrxmobile/presentation/orders/create_order/material_filter.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_root.dart';
import 'package:ezrxmobile/presentation/orders/saved_order/saved_order_list_page.dart';
import 'package:ezrxmobile/presentation/order/order_template/order_template_detail_page.dart';
import 'package:ezrxmobile/presentation/order/order_template/order_template_list_page.dart';
import 'package:ezrxmobile/presentation/splash/splash_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Tab',
  routes: <AutoRoute>[
    AutoRoute(path: 'splash', page: SplashPage, initial: true),
    AutoRoute(path: 'login', page: LoginPage),
    AutoRoute(path: 'login_on_behalf', page: LoginOnBehalfPage),
    AutoRoute(path: 'settings', page: SettingsPage),
    AutoRoute(path: 'web_view_page', page: WebViewPage),
    AutoRoute(path: 'change_password_page', page: ChangePasswordPage),
    AutoRoute(path: 'contact_us_page', page: ContactUsPage),
    AutoRoute(
      path: 'notification_settings_page',
      page: NotificationSettingsPage,
    ),
    AutoRoute(path: 'customer_search_page', page: CustomerSearchPage),
    AutoRoute(path: 'ship_to_search_page', page: ShiptToSearchPage),
    AutoRoute(path: 'material_list_page', page: MaterialRoot),
    AutoRoute(path: 'material_list_page', page: MaterialListPage),
    AutoRoute(path: 'material_filter_page', page: MaterialFilterPage),
    AutoRoute(path: 'tos', page: AupTCDialog),
    AutoRoute(path: 'order_template_list_page', page: OrderTemplateListPage),
    AutoRoute(path: 'cart_page', page: CartPage),
    AutoRoute(
      path: 'order_template_detail_page',
      page: OrderTemplateDetailPage,
    ),
    AutoRoute(
      path: 'main_tabbar',
      page: HomeNavigationTabbar,
      children: [
        AutoRoute(page: HomeTab),
        AutoRoute(page: HistoryTab),
        AutoRoute(page: FavouritesTab),
        AutoRoute(page: AccountTab),
      ],
    ),
    AutoRoute(path: 'saved_order_list', page: SavedOrderListPage),
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
