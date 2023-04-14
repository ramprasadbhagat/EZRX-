import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class ShipToSearchRobot {
  final WidgetTester tester;

  ShipToSearchRobot(this.tester);

  void verify() {
    final shipToSearchPage = find.byKey(const Key('shipToSearchPage'));
    expect(shipToSearchPage, findsOneWidget);
  }

  Future<void> search(String shipToCode) async {
    final shipToCodeSearchField =
        find.byKey(const Key('shipToCodeSearchField'));
    expect(shipToCodeSearchField, findsOneWidget);
    await tester.enterText(shipToCodeSearchField, shipToCode);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> tapShipToCode(String shipToCode) async {
    final shipToOption = find.byKey(Key('shipToOption$shipToCode'));
    expect(shipToOption, findsOneWidget);
    await tester.tap(shipToOption);
    await tester.pumpAndSettle();
  }
}
