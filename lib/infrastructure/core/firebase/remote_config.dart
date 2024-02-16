import 'dart:convert';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/core/entities/mp_remote_config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/crashlytics.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/mp_remote_config_dto.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/remote_config_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  final _remoteConfig = FirebaseRemoteConfig.instance;

  final Config config;
  final FirebaseCrashlyticsService firebaseCrashlyticsService;

  RemoteConfigService({
    required this.config,
    required this.firebaseCrashlyticsService,
  });

  Future<void> init() async {
    try {
      await _setConfig();
      await _setInAppDefaultValues();
      await _remoteConfig.fetchAndActivate();
    } catch (exception, stacktrace) {
      await firebaseCrashlyticsService.crashlytics.recordError(
        exception,
        stacktrace,
      );
    } finally {
      await _updateConfigs(RemoteConfigUpdate({}));
    }
  }

  List<String> get enableMarketPlaceMarkets {
    final configAsJson = jsonDecode(
      _remoteConfig
          .getValue(RemoteConfigConstants.enableMarketPlace)
          .asString(),
    );

    //JSON sample: {"marketplaceConfig":{"whitelist":["HK"]}}
    return MPRemoteConfigDto.fromJson(configAsJson).toDomain.whiteList;
  }

  /// Setting in-app default parameter values to make app behave as intended
  /// before it connects or if no values are set in the Remote Config backend
  Future<void> _setInAppDefaultValues() async {
    await _remoteConfig.setDefaults(
      {
        RemoteConfigConstants.enableMarketPlace: jsonEncode(
          MPRemoteConfigDto.fromDomain(MPRemoteConfig.empty()).toJson(),
        ),
      },
    );
  }

  /// Setting minimum fetch interval to allow for frequent refreshes
  Future<void> _setConfig() async {
    if (!kIsWeb) {
      _remoteConfig.onConfigUpdated.listen(_updateConfigs, onError: (_) {});
    }
    if (kDebugMode) {
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(
            minutes: 1,
          ),
          minimumFetchInterval: const Duration(
            minutes: 10,
          ),
        ),
      );
    }
  }

  Future<void> _updateConfigs(RemoteConfigUpdate remoteConfigUpdate) =>
      _remoteConfig.activate();
}
