import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/presentation/core/widget_keys.dart';

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
                '${context.tr('Invoice')} #${customerOpenItem.accountingDocument}',
                style: Theme.of(context).textTheme.labelSmall,
                key: WidgetKeys.invoiceId,
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
                Expanded(
                  flex: 3,
                  child: Text(
                    '${context.tr('Order')} #${customerOpenItem.documentReferenceID}',
                    style: Theme.of(context).textTheme.titleSmall,
                    key: WidgetKeys.orderId,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    '${context.tr('Due on')} ${StringUtils.getDueDateString(
                      customerOpenItem.netDueDate.dateTimeOrNull,
                      context.read<EligibilityBloc>().state.salesOrganisation,
                    )}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: customerOpenItem.status.displayDueDateColor,
                        ),
                  ),
                ),
              ],
            ),
          ),
          PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: customerOpenItem.displayItemAmount.toString(),
          ),
        ],
      ),
    );
  }
}
