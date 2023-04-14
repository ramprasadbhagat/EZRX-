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

  void findAddToCart() {
    expect(addToCart, findsOneWidget);
  }

  Future<void> tapAddToCart() async {
    await tester.tap(addToCart);
    await tester.pumpAndSettle();
  }
}
