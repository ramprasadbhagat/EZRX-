import 'package:easy_localization/easy_localization.dart';
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

  void verifyAllInformationBundleOfferDisplayed() {
    expect(find.byKey(WidgetKeys.productImage), findsWidgets);
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.productTag),
        matching: find.text('Bundle offer'.tr()),
      ),
      findsOneWidget,
    );
    expect(find.byKey(WidgetKeys.bundleOfferCode), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferName), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferPrice), findsOneWidget);
    expect(find.byKey(WidgetKeys.favoritesIcon), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferSummary), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleInformation), findsOneWidget);
    expect(find.byKey(WidgetKeys.bundleOfferMaterialInfo), findsOneWidget);
    expect(addToCartButton, findsOneWidget);
  }
}
