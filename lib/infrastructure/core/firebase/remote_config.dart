import 'package:ezrxmobile/infrastructure/core/firebase/remote_config_constants.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

class RemoteConfigService {
  final remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> init() async {
    await setConfigForDevelopment();
    await setInAppDefaultValues();
    await remoteConfig.fetchAndActivate();
  }

  bool getTncConfig() {
    return getBool(RemoteConfigConstants.enableTnc);
  }

  bool getReturnsConfig() {
    return getBool(RemoteConfigConstants.enableReturns);
  }

  /// Setting in-app default parameter values to make app behave as intended
  /// before it connects or if no values are set in the Remote Config backend
  Future<void> setInAppDefaultValues() async {
    await remoteConfig.setDefaults(
      const {
        RemoteConfigConstants.enableTnc: false,
      },
    );
  }

  /// Setting minimum fetch interval to allow for frequent refreshes
  Future<void> setConfigForDevelopment() async {
    if (kDebugMode) {
      await remoteConfig.setConfigSettings(
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

  bool getBool(String remoteConfigKey) {
    return remoteConfig.getBool(remoteConfigKey);
  }
}
