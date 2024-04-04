import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:universal_io/io.dart';

class ClevertapService {
  final Config config;
  final PushNotificationService pushNotificationService;

  ClevertapService({
    required this.config,
    required this.pushNotificationService,
  });

  Future<void> init() async {
    if (config.appFlavor != Flavor.prod) {
      await CleverTapPlugin.setDebugLevel(3);
    }
    await createNotificationChannel();
    await setPushToken();
    if (Platform.isIOS) {
      await CleverTapPlugin.registerForPush();
    }
  }

  Future<void> createNotificationChannel() async {
    await CleverTapPlugin.createNotificationChannel(
      config.packageName,
      'eZRx notification',
      config.appName,
      3,
      true,
    );
  }

  Future<void> setPushToken() async {
    final token = await pushNotificationService.getToken();
    await CleverTapPlugin.setPushToken(token);
  }

  Future<void> setUser({
    required String name,
    required String username,
    required String email,
    required String role,
  }) async {
    await CleverTapPlugin.onUserLogin(
      {
        'Name': name,
        'Identity': username,
        'Email': email,
        'Role': role,
        'MSG-push': true,
      },
    );
  }

  Future<void> logout() async {
    await CleverTapPlugin.profileSet(
      {'MSG-push': false},
    );
  }

  void trackEvent({
    required String eventName,
    required Map<String, dynamic> properties,
  }) {
    CleverTapPlugin.recordEvent(
      eventName,
      properties,
    );
  }
}
