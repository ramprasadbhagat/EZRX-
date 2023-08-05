import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BundleDetailRobot {
  late WidgetTester tester;
  BundleDetailRobot(this.tester);

  void verify() {
    expect(find.byKey(const Key('bundleItemDetailPage')), findsOneWidget);
  }

  Future<void> tapBundle(String bundleCode) async {
    final bundleItem = find.byKey(Key('materialBundleOption$bundleCode'));
    await tester.ensureVisible(bundleItem);
    await tester.tap(bundleItem);
    await tester.pumpAndSettle();
  }

  Future<void> tapAddBundleMaterialQuantity(String bundleMaterial) async {
    final addBundleMaterial = find.byKey(Key('bundleAdd$bundleMaterial'));
    expect(addBundleMaterial, findsOneWidget);
    await tester.tap(addBundleMaterial);
    await tester.pumpAndSettle();
  }

  Future<void> tapDeductBundleMaterialQuantity(String bundleMaterial) async {
    final deductBundleMaterial = find.byKey(Key('bundleDelete$bundleMaterial'));
    expect(deductBundleMaterial, findsOneWidget);
    await tester.tap(deductBundleMaterial);
    await tester.pumpAndSettle();
  }

  Future<void> changeBundleMaterialQuantity(
    String bundleMaterial,
    int quantity,
  ) async {
    final changeBundleMaterial = find.byKey(Key('bundleText$bundleMaterial'));
    expect(changeBundleMaterial, findsOneWidget);
    await tester.enterText(changeBundleMaterial, quantity.toString());
    await tester.pumpAndSettle();
  }

  Future<void> addBundlesToCart() async {
    final addBundlesToCart = find.byKey(const Key('addBundlesToCart'));
    await tester.tap(addBundlesToCart);
    await tester.pumpAndSettle();
  }

  Future<void> goBack() async {
    await tester.ensureVisible(find.byIcon(Icons.close));
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();
  }
}
