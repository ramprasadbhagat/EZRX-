import 'package:countly_flutter/countly_config.dart';
import 'package:countly_flutter/countly_flutter.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter/foundation.dart';

class CountlyService {
  final Config config;
  CountlyService({required this.config});

  Future<void> init() async {
    if (kIsWeb) {
      return;
    }
    await Countly.isInitialized().then((bool isInitialized) {
      if (!isInitialized) {
        final countlyConfig = CountlyConfig(
          config.getCountlyServerUrl,
          config.getCountlyApiKey,
        )
          ..setRecordAppStartTime(true)
          ..setLoggingEnabled(true)
          ..enableCrashReporting();
        Countly.appLoadingFinished();
        Countly.askForNotificationPermission();
        Countly.initWithConfig(countlyConfig).then((value) {
          Countly.start();
          Countly.onNotification((String notification) {
            debugPrint('countly notification : $notification');
          });
          Countly.giveAllConsent();
        });
      } else {
        debugPrint('Countly: Already initialized.');
      }
    });
  }

  Future<void> recordCountlyView(String screenName) async {
    await Countly.recordView(screenName);
  }

  Future<void> addCountlyEvent(String keyValue, {dynamic segmentation}) async {
    final event = {'key': keyValue, 'count': 1};
    if (segmentation != null) {
      event['segmentation'] = segmentation;
    }
    await Countly.recordEvent(event).then((value) => debugPrint(value));
  }
}
