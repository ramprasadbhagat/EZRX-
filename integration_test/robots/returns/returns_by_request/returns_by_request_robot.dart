import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class ReturnsByRequestRobot {
  final WidgetTester tester;

  ReturnsByRequestRobot(this.tester);

  final searchBar = find.byKey(WidgetKeys.returnByRequestSearchBar);
  final filterButton = find.byKey(WidgetKeys.returnByRequestFilterButton);
  final newRequestButton =
      find.byKey(WidgetKeys.returnByRequestNewRequestButton);

  void verifySearchBarVisible() {
    expect(searchBar, findsOneWidget);
  }

  void verifyFilterButtonVisible() {
    expect(filterButton, findsOneWidget);
  }

  void verifyNewRequestButtonVisible() {
    expect(newRequestButton, findsOneWidget);
  }
}
