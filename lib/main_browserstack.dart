import 'dart:async';

import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_driver/driver_extension.dart';

Future<void> main() async {
  enableFlutterDriverExtension();
  await initialSetup(flavor: Flavor.uat);
  runAppWithCrashlyticsAndLocalization();
}
