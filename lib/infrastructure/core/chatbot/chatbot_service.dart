import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/infrastructure/core/firebase/push_notification.dart';
import 'package:ymchat_flutter/ymchat_flutter.dart';

class ChatBotService {
  final Config config;
  final PushNotificationService pushNotificationService;
  ChatBotService({required this.config, required this.pushNotificationService});

  Future<void> init() async {
    await YmChat.setBotId(config.getBotId);
    await YmChat.setCustomURL(config.getBotCustomURL);
    await YmChat.showCloseButton(true);
    await YmChat.setVersion(2);
    await YmChat.useLiteVersion(false);
    final fcmToken = await pushNotificationService.getFCMToken();
    await YmChat.setDeviceToken(fcmToken);
  }

  Future<bool> startChatbot() async => await YmChat.startChatbot();

  Future<bool> passPayloadToBot({
    required Map<String, Object> payload,
  }) async =>
      await YmChat.setPayload(payload);
}
