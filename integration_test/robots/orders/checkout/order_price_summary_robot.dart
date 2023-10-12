import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter_test/flutter_test.dart';

class OrderPriceSummaryRobot {
  final WidgetTester tester;

  OrderPriceSummaryRobot(this.tester);

  final bottomSheet = find.byKey(WidgetKeys.orderPriceSummarySheet);
  final closeButton = find.byKey(WidgetKeys.closeButton);

  void verifySheet({required bool isVisible}) {
    expect(bottomSheet, isVisible ? findsOneWidget : findsNothing);
  }

  void verifyCloseButton() {
    expect(
      find.descendant(of: bottomSheet, matching: closeButton),
      findsOneWidget,
    );
  }

  Future<void> tapCloseButton() async {
    await tester.tap(find.descendant(of: bottomSheet, matching: closeButton));
    await tester.pumpAndSettle();
  }

  void verifySubTotalLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummarySubTotal),
        price,
      );

  void verifyStampDutyLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryStampDuty),
        price,
      );

  void verifySmallOrderFeeLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummarySmallOrderFee),
        price,
      );

  void verifyGrandTotalLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryGrandTotal),
        price,
      );

  void verifyTotalSavingLabel(String price) => _verifyPriceLabel(
        find.byKey(WidgetKeys.checkoutSummaryTotalSaving),
        price,
      );

  void _verifyPriceLabel(Finder finder, String price) {
    expect(
      find.descendant(
        of: find.descendant(of: bottomSheet, matching: finder),
        matching: find.textContaining(price, findRichText: true),
      ),
      findsOneWidget,
    );
  }
}
