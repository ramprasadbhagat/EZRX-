import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class BundleDetailRobot extends CommonRobot {
  BundleDetailRobot(WidgetTester tester) : super(tester);

  final addToCartButton = find.byKey(WidgetKeys.materialDetailsAddToCartButton);
  final sheetAddToCartButton =
      find.byKey(WidgetKeys.bundleAddToCartSheetSubmitButton);

  void verifyBundleDetailPage() {
    final bundlesDetail = find.byKey(WidgetKeys.bundleDetailPage);
    expect(bundlesDetail, findsOneWidget);
  }

  Future<void> tapAddToCartButton() async {
    await tester.tap(addToCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapSheetAddToCartButton() async {
    await tester.tap(sheetAddToCartButton);
    await tester.pumpAndSettle();
  }

  Future<void> enterMaterialQty(String materialNumber, int qty) async {
    final textField = find.descendant(
      of: find.byKey(WidgetKeys.bundleMaterialItem(materialNumber)),
      matching: find.byKey(WidgetKeys.bundleQuantityTextKey),
    );
    await tester.tap(textField);
    await tester.enterText(textField, qty.toString());
    await tester.pumpAndSettle();
  }

  Future<void> tapBackButton() async {
    await tester.pageBack();
    await tester.pumpAndSettle();
  }
}
