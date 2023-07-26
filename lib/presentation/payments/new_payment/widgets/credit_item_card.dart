import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
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
              ),
              Text(
                customerOpenItem.netDueDate.toValidDateString,
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
                Text(
                  customerOpenItem.documentReferenceID,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                PriceComponent(
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  price:
                      customerOpenItem.amountInTransactionCurrency.toString(),
                  currencyCodeTextStyle:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ZPColors.primary,
                          ),
                  priceTextStyle:
                      Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: ZPColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
