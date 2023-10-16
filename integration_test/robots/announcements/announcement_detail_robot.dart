import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class AnnouncementDetailRobot {
  final WidgetTester tester;

  AnnouncementDetailRobot(this.tester);

  final announcementDetailPage =
      find.byKey(WidgetKeys.announcementDetailsPageKey);

  void verifyPageVisible() {
    expect(announcementDetailPage, findsOneWidget);
  }
}
