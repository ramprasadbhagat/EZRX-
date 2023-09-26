import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
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
                '${context.tr('Invoice')} #${customerOpenItem.accountingDocument}',
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
                  '${context.tr('Order')} #${customerOpenItem.documentReferenceID}',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  '${context.tr('Due on')} ${StringUtils.getDueDateString(
                    customerOpenItem.netDueDate.dateTimeOrNull,
                    context.read<EligibilityBloc>().state.salesOrganisation,
                  )}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: customerOpenItem.status.displayDueDateColor,
                      ),
                ),
              ],
            ),
          ),
          PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: customerOpenItem.openAmountInTransCrcy.toString(),
          ),
        ],
      ),
    );
  }
}
