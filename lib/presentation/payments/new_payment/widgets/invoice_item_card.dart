import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InvoiceItemCard extends StatelessWidget {
  const InvoiceItemCard({
    Key? key,
    required this.customerOpenItem,
  }) : super(key: key);
  final CustomerOpenItem customerOpenItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Invoice #${customerOpenItem.accountingDocument}',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              StatusLabel(
                status: StatusType(
                  customerOpenItem.status.getOrDefaultValue(''),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${'Order'.tr()} #${customerOpenItem.documentReferenceID}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  'Due on ${customerOpenItem.netDueDate.simpleDateString}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: customerOpenItem.status.displayDueDateColor,
                      ),
                ),
              ],
            ),
          ),
          PriceComponent(
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            price: customerOpenItem.openAmountInTransCrcy.toString(),
          ),
        ],
      ),
    );
  }
}
