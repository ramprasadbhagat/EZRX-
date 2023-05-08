import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:flutter/material.dart';

class BillToCustomerStep extends StatelessWidget {
  final BillToInfo billToInfo;

  const BillToCustomerStep({
    Key? key,
    required this.billToInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('billToCustomer'),
      children: WidgetHelper.getBillToCustomerDetails(billToInfo),
    );
  }
}
