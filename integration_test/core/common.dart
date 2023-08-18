import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

Future<void> runAppForTesting(WidgetTester tester) async {
  Hive.resetAdapters();
  await locator.reset(dispose: true);
  await initialSetup(flavor: Flavor.uat);
  await runAppWithCrashlyticsAndLocalization();
  await tester.pump();
  await tester.pumpAndSettle();
}
