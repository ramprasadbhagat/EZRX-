import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: const Key('ordersPage'),
        title: const Text('Orders').tr(),
        automaticallyImplyLeading: false,
      ),
      body: Container(),
    );
  }
}
