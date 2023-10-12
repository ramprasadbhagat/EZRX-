import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class MoreRobot extends CommonRobot {
  MoreRobot(WidgetTester tester) : super(tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  final profileTile = find.byKey(WidgetKeys.profileTile);
  final contactUsTile = find.byKey(WidgetKeys.contactUsTile);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final paymentTile = find.byKey(WidgetKeys.paymentsTile);

  final loginOnBehalf = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
  final securityTile = find.byKey(WidgetKeys.securityTile);

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapContactUsTile() async {
    await tester.tap(contactUsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapProfileTile() async {
    final profileTile = find.byKey(WidgetKeys.profileTile);
    expect(profileTile, findsOneWidget);
    await tester.tap(profileTile);
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

  Future<void> loginOnBehalfToMoreTab(String userName) async {
    await tester.drag(
      find.byKey(
        WidgetKeys.settingTile,
      ),
      const Offset(0.0, -200),
    );
    await tester.pumpAndSettle();
    await tester.tap(loginOnBehalf);
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(
        WidgetKeys.proxyLoginUserNameField,
      ),
      userName,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey));
    await tester.pumpAndSettle();
  }
}
