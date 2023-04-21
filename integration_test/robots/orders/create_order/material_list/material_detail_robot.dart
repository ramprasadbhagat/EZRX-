import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class MaterialDetailRobot {
  final WidgetTester tester;

  MaterialDetailRobot(this.tester);

  final addToCart = find.byKey(const Key('addMaterialToCart'));

  void verify() {
    final materialDetails = find.byKey(const Key('materialDetailsPage'));
    expect(materialDetails, findsOneWidget);
  }

  void verifyBonusesMaterial(){
    expect(find.byKey(const Key('bonusesMaterial')), findsOneWidget);
  }

  void verifyTieredPricingMaterial(){
    expect(find.byKey(const Key('tieredPricing')), findsOneWidget);
  }

  void findAddToCart() {
    expect(addToCart, findsOneWidget);
  }

  Future<void> tapAddToCart() async {
    await tester.tap(addToCart);
    await tester.pumpAndSettle();
  }
  
  Future<void> addQuantity()async{
    await tester.tap(find.byKey(const Key('cartItemAdd')));
    await tester.pumpAndSettle();
  }

  Future<void> deductQuantity()async{
    await tester.tap(find.byKey(const Key('cartItemDelete')));
    await tester.pumpAndSettle();
  }

  Future<void> changeQuantity(int quantity)async{
    await tester.enterText(find.byKey(const Key('item')), quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapUpdateAddToCart() async{
    await tester.tap(find.byKey(const Key('updateCart')));
    await tester.pumpAndSettle();
  }
}
