import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/account/entities/bill_to_info.dart';
import 'package:ezrxmobile/presentation/core/widget_helper.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;

class HistoryBillToSection extends StatelessWidget {
  final BillToInfo billToInfo;

  const HistoryBillToSection({Key? key, required this.billToInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return custom.ExpansionTile(
      initiallyExpanded: true,
      keepHeaderBorder: true,
      key: const ValueKey('billToAddress'),
      title: Text(
        'Bill to Address'.tr(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
      children: WidgetHelper.getBillToCustomerDetails(billToInfo),
    );
  }
}
