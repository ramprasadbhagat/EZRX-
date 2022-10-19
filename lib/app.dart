import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/reset_password/reset_password_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/application/order/stock_information/stock_information_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/additional_bonus/bonus_material_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/saved_order/saved_order_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_list/order_history_list_bloc.dart';
import 'package:ezrxmobile/application/order/order_template_list/order_template_list_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxy_login/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import 'package:upgrader/upgrader.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint(
    'AppPushs background: ${message.notification?.title} ${message.notification?.body} ${message.data}',
  );
}

Future<void> initialSetup() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    await Upgrader.clearSavedSettings();
    if (Platform.isAndroid) {
      await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
    }
  } else {
    debugPrint = (String? message, {int? wrapWidth}) {};
    FlutterError.onError = _crashlytics.recordFlutterError;
  }

  await EasyLocalization.ensureInitialized();
  await Wakelock.enable();
  await Firebase.initializeApp();
  setupLocator();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
        BlocProvider<AuthBloc>(create: (context) => locator<AuthBloc>()),
        BlocProvider<LoginFormBloc>(
          create: (context) => locator<LoginFormBloc>(),
        ),
        BlocProvider<ProxyLoginFormBloc>(
          create: (context) => locator<ProxyLoginFormBloc>(),
        ),
        BlocProvider<UserBloc>(create: (context) => locator<UserBloc>()),
        BlocProvider<BannerBloc>(create: (context) => locator<BannerBloc>()),
        BlocProvider<SalesOrgBloc>(
          create: (context) => locator<SalesOrgBloc>(),
        ),
        BlocProvider<CustomerCodeBloc>(
          create: (context) => locator<CustomerCodeBloc>(),
        ),
        BlocProvider<ShipToCodeBloc>(
          create: (context) => locator<ShipToCodeBloc>(),
        ),
        BlocProvider<AnnouncementBloc>(
          create: (context) => locator<AnnouncementBloc>(),
        ),
        BlocProvider<SavedOrderListBloc>(
          create: (context) => locator<SavedOrderListBloc>(),
        ),
        BlocProvider<MaterialListBloc>(
          create: (context) => locator<MaterialListBloc>(),
        ),
        BlocProvider<FavouriteBloc>(
          create: (context) => locator<FavouriteBloc>(),
        ),
        BlocProvider<OrderHistoryListBloc>(
          create: (context) => locator<OrderHistoryListBloc>(),
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
        BlocProvider<StockInformationBloc>(
          create: (context) => locator<StockInformationBloc>(),
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
