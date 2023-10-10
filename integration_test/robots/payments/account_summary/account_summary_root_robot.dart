import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';
import 'package:ezrxmobile/presentation/payments/all_credits/all_credits.dart';
import 'package:ezrxmobile/presentation/payments/all_invoices/all_invoices.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountSummaryRootRobot {
  final WidgetTester tester;

  AccountSummaryRootRobot(this.tester);

  final invoicesTab = find.byKey(WidgetKeys.invoiceTab);
  final creditTab = find.byKey(WidgetKeys.creditsTab);
  final page = find.byType(AccountSummary);
  final invoicesPage = find.byType(AllInvoicesPage);
  final creditPage = find.byType(AllCreditsPage);

  void verifyTabBarVisible() {
    expect(invoicesTab, findsOneWidget);
    expect(creditTab, findsOneWidget);
  }

  void verifyRootPageVisible() {
    expect(page, findsOneWidget);
  }

  void verifyInvoicesPageVisible() {
    expect(invoicesPage, findsOneWidget);
  }

  void verifyCreditsPageVisible() {
    expect(creditPage, findsOneWidget);
  }

  Future<void> switchToInvoicesPage() async {
    await tester.tap(invoicesTab);
    await tester.pumpAndSettle();
  }

  Future<void> switchToCreditPage() async {
    await tester.tap(creditTab);
    await tester.pumpAndSettle();
  }
}
