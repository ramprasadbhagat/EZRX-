import 'package:ezrxmobile/app.dart';
import 'package:ezrxmobile/config.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> runAppForTesting(WidgetTester tester) async {
  await initialSetup(flavor: Flavor.uat);
  runAppWithCrashlyticsAndLocalization();
  await tester.pump();
  await tester.pumpAndSettle();
}
