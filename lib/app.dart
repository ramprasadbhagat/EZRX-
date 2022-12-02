import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/sales_rep/sales_rep_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/price_override/price_override_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/download_attachment/bloc/download_attachment_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_details/order_history_details_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter_by_status/order_history_filter_by_status_bloc.dart';
import 'package:ezrxmobile/application/order/order_summary/order_summary_bloc.dart';
import 'package:ezrxmobile/application/order/stock_information/stock_information_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/payment_customer_information/payment_customer_information_bloc.dart';
import 'package:ezrxmobile/application/order/payment_term/payment_term_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/account/datasource/account_selector_storage.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cart_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/cred_storage.dart';
import 'package:ezrxmobile/infrastructure/core/local_storage/token_storage.dart';
import 'package:ezrxmobile/infrastructure/core/okta/okta_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'package:wakelock/wakelock.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint(
    'AppPushs background: ${message.notification?.title} ${message.notification?.body} ${message.data}',
  );
}

Future<void> initialSetup({required Flavor flavor}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Wakelock.enable();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  setupLocator();
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  } else {
    debugPrint = (String? message, {int? wrapWidth}) {};
    FlutterError.onError = _crashlytics.recordFlutterError;
  }

  locator<Config>().appFlavor = flavor;
  await locator<RemoteConfigService>().init();
  await locator<TokenStorage>().init();
  await locator<CredStorage>().init();
  await locator<OktaLoginServices>().init();
  await locator<AccountSelectorStorage>().init();
  await locator<CartStorage>().init();
  await locator<CountlyService>().init();
}

void runAppWithCrashlyticsAndLocalization() {
  runZonedGuarded(
    () => runApp(
      EasyLocalization(
        supportedLocales: const [
          Locale('en', 'SG'),
          Locale('th', 'TH'),
          Locale('zh', 'TW'),
          Locale('my', 'MY'),
          Locale('vi', 'VN'),
          Locale('km', 'KH'),
        ],
        path: 'assets/langs/langs.csv',
        fallbackLocale: const Locale('en', 'SG'),
        saveLocale: true,
        useOnlyLangCode: false,
        assetLoader: CsvAssetLoader(),
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return const App();
          },
        ),
      ),
    ),
    (error, stack) => _crashlytics.recordError(error, stack),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = locator<AppRouter>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => locator<AuthBloc>()..add(const AuthEvent.init()),
        ),
        BlocProvider<LoginFormBloc>(
          create: (context) => locator<LoginFormBloc>(),
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => locator<ProxyLoginFormBloc>(),
        ),
        BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),
        BlocProvider<BannerBloc>(create: (context) => locator<BannerBloc>()),
        BlocProvider<SalesOrgBloc>(
          create: (context) =>
              locator<SalesOrgBloc>()..add(const SalesOrgEvent.initialized()),
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => locator<CustomerCodeBloc>(),
        ),
        BlocProvider<ShipToCodeBloc>(
          create: (context) => locator<ShipToCodeBloc>(),
        ),
        BlocProvider<EligibilityBloc>(
          create: (context) => locator<EligibilityBloc>(),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => locator<AnnouncementBloc>()
            ..add(const AnnouncementEvent.getAnnouncement()),
        ),
        BlocProvider<SavedOrderListBloc>(
          create: (context) => locator<SavedOrderListBloc>(),
        ),
        BlocProvider<MaterialFilterBloc>(
          create: (context) => locator<MaterialFilterBloc>(),
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => locator<MaterialListBloc>(),
        ),
        BlocProvider<MaterialBundleListBloc>(
          create: (context) => locator<MaterialBundleListBloc>(),
        ),
        BlocProvider<CovidMaterialListBloc>(
          create: (context) => locator<CovidMaterialListBloc>(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => locator<FavouriteBloc>(),
        ),
        BlocProvider<OrderHistoryListBloc>(
          create: (context) => locator<OrderHistoryListBloc>(),
        ),
        BlocProvider<OrderHistoryFilterBloc>(
          create: (context) => locator<OrderHistoryFilterBloc>(),
        ),
        BlocProvider<ResetPasswordBloc>(
          create: (context) => locator<ResetPasswordBloc>(),
        ),
        BlocProvider<AupTcBloc>(
          create: (context) => locator<AupTcBloc>(),
        ),
        BlocProvider<MaterialPriceBloc>(
          create: (context) => locator<MaterialPriceBloc>(),
        ),
        BlocProvider<BonusMaterialBloc>(
          create: (context) => locator<BonusMaterialBloc>(),
        ),
        BlocProvider<OrderTemplateListBloc>(
          create: (context) => locator<OrderTemplateListBloc>(),
        ),
        BlocProvider<MaterialPriceDetailBloc>(
          create: (context) => locator<MaterialPriceDetailBloc>(),
        ),
        BlocProvider<StockInformationBloc>(
          create: (context) => locator<StockInformationBloc>(),
        ),
        BlocProvider<PaymentCustomerInformationBloc>(
          create: (context) => locator<PaymentCustomerInformationBloc>(),
        ),
        BlocProvider<SalesRepBloc>(
          create: (context) => locator<SalesRepBloc>(),
        ),
        BlocProvider<PaymentTermBloc>(
          create: (context) => locator<PaymentTermBloc>(),
        ),
        BlocProvider<CovidMaterialListBloc>(
          create: (context) => locator<CovidMaterialListBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) =>
              locator<CartBloc>()..add(const CartEvent.fetch()),
        ),
        BlocProvider<PriceOverrideBloc>(
          create: (context) => locator<PriceOverrideBloc>(),
        ),
        BlocProvider<AddToCartBloc>(
          create: (context) => locator<AddToCartBloc>(),
        ),
        BlocProvider<OrderSummaryBloc>(
          create: (context) => locator<OrderSummaryBloc>(),
        ),
        BlocProvider<OrderDocumentTypeBloc>(
          create: (context) => locator<OrderDocumentTypeBloc>(),
        ),
        BlocProvider<OrderHistoryDetailsBloc>(
          create: (context) => locator<OrderHistoryDetailsBloc>(),
        ),
        BlocProvider<DownloadAttachmentBloc>(
          create: (context) => locator<DownloadAttachmentBloc>(),
        ),
        BlocProvider<OrderHistoryFilterByStatusBloc>(
          create: (context) => locator<OrderHistoryFilterByStatusBloc>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: context.locale,
        title: locator<Config>().appName,
        theme: appThemeData[AppTheme.light],
        // darkTheme: appThemeData[AppTheme.dark],
        // themeMode: ThemeMode.system,
        routerDelegate: AutoRouterDelegate(
          router,
          navigatorObservers: () => [
            locator<FirebaseAnalyticsService>().observer,
            locator<RouterObserver>(),
          ],
        ),
        routeInformationParser: router.defaultRouteParser(),
        // builder: (context, child) => ResponsiveWrapper.builder(
        //   child,
        //   maxWidth: 1200,
        //   minWidth: 480,
        //   defaultScale: true,
        //   breakpoints: const [
        //     ResponsiveBreakpoint.resize(360, name: MOBILE),
        //     ResponsiveBreakpoint.resize(800, name: TABLET),
        //     ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        //   ],
        //   background: const ColoredBox(color: ZPColors.white),
        // ),
      ),
    );
  }
}
