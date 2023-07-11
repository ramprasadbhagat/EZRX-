import 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary.dart';
import 'package:flutter/material.dart';

class PaymentsSummaryPage extends StatelessWidget {
  const PaymentsSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   key: WidgetKeys.paymentsSummaryTab,
      //   child: const SizedBox.shrink(),
      // ),
      body:
          PaymentSummaryPage(), //Temporary route for review need to remove when it is dome
    );
  }
}
