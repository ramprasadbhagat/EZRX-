import 'package:ezrxmobile/presentation/payments/payment_summary_details/payment_summary_details_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class PaymentDetailRobot {
  final WidgetTester tester;

  PaymentDetailRobot(this.tester);

  void verifyPage() {
    expect(find.byType(PaymentSummaryDetailsPage), findsOneWidget);
  }
}
