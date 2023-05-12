import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/analytics.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_service.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';

class RouterObserver extends AutoRouterObserver {
  final FirebaseAnalyticsService firebaseAnalyticsService;
  final MixpanelService mixpanelService;
  RouterObserver({
    required this.firebaseAnalyticsService,
    required this.mixpanelService,
  });

  @override
  void didPush(Route route, Route? previousRoute) {
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'Route',
      screenName: route.settings.name,
    );
    _trackMixpanelEvent(route.navigator?.context.router.currentPath ?? '');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _trackMixpanelEvent(
      previousRoute?.navigator?.context.router.currentPath ?? '',
    );
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    firebaseAnalyticsService.analytics.logScreenView(
      screenClass: 'TabPageRoute',
      screenName: route.name,
    );
    _trackMixpanelEvent(route.path, didChangeTab: true);
  }

  void _trackMixpanelEvent(
    String rawRoute, {
    bool didChangeTab = false,
  }) {
    if (rawRoute.isNotEmpty) {
      final pageName = RouterUtils().buildRouteTrackingName(rawRoute);
      if (didChangeTab) {
        mixpanelService.activeNavBarRoute = pageName;
      }
      mixpanelService.trackEvent(
        eventName: MixpanelEvents.pageViewVisited,
        properties: {MixpanelProps.pageViewName: _getPageName(pageName)},
      );
    }
  }

  String _getPageName(String pageName) {
    switch (pageName) {
      case 'Main Page':
        return mixpanelService.activeNavBarRoute;
      case 'Material Root Page':
        return 'Material List Page';
      default:
        return pageName;
    }
  }
}
