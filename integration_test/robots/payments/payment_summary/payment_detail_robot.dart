import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../common/extension.dart';

class PaymentSummaryDetailRobot {
  final WidgetTester _tester;
  final Finder _downloadAdviceButtonKey =
      find.byKey(WidgetKeys.downloadAdviceButtonKey);
  final Finder _accountSummaryBankAccountSection =
      find.byKey(WidgetKeys.accountSummaryBankAccountSection);
  final Finder _paymentSummaryDetailsPage =
      find.byKey(WidgetKeys.paymentSummaryDetailsPage);
  final Finder _cancelAdviceButtonKey =
      find.byKey(WidgetKeys.cancelAdviceButtonKey);
  final Finder _deleteCancelAdviceBottomSheetButton =
      find.byKey(WidgetKeys.deleteCancelAdviceBottomSheetButton);
  final Finder _paymentSummaryDetailsBackButton =
      find.byKey(WidgetKeys.paymentSummaryDetailsBackButton);

  PaymentSummaryDetailRobot(this._tester);

  void verifyPage() {
    expect(_paymentSummaryDetailsPage, findsOneWidget);
  }

  void verifyPaymentDetail(
    String paymentId,
    String paymentStatus,
  ) {
    expect(
      find.descendant(
        of: find.byKey(WidgetKeys.paymentSummaryDetails),
        matching: find.textContaining(paymentId),
      ),
      findsOneWidget,
    );
    expect(
      find.descendant(
        of: find.byType(StatusLabel),
        matching: find.text(paymentStatus),
      ),
      findsOneWidget,
    );
    _verifyBalanceTextRow('Payment method');
    _verifyBalanceTextRow('PA created date');
    _verifyBalanceTextRow('Advice expiry');
    _verifyBalanceTextRow('Payment date');
  }

  void _verifyBalanceTextRow(String text) {
    expect(
      find.descendant(
        of: find.byType(BalanceTextRow),
        matching: find.textContaining(text.tr()),
      ),
      findsOneWidget,
    );
  }

  void verifyOrderAddressVisible(String address) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionActionLabel &&
            widget is Text &&
            (widget.data ?? '').contains(address),
      ),
      findsOneWidget,
    );
  }

  void verifyCustomerCode(String customerCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionCustomerCodeLabel &&
            widget is Text &&
            (widget.data ?? '').contains(customerCode),
      ),
      findsOneWidget,
    );
  }

  void verifyShipToCode(String shipToCode) {
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget.key == WidgetKeys.addressInfoSectionDeliveryToLabel &&
            widget is Text &&
            (widget.data ?? '').contains(shipToCode),
      ),
      findsOneWidget,
    );
  }

  void verifyPaymentSummaryDetail(
    String title,
    double invoicePrice,
    String currency,
  ) {
    expect(
      find.descendant(
        of: find.byKey(
          WidgetKeys.paymentSummaryTitle(
            title,
          ),
        ),
        matching: _getPriceFinder(
          invoicePrice.priceDisplay(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyPaymentSummaryDetailForID(
    String title,
    double invoicePrice,
    String currency,
  ) {
    expect(
      find.descendant(
        of: find.byKey(
          WidgetKeys.paymentSummaryTitle(
            title,
          ),
        ),
        matching: _getPriceFinder(
          invoicePrice.priceDisplayForID(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyPaymentItems(
    String title,
    String id,
    double price,
    String currency,
  ) async {
    final paymentItem = find.byKey(WidgetKeys.paymentItems(title, id));
    await _tester.dragUntilVisible(
      paymentItem,
      _paymentSummaryDetailsPage,
      const Offset(0.0, -200),
    );
    await _tester.pump();
    expect(
      find.descendant(
        of: paymentItem,
        matching: _getPriceFinder(
          price.priceDisplay(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  Future<void> verifyPaymentItemsForID(
    String title,
    String id,
    double price,
    String currency,
  ) async {
    final paymentItem = find.byKey(WidgetKeys.paymentItems(title, id));
    await _tester.dragUntilVisible(
      paymentItem,
      _paymentSummaryDetailsPage,
      const Offset(0.0, -200),
    );
    await _tester.pump();
    expect(
      find.descendant(
        of: paymentItem,
        matching: _getPriceFinder(
          price.priceDisplayForID(currency),
        ),
      ),
      findsOneWidget,
    );
  }

  void verifyDownloadAdviceButton() {
    expect(_downloadAdviceButtonKey, findsOneWidget);
  }

  void verifyBankAccountStatementSection() {
    expect(_accountSummaryBankAccountSection, findsOneWidget);
  }

  void verifyDownloadAdviceButtonForSuccessfulStatus() {
    expect(_downloadAdviceButtonKey, findsNothing);
  }

  void verifyDeleteCancelAdviceBottomSheetButton() {
    expect(_deleteCancelAdviceBottomSheetButton, findsOneWidget);
  }

  Future<void> tapDeleteCancelAdviceBottomSheetButton() async {
    await _tester.tap(_deleteCancelAdviceBottomSheetButton);
    await _tester.pumpAndSettle();
  }

  void verifyPaymentSummaryDetailsBackButton() {
    expect(_paymentSummaryDetailsBackButton, findsOneWidget);
  }

  Future<void> tapPaymentSummaryDetailsBackButton() async {
    await _tester.tap(_paymentSummaryDetailsBackButton);
    await _tester.pumpAndSettle();
  }

  void verifyCancelAdviceButtonKey() {
    expect(_cancelAdviceButtonKey, findsOneWidget);
  }

  Future<void> tapCancelAdviceButtonKey() async {
    await _tester.tap(_cancelAdviceButtonKey);
    await _tester.pumpAndSettle();
  }

  Future<void> tapDownloadAdviceButton() async {
    await _tester.tap(_downloadAdviceButtonKey);
    await _tester.pumpAndSettle();
  }

  Finder _getPriceFinder(String price) => find.byWidgetPredicate(
        (widget) =>
            widget is RichText &&
            widget.key == WidgetKeys.priceComponent &&
            widget.text.toPlainText().contains(price),
      );
}
