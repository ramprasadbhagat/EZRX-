import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxyLogin/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/routes/router_observer.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _crashlytics = locator<FirebaseCrashlyticsService>().crashlytics;

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint(
      'AppPushs background: ${message.notification?.title} ${message.notification?.body} ${message.data}');
}

Future<void> initialSetup() async {
  if (const bool.fromEnvironment('dart.vm.product')) {
    debugPrint = (String? message, {int? wrapWidth}) {};
  }
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Wakelock.enable();
  await Firebase.initializeApp();
  setupLocator();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  if (!kDebugMode) {
    FlutterError.onError = _crashlytics.recordFlutterError;
  }
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
        child: const App(),
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
        BlocProvider<SalesOrgBloc>(
          create: (context) => locator<SalesOrgBloc>(),
        ),
      ],
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
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
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: const ColoredBox(color: ZPColors.white),
        ),
      ),
    );
  }
}
