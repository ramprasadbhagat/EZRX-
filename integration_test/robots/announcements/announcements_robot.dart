import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class AnnouncementsRobot {
  final WidgetTester tester;

  AnnouncementsRobot(this.tester);

  final announcementsLabel = find.byKey(WidgetKeys.announcementsTab);

  void verifyGoToAnnouncementsPage() {
    expect(announcementsLabel, findsOneWidget);
  }
}
