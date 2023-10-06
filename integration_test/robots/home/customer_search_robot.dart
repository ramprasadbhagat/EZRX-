import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class CustomerSearchRobot {
  final WidgetTester tester;

  CustomerSearchRobot(this.tester);

  final confirmChangeAddress = find.byKey(WidgetKeys.confirmButton);
  final cancelChangeAddress = find.byKey(WidgetKeys.cancelButton);
  final customerCodeSearchField = find.byKey(WidgetKeys.searchBar);

  void verify() {
    final customerSearchPage = find.byKey(WidgetKeys.customerSearchPage);
    expect(customerSearchPage, findsOneWidget);
  }

  void findCustomerCodeSearchField() {
    expect(customerCodeSearchField, findsOneWidget);
  }

  Future<void> search(String customerCode) async {
    await tester.enterText(customerCodeSearchField, customerCode);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void findCustomerCode(String shipToCode) {
    expect(
      find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first,
      findsOneWidget,
    );
  }

  Future<void> tapOnCustomerCode(String shipToCode) async {
    await tester
        .tap(find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first);
    await tester.pumpAndSettle();
  }

  Future<void> changeAddress(String shipToCode) async {
    final shipToCodeWidget =
        find.byKey(WidgetKeys.shipToAddressOption(shipToCode)).first;
    expect(
      shipToCodeWidget,
      findsOneWidget,
    );
    await tester.tap(shipToCodeWidget);
    await tester.pumpAndSettle();

    if (confirmChangeAddress.evaluate().isNotEmpty) {
      findConfirmChangeAddressButton();
      await tapOnConfirmChangeAddressButton();
    }
  }

  void findCancelChangeAddressButton() {
    expect(cancelChangeAddress, findsOneWidget);
  }

  Future<void> tapOnCancelChangeAddressButton() async {
    await tester.tap(cancelChangeAddress);
    await tester.pump();
  }

  void findConfirmChangeAddressButton() {
    expect(confirmChangeAddress, findsOneWidget);
  }

  Future<void> tapOnConfirmChangeAddressButton() async {
    await tester.tap(confirmChangeAddress);
    await tester.pumpAndSettle();
  }

  void verifyCustomerCodeIsSelected(String code) {
    final customerCode = find.textContaining(code);
    expect(customerCode, findsOneWidget);
  }

  void verifySearchResults(String textSearch) {
    final customerCode = find.textContaining(textSearch);
    expect(customerCode, findsWidgets);
  }

  void verifySearchNotFound() {
    final message = find.text('That didn’t match anything'.tr());
    expect(message, findsWidgets);
  }

  Future<void> tapCustomerCode(String customerCode) async {
    final customerCodeOptionNew =
        find.byKey(Key('customerCodeOption$customerCode'));
    expect(customerCodeOptionNew, findsOneWidget);
    await tester.tap(customerCodeOptionNew);
    await tester.pumpAndSettle();
    final customerCodeDialogChange =
        find.byKey(const Key('customerCodeDialogChange'));
    if (customerCodeDialogChange.evaluate().isNotEmpty) {
      await tester.tap(find.byKey(const Key('Change')));
      await tester.pumpAndSettle();
    }
  }
}
