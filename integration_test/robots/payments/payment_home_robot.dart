import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/common_robot.dart';

class PaymentHomeRobot extends CommonRobot {
  PaymentHomeRobot(WidgetTester tester) : super(tester);

  final accountSummaryIcon = find.byKey(WidgetKeys.accountSummaryMenu);
  final totalOutstanding = find.byKey(WidgetKeys.totalOutstanding);
  final newPaymentButton = find.byKey(WidgetKeys.newPaymentButton);
  final paymentHomeSoa = find.byKey(WidgetKeys.paymentHomeSoa);
  final totalOverdue = find.byKey(WidgetKeys.totalOverdue);
  final totalCreditLimit = find.byKey(WidgetKeys.totalCreditLimit);
  final creditLimitUtilized = find.byKey(WidgetKeys.creditLimitUtilized);
  final creditLimitRemaining = find.byKey(WidgetKeys.creditLimitRemaining);
  final inProgressAmount = find.byKey(WidgetKeys.inProgressAmount);
  final itemStatementAccounts = find.byKey(WidgetKeys.itemStatementAccounts);
  final arrowButton = find.byKey(WidgetKeys.arrowButton);
  final downloadStatementAccountIcon =
      find.byKey(WidgetKeys.downloadStatementAccountIcon);
  final paymentHomeObscuredAmount =
      find.byKey(WidgetKeys.paymentHomeObscuredAmount);

  Future<void> tapAccountSummaryIcon() async {
    await tester.tap(accountSummaryIcon);
    await tester.pumpAndSettle();
  }

  Future<void> navigateToPaymentSummaryScreen() async {
    await tester.tap(
      arrowButton.first,
    );
    await tester.pumpAndSettle();
  }

  Future<void> navigateToStatementOfAccountScreen() async {
    await tester.tap(
      arrowButton.at(1),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapToAllObscureButton() async {
    await tester.tap(paymentHomeObscuredAmount.first);
    await tester.pump();
    await tester.tap(paymentHomeObscuredAmount.at(1));
    await tester.pump();
    await tester.tap(paymentHomeObscuredAmount.at(2));
    await tester.pumpAndSettle();
  }

  Future<void> downloadFirstStatementAccount() async {
    await tester.dragUntilVisible(
      downloadStatementAccountIcon.first,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -200),
    );
    await tester.pumpAndSettle();
    await tester.tap(downloadStatementAccountIcon.first);
    await tester.pumpAndSettle();
  }

  Future<void> tapToNewPaymentButton() async {
    await tester.tap(newPaymentButton);
    await tester.pumpAndSettle();
  }

  void verifyPaymentsTabPage() {
    expect(find.byKey(WidgetKeys.paymentsTabPage), findsOneWidget);
  }

  void verifyNewPaymentsButton() {
    expect(newPaymentButton, findsOneWidget);
  }

  void verifyPaymentHomeOptionMenu() {
    expect(find.byKey(WidgetKeys.accountSummaryMenu), findsOneWidget);
    expect(find.byKey(WidgetKeys.paymentSummaryMenu), findsOneWidget);
    expect(find.byKey(WidgetKeys.statementOfAccountsMenu), findsOneWidget);
  }

  void verifyPaymentHomeInvoiceCard() {
    expect(totalOutstanding, findsOneWidget);
    expect(totalOverdue, findsOneWidget);
  }

  void verifyPaymentHomeCreditCard() {
    expect(totalCreditLimit, findsOneWidget);
    expect(creditLimitUtilized, findsOneWidget);
    expect(creditLimitRemaining, findsOneWidget);
  }

  void verifyPaymentHomeInProgressCard() {
    expect(find.byKey(WidgetKeys.inProgressAmount), findsOneWidget);
  }

  Future<void> verifyPaymentStatementAccount() async {
    await tester.dragUntilVisible(
      downloadStatementAccountIcon.first,
      find.byKey(WidgetKeys.scrollList),
      const Offset(0.0, -200),
    );
    expect(paymentHomeSoa, findsOneWidget);
    expect(itemStatementAccounts, findsWidgets);
  }

  void verifyPaymentHomeInvoiceCardObscure() {
    expect(_getPriceOptionPayment(totalOutstanding), contains('*'));
    expect(_getPriceOptionPayment(totalOverdue), contains('*'));
  }

  void verifyPaymentHomeCreditCardObscure() {
    expect(_getPriceOptionPayment(totalCreditLimit), contains('*'));
    expect(_getPriceOptionPayment(creditLimitUtilized), contains('*'));
    expect(_getPriceOptionPayment(creditLimitRemaining), contains('*'));
  }

  void verifyPaymentSummaryObscure() {
    expect(_getPriceOptionPayment(inProgressAmount), contains('*'));
  }

  void verifyNoObscureTextPresent() {
    expect(find.textContaining('*', findRichText: true), findsNothing);
  }

  String _getPriceOptionPayment(Finder component) {
    return tester
        .widget<RichText>(
          find.descendant(
            of: component,
            matching: find.byKey(WidgetKeys.priceComponent),
          ),
        )
        .toString();
  }
}
