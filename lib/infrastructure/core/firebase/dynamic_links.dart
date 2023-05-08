import 'dart:async';

import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinksService {
  static final _dynamicLinks = FirebaseDynamicLinks.instance;
  final Config config;
  final AppRouter appRouter;

  DynamicLinksService({required this.config, required this.appRouter});

  Future<StreamSubscription> initDynamicLinks() async {
    // 1. Get the initial dynamic link if the app is opened with a dynamic link
    final data = await _dynamicLinks.getInitialLink();

    // 2. handle link that has been retrieved
    _handleDeepLink(data);

    // 3. Register a link callback to fire if the app is opened up from the background
    // using a dynamic link.
    return _dynamicLinks.onLink.listen((PendingDynamicLinkData data) {
      _handleDeepLink(data);
    });
  }

  void _handleDeepLink(PendingDynamicLinkData? data) {
    final deepLink = data?.link;
    if (deepLink != null) {
      // appRouter.pushNamed(message.data['route_name']);
      debugPrint('_handleDeepLink | deeplink: $deepLink');
      locator<DeepLinkingBloc>().add(
        DeepLinkingEvent.addPendingLink(deepLink),
      );
    }
  }

  Future<String> generateReferralLink() async {
    final parameters = DynamicLinkParameters(
      uriPrefix: config.baseUrl,
      link: Uri.parse('${config.baseUrl}/?action=refer'),
      androidParameters: AndroidParameters(packageName: config.packageName),
      iosParameters: IOSParameters(bundleId: config.packageName),
      // navigationInfoParameters : NavigationInfoParameters( forcedRedirectEnabled : true),
    );

    return parameters.link.toString();
  }
}
