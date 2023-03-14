import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomDialogs {
  static Future<void> confirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    Future<void> Function()? onCancelPressed,
    Future<void> Function()? onAcceptPressed,
    String confirmText = 'OK',
    String cancelText = 'Cancel',
  }) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext ctx) {
        return PlatformAlertDialog(
          key: const Key('confirmDialog'),
          title: Text(title).tr(),
          content: Text(message).tr(),
          actions: [
            PlatformDialogAction(
              key: Key(cancelText),
              child: Text(cancelText).tr(),
              onPressed: () async {
                if (onCancelPressed != null) await onCancelPressed();
                if (context.mounted) await context.router.pop();
              },
            ),
            PlatformDialogAction(
              key: Key(confirmText),
              onPressed: () async {
                if (onAcceptPressed != null) await onAcceptPressed();
                if (context.mounted) await context.router.pop();
              },
              child: Text(confirmText).tr(),
            ),
          ],
        );
      },
    );
  }
}
