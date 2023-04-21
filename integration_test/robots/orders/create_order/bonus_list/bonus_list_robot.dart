import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BonusListRobot {
  late WidgetTester tester;
  BonusListRobot(this.tester);

  void verify() {
    expect(find.byKey(const Key('addBonus')), findsOneWidget);
  }

  Future<void> searchBonus(String materialNumber) async{
    final addBonusTextField = find.byKey(const Key('addBonusTextField'));
    await tester.enterText(addBonusTextField, materialNumber);
    await tester.pumpAndSettle();
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  Future<void> tapBonusMaterial(String materialNumber) async {
    final addItemBonus = find.byKey(Key('addItem$materialNumber'));
    await tester.ensureVisible(addItemBonus);
    await tester.tap(addItemBonus);
    await tester.pumpAndSettle();
  }

  Future<void> addBonusMaterialQuantity() async{
    await tester.tap(find.byKey(const Key('bounsAdd')));
    await tester.pumpAndSettle();
  }

  Future<void> deductBonusMaterialQuantity() async{
    await tester.tap(find.byKey(const Key('bonusDelete')));
    await tester.pumpAndSettle();
  }

  Future<void> changeBonusMaterialQuantity(int quantity) async{
    await tester.enterText(
        find.byKey(const Key('bonusItem')), quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapAddToBonusButton() async{
    await tester.tap(find.byKey(const Key('addButton')));
    await tester.pumpAndSettle();
  }

  void verifyBonusSnackbar() {
    final addBonusSnackBar =
        find.textContaining('Bonus item added to the cart'.tr());
    expect(addBonusSnackBar, findsOneWidget);
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
