import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentsTab extends StatelessWidget {
  const PaymentsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('paymentsPage'),
        title: const Text('Payments').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
