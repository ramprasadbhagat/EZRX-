import 'dart:async';

import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/auth/proxyLogin/proxy_login_form_bloc.dart';
import 'package:ezrxmobile/application/user/user_bloc.dart';
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
  await Wakelock.enable();
  await Firebase.initializeApp();
  setupLocator();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FlutterError.onError = _crashlytics.recordFlutterError;
}

void runAppWithCrashlytics() {
  runZonedGuarded(
    () => runApp(const App()),
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
      ],
      child: MaterialApp.router(
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
          background: Container(color: const Color(0xFFF5F5F5))),
      ),
    );
  }
}
