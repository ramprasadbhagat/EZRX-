import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfirmClearDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required VoidCallback onConfirmed,
    required VoidCallback onCancel,
    String confirmText = 'Change',
    String cancelText = 'Cancel',
  }) {
    showPlatformDialog(
      context: context,
      barrierDismissible: true,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return PlatformAlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            PlatformDialogAction(
              key: Key(cancelText),
              child: Text(cancelText).tr(),
              onPressed: () {
                onCancel();
              },
            ),
            PlatformDialogAction(
              key: Key(confirmText),
              child: Text(confirmText).tr(),
              onPressed: () {
                onConfirmed();
              },
            ),
          ],
        );
      },
    );
  }
}
