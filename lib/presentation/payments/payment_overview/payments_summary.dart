import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';

class PaymentsSummaryPage extends StatelessWidget {
  const PaymentsSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: WidgetKeys.paymentsSummaryTab,
        child: const SizedBox.shrink(),
      ),
    );
  }
}
