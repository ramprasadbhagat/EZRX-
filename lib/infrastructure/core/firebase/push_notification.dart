import 'dart:convert';
import 'dart:io';

import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/domain/notification/value/value_object.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

//https://firebase.flutter.dev/docs/messaging/usage
class PushNotificationService {
  static final _fcm = FirebaseMessaging.instance;
  static final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final AppRouter appRouter;
  final Config config;

  PushNotificationService({
    required this.appRouter,
    required this.config,
  }) {
    if (!config.bypassNotificationPermission) {
      _initFirebaseMessaging();
      debugPrint('Push notification initialized!');
    }
  }

  Future<String> getFCMToken() async {
    try {
      return await _fcm.getToken() ?? '';
    } on FirebaseException {
      return '';
    }
  }

  Future<String> getAPNSToken() async {
    try {
      return await _fcm.getAPNSToken() ?? '';
    } on FirebaseException {
      return '';
    }
  }

  Future<String> getToken() async {
    try {
      return Platform.isIOS ? getAPNSToken() : getFCMToken();
    } on FirebaseException {
      return '';
    }
  }

  // ================================================================
  //  Setup Local Notifications
  //
  //
  // ================================================================
  Future<void> _initLocalNotifications() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_notification'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            'com.zuelligpharma.ezrxplus',
            'eZRx notification',
            importance: Importance.max,
          ),
        );

    await _localNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) =>
          _onSelectLocalNotification(details.payload),
    );
  }

  static Future<void> showLocalNotification(
    int notificationId,
    String? notificationTitle,
    String? notificationContent,
    String payload,
  ) async {
    const channelId = 'com.zuelligpharma.ezrxplus';
    const channelTitle = 'eZRx notification';
    const notificationPriority = Priority.high;
    const notificationImportance = Importance.max;

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelTitle,
      importance: notificationImportance,
      priority: notificationPriority,
    );
    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();

    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await _localNotificationsPlugin.show(
      notificationId,
      notificationTitle,
      notificationContent,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  // ================================================================
  // Setup Remote Notifications
  //
  //
  // ================================================================

  Future<void> _initFirebaseMessaging() async {
    await _fcm.setAutoInitEnabled(false);

    await _fcm.requestPermission();

    final status = await Permission.notification.status;
    if (status.isDenied || status.isPermanentlyDenied) {
      await Permission.notification.request();
    }

    await _fcm.setForegroundNotificationPresentationOptions(
      sound: true,
      badge: true,
      alert: true,
    );

    // Continuosaly Listening to notification using [onMessage] stream
    if (status.isGranted) {
      await _initLocalNotifications();
      await _setupRemoteMessageListener();
    } else {
      debugPrint('User declined or has not accepted permission');
    }

    // from terminate mode, app launch when click the push notification banner
    await _fcm.getInitialMessage().then((RemoteMessage? message) async {
      debugPrint(
        'AppPushs getInitialMessage : ${message?.notification?.title} ${message?.notification?.body} ${message?.data}',
      );
      if (message == null) return;
      _redirectTothePage(message);
      // return;
    });
  }

  Future<void>? _setupRemoteMessageListener() {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // from foreground usually won't have the push notification banner display
    // we need to use the local notification plugin to display
    FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
      debugPrint(
        'AppPushs onMessage : ${message?.notification?.title} ${message?.notification?.body} ${message?.data}',
      );
      if (message == null) return;
      final cleverTapId = message.data['wzrk_acct_id'] ?? '';
      _callNotificationApi(message);
      if (cleverTapId.isEmpty) {
        await showLocalNotification(
          message.notification.hashCode,
          message.notification?.title,
          message.notification?.body,
          jsonEncode({'data': message.data}),
        );
      }
    });

    // Handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((
      RemoteMessage? message,
    ) async {
      debugPrint(
        'AppPushs onMessageOpenedApp : ${message?.notification?.title} ${message?.notification?.body} ${message?.data}',
      );
      if (message == null) return;
      _redirectTothePage(message);
    });

    return null;
  }

  Future<dynamic> _onSelectLocalNotification(String? payload) async {
    if (payload == null) return;
    final message = RemoteMessage.fromMap(jsonDecode(payload));
    _redirectTothePage(message);
  }

  void _redirectTothePage(RemoteMessage message) {
    if (message.data['action'] == 'redirect') {
      appRouter.pushNamed(message.data['route_name']);
    }
  }

  void _callNotificationApi(RemoteMessage message) {
    final cleverTapId = message.data['wzrk_acct_id'] ?? '';
    final notificationType = NotificationType(message.data['type'] ?? '');
    if (!notificationType.isValid()) return;
    //check cleverTapId && notification type
    if (config.getCleverTapId == cleverTapId &&
        (notificationType.isOrder ||
            notificationType.isReturn ||
            notificationType.isPayment)) {
      locator<NotificationBloc>().add(const NotificationEvent.fetch());
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(
    'AppPushs onBackgroundMessage : ${message.notification?.title} ${message.notification?.body} ${message.data}',
  );
  await PushNotificationService.showLocalNotification(
    message.notification.hashCode,
    message.notification?.title,
    message.notification?.body,
    jsonEncode({'data': message.data}),
  );
}
