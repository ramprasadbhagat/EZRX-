import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialListRobot {
  final WidgetTester tester;

  MaterialListRobot(this.tester);

  final cartButton = find.byKey(const Key('cartButton'));

  void verify() {
    expect(find.byKey(const Key('materialListPage')), findsOneWidget);
  }

  void verifyDisableOrderTypeSelection() {
    final orderTypeSelector = find.byKey(const Key('orderTypeSelector'));
    expect(orderTypeSelector, findsNothing);
  }

  Future<void> search(String materialNumber) async {
    final materialSearchField = find.byKey(const Key('materialSearchField'));
    expect(materialSearchField, findsOneWidget);
    await tester.enterText(materialSearchField, materialNumber);
    await tester.pump();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  void verifyMaterialPrice() {
    //enable Materials without Price
    expect(find.text('${'List Price:'.tr()}NA'), findsWidgets);
  }

  void verifyCurrencyCheck(String currencyCode) {
    expect(find.textContaining(currencyCode), findsWidgets);
  }

  void verifyEnableListPrice(String materialNumber) {
    expect(find.byKey(Key('listPrice$materialNumber')), findsOneWidget);
  }

  Future<void> tapMaterial(String materialNumber) async {
    final materialOption = find.byKey(Key('materialOption$materialNumber'));
    expect(materialOption, findsOneWidget);
    await tester.tap(materialOption);
    await tester.pumpAndSettle();
  }

  void findCartButton() {
    expect(cartButton, findsOneWidget);
  }

  Future<void> tapCartButton() async {
    await tester.tap(cartButton);
    await tester.pumpAndSettle();
  }

  void findFavoriteIcon(String materialNumber) {
    final favoriteIcon = find.byKey(Key('favoriteButtonKey$materialNumber'));
    expect(favoriteIcon, findsWidgets);
  }

  Future<void> tapFavoriteIcon(String materialNumber) async {
    final favoriteIcon = find.byKey(Key('favoriteButtonKey$materialNumber'));
    await tester.tap(favoriteIcon);
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
  }

  Future<void> clearSearchMaterial() async {
    await tester.tap(find.byKey(const Key('clearSearch')));
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
