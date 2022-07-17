import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  final FirebaseAnalyticsService firebaseAnalyticsService;
  RouterObserver({required this.firebaseAnalyticsService});

  @override
  void didPush(Route route, Route? previousRoute) {
    debugPrint(
        'New route pushed: ${route.settings.name} ${route.settings.arguments}');
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'Route',
      screenName: route.settings.name,
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    debugPrint(
        'Route poped: ${route.settings.name} ${route.settings.arguments}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab route visited: ${route.name} ${route.path}');
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab route re-visited: ${route.name} ${route.path}');
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
  }
}
