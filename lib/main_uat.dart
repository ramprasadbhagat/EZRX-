import 'dart:async';

import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';

Future<void> main() async {
  await initialSetup();
  locator<Config>().appFlavor = Flavor.uat;
  runAppWithCrashlytics();
}
