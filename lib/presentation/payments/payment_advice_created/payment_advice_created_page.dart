import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class PaymentAdviceCreatedPage extends StatelessWidget {
  const PaymentAdviceCreatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 16,
        automaticallyImplyLeading: false,
        backgroundColor: ZPColors.white,
        title: const Text('Payment advice created'),
        leading: IconButton(
          key: WidgetKeys.paymentAdviceCreatedPageBack,
          onPressed: () => Navigator.pop(context),
          icon: const CircleAvatar(
            maxRadius: 16,
            backgroundColor: ZPColors.transparent,
            child: Icon(
              Icons.chevron_left,
              color: ZPColors.neutralsBlack,
            ),
          ),
        ),
      ),
    );
  }
}
