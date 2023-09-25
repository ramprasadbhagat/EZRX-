import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class MoreRobot {
  final WidgetTester tester;

  MoreRobot(this.tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
  }
}
