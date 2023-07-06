import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemHeaderSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const ItemHeaderSection({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Container(
          color: ZPColors.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Order #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            BalanceTextRow(
              keyText: 'Order date',
              valueText: orderHistoryItem.createdDate.toValidDateString,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            BalanceTextRow(
              keyText: 'Invoice number',
              valueText: orderHistoryItem.invoiceNumber,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            BalanceTextRow(
              keyText: 'PO reference',
              valueText: orderHistoryItem.pOReference.displayPOReference,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate
                ? BalanceTextRow(
                    keyText: 'Requested Delivery Date',
                    valueText: orderHistoryItem
                        .requestedDeliveryDate.toValidDateString,
                    keyTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.white,
                            ),
                    valueTextStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.white,
                            ),
                  )
                : const SizedBox.shrink(),
            //TODO:will add value after getting data  from orderHistoryv2 api for these fields
            //       BalanceTextRow(
            //   keyText: 'Reference Note',
            //   valueText: orderHistoryItem.,
            // ),
            // paymentTermDisplay
            // ? BalanceTextRow(
            //   keyText: 'Payment Term',
            //   valueText:
            //       orderHistoryItem.,
            // ): const SizedBox.shrink(),
            BalanceTextRow(
              keyText: 'Contact person',
              valueText: orderHistoryItem.orderBy,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            BalanceTextRow(
              keyText: 'Contact number',
              valueText:
                  orderHistoryItem.telephoneNumber.displayTelephoneNumber,
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            BalanceTextRow(
              keyText: 'Delivery instructions',
              valueText: orderHistoryItem
                  .specialInstructions.displaySpecialInstructions,
              valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
              keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.white,
                  ),
            ),
          ]),
        );
      },
    );
  }
}
