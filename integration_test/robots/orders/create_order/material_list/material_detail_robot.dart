import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialDetailRobot {
  final WidgetTester tester;

  MaterialDetailRobot(this.tester);

  final addToCart = find.byKey(const Key('addMaterialToCart'));
  final announcementCloseIcon = find.byKey(const Key('announcementCloseIcon'));
  final tenderContractHeading = find.byKey(const Key('selectContract'));
  final tenderOrderInvalidQuantityError =
      find.byKey(const Key('tenderOrderValidQuantityErrorText'));
  final addToCartButton = find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final iconBackToProductTab = find.byKey(WidgetKeys.materialDetailsPageBack);
  final closeMessageIcon = find.byKey(WidgetKeys.snackBarDismissButton);

  void verify() {
    final materialDetails = find.byKey(const Key('materialDetailsPage'));
    expect(materialDetails, findsOneWidget);
  }

  void verifyBonusesMaterial() {
    expect(find.byKey(const Key('bonusesMaterial')), findsOneWidget);
  }

  void verifyTieredPricingMaterial() {
    expect(find.byKey(const Key('tieredPricing')), findsOneWidget);
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

  Future<void> tenderOrderErrorTextVisible() async {
    if (tenderOrderInvalidQuantityError.evaluate().isNotEmpty) {
      expect(tenderOrderInvalidQuantityError, findsOneWidget);
    }

    await tester.pumpAndSettle();
  }

  Future<void> tenderOrderErrorTextNotVisible() async {
    if (tenderOrderInvalidQuantityError.evaluate().isEmpty) {
      expect(tenderOrderInvalidQuantityError, findsNothing);
    }
  }

  void findTenderContractText() {
    expect(tenderContractHeading, findsOneWidget);
  }

  Future<void> tapTenderContract(String tenderContractNumber) async {
    await tester.tap(find.byKey(Key(tenderContractNumber)));
  }

  Future<void> selectTenderContract(String tenderContractNumber) async {
    await tester
        .tap(find.byKey(Key('tenderContractIcon$tenderContractNumber')));
    await tester.pumpAndSettle();
  }

  Future<void> addTenderMaterialToCartIfQuantityIsValidated() async {
    if (tenderOrderInvalidQuantityError.evaluate().isEmpty) {
      findAddToCart();
      await tapAddToCart();
    } else {
      await goBack();
    }
  }

  Future<void> findAndCloseAnnouncementIcon() async {
    if (announcementCloseIcon.evaluate().isNotEmpty) {
      await tester.tap(announcementCloseIcon.first);
      await tester.pumpAndSettle();
    }
  }

  Future<void> goBack() async {
    // ignore: omit_local_variable_types
    final NavigatorState navigator = tester.state(find.byType(Navigator));
    navigator.pop();
    await tester.pumpAndSettle();
  }

  Future<void> findUnitPrice(String price) async {
    final unitPrice = find.byKey(Key('Unit Price$price'));
    expect(unitPrice, findsOneWidget);
    await tester.pumpAndSettle();
  }

  void zdp5QtyExceedWarning() {
    final warningText =
        find.textContaining('You have exceeded the remaining quantity limit');
    expect(warningText, findsOneWidget);
  }

  Future<void> getKeyboardDown() async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }
}
