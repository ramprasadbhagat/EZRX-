import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';

class DeepLinkingService {
  final _appLinks = AppLinks();
  bool _initialLinkHandled = false;

  DeepLinkingService();

  Future<StreamSubscription> init() async {
    if (!_initialLinkHandled) {
      // Because init() will be called whenever shipTo changed, this check is to prevent handle
      // the link that open the app more than 1 time
      final initialUri = await _appLinks.getInitialAppLink();
      handleDeepLink(initialUri);
      setInitialLinkHandled();
    }

    return _appLinks.uriLinkStream.listen(handleDeepLink);
  }

  void setInitialLinkHandled() => _initialLinkHandled = true;

  void handleDeepLink(Uri? deepLink) {
    if (deepLink != null) {
      debugPrint('_handleDeepLink | deeplink: $deepLink');
      locator<DeepLinkingBloc>().add(
        DeepLinkingEvent.addPendingLink(deepLink),
      );
    }
  }
}
