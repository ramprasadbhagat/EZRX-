import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditItemCard extends StatelessWidget {
  const CreditItemCard({
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
                '${customerOpenItem.postingKeyName} #${customerOpenItem.accountingDocument}',
                style: Theme.of(context).textTheme.labelSmall,
                key: WidgetKeys.accountingDocument,
              ),
              Text(
                customerOpenItem.postingDate.dateString,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.darkGray,
                    ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrg
                    .showGovNumber)
                  Text(
                    '${context.tr('Gov. no')} ${customerOpenItem.documentReferenceID.displayDashIfEmpty}',
                    style: Theme.of(context).textTheme.labelSmall,
                    key: WidgetKeys.governmentNumber,
                  ),
                PriceComponent(
                  key: WidgetKeys.creditIdPrice,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price:
                      customerOpenItem.openAmountInTransCrcy.abs().toString(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
