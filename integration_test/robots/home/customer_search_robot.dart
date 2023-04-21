import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class CustomerSearchRobot {
  final WidgetTester tester;

  CustomerSearchRobot(this.tester);

  void verify() {
    final customerSearchPage = find.byKey(const Key('customerSearchPage'));
    expect(customerSearchPage, findsOneWidget);
  }

  Future<void> search(String customerCode) async {
    final customerCodeSearchField =
        find.byKey(const Key('customerCodeSearchField'));
    expect(customerCodeSearchField, findsOneWidget);
    await tester.enterText(customerCodeSearchField, customerCode);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> tapCustomerCode(String customerCode) async {
    final customerCodeOptionNew =
        find.byKey(Key('customerCodeOption$customerCode'));
    expect(customerCodeOptionNew, findsOneWidget);
    await tester.tap(customerCodeOptionNew);
    await tester.pumpAndSettle();
    final customerCodeDialogChange =
        find.byKey(const Key('customerCodeDialogChange'));
    if(customerCodeDialogChange.evaluate().isNotEmpty){
      await tester.tap(find.byKey(const Key('Change')));
      await tester.pumpAndSettle();
    }
  }
}
