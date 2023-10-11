import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class MoreRobot extends CommonRobot {
  MoreRobot(WidgetTester tester) : super(tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final paymentTile = find.byKey(WidgetKeys.paymentsTile);
  final securityTile = find.byKey(WidgetKeys.securityTile);

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
  }

  Future<void> tapPaymentTile() async {
    await tester.tap(paymentTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapSecurityTile() async {
    await tester.tap(securityTile);
    await tester.pumpAndSettle();
  }

  void verifyMoreScreenVisible() {
    expect(find.byKey(WidgetKeys.moreScreen), findsOneWidget);
  }
}
