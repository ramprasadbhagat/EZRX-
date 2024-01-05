import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class MoreRobot extends CommonRobot {
  MoreRobot(WidgetTester tester) : super(tester);

  final returnsTile = find.byKey(WidgetKeys.returnsTile);
  final profileTile = find.byKey(WidgetKeys.profileTile);
  final contactUsTile = find.byKey(WidgetKeys.contactUsTile);
  final paymentsTile = find.byKey(WidgetKeys.paymentsTile);
  final newRequestFloatingButton =
      find.byKey(WidgetKeys.returnByItemsNewRequestButton);
  final paymentTile = find.byKey(WidgetKeys.paymentsTile);
  final loginOnBehalf = find.byKey(WidgetKeys.loginOnBehalfButtonKey);
  final securityTile = find.byKey(WidgetKeys.securityTile);
  final logout = find.byKey(WidgetKeys.logOutTile);
  final announcementArticleTile =
      find.byKey(WidgetKeys.announcementArticleTile);
  final scrollList = find.byKey(WidgetKeys.moreTapListContent);

  Future<void> tapReturnsTile() async {
    await tester.tap(returnsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapContactUsTile() async {
    await tester.dragUntilVisible(
      contactUsTile,
      scrollList,
      const Offset(0.0, -200),
    );
    await tester.pump();
    await tester.tap(contactUsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapProfileTile() async {
    final profileTile = find.byKey(WidgetKeys.profileTile);
    expect(profileTile, findsOneWidget);
    await tester.tap(profileTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapPaymentTile() async {
    await tester.tap(paymentsTile);
    await tester.pumpAndSettle();
  }

  Future<void> tapNewRequestFloatingButton() async {
    await tester.tap(newRequestFloatingButton);
  }

  Future<void> tapSecurityTile() async {
    await tester.tap(securityTile);
    await tester.pumpAndSettle();
  }

  void verifyMoreScreenVisible() {
    expect(find.byKey(WidgetKeys.moreScreen), findsOneWidget);
  }

  Future<void> loginOnBehalfToMoreTab(String userName) async {
    await _dragToVerify(loginOnBehalf);
    await tester.tap(loginOnBehalf);
    await tester.pumpAndSettle();
    await tester.enterText(
      find.byKey(WidgetKeys.proxyLoginUserNameField),
      userName,
    );
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(WidgetKeys.loginOnBehalfLoginButtonKey));
  }

  Future<void> verifyAnnouncementArticleTile() =>
      _dragToVerify(announcementArticleTile);

  Future<void> tapAnnouncementArticleTile() async {
    await tester.tap(announcementArticleTile);
    await tester.pumpAndSettle();
  }

  Future<void> findLogout() => _dragToVerify(logout);

  Future<void> tapLogout() async {
    await tester.tap(logout);
    await tester.pumpAndSettle();
  }

  Future<void> _dragToVerify(Finder finder) async {
    await tester.dragUntilVisible(
      finder,
      find.byKey(WidgetKeys.moreTapListContent),
      const Offset(0, -250),
    );
    await tester.pump();
    expect(finder, findsOneWidget);
  }
}
