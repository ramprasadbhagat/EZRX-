import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: const Key('notificationTile'),
      leading: const Icon(Icons.notifications_active_outlined),
      title: Text(
        'Notifications'.tr(),
        locale: context.locale,
      ),
      onTap: () {
        context.router.pushNamed('notification_settings_page');
      },
    );
  }
}
