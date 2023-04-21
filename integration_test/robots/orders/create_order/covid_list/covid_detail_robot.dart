import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class CovidDetailRobot {
  final WidgetTester tester;

  CovidDetailRobot(this.tester);

  final addToCart = find.byKey(const Key('addMaterialToCart'));

  void verify() {
    final materialDetails = find.byKey(const Key('materialDetailsPage'));
    expect(materialDetails, findsOneWidget);
  }

  void findAddToCart() {
    expect(addToCart, findsOneWidget);
  }

  Future<void> tapAddToCart() async {
    await tester.tap(addToCart);
    await tester.pumpAndSettle();
  }

  Future<void> addQuantity() async {
    await tester.tap(find.byKey(const Key('cartItemAdd')));
    await tester.pumpAndSettle();
  }

  Future<void> deductQuantity() async {
    await tester.tap(find.byKey(const Key('cartItemDelete')));
    await tester.pumpAndSettle();
  }

  Future<void> changeQuantity(int quantity) async {
    await tester.enterText(find.byKey(const Key('item')), quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapUpdateAddToCart() async {
    await tester.tap(find.byKey(const Key('updateCart')));
    await tester.pumpAndSettle();
  }

  void verifyCovidMaterialCannotAddSnackBar(){
    final covidMaterialCannotAddSnackBar = find.text(
      'Covid material cannot be combined with commercial material.'.tr(),
    );
    expect(covidMaterialCannotAddSnackBar, findsWidgets);
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }
}
