import 'dart:io';

import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

class UpgradeAlertWrapper extends StatelessWidget {
  final Widget child;
  const UpgradeAlertWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return locator<Config>().appFlavor == Flavor.mock
        ? child
        : UpgradeAlert(
            dialogStyle: Platform.isIOS
                ? UpgradeDialogStyle.cupertino
                : UpgradeDialogStyle.material,
            upgrader: locator<Upgrader>(),
            child: child,
          );
  }
}
