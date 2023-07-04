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
    // final paymentTermDisplay =
    //     context.read<EligibilityBloc>().state.isPaymentTermDescriptionEnable;
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
              keyColor: ZPColors.white,
              valueText: orderHistoryItem.createdDate.toValidDateString,
              valueColor: ZPColors.white,
            ),
            BalanceTextRow(
              keyText: 'Invoice number',
              keyColor: ZPColors.white,
              valueText: orderHistoryItem.invoiceNumber,
              valueColor: ZPColors.white,
            ),
            BalanceTextRow(
              keyText: 'PO reference',
              keyColor: ZPColors.white,
              valueText: orderHistoryItem.pOReference.displayPOReference,
              valueColor: ZPColors.white,
            ),
            !context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate
                ? BalanceTextRow(
                    keyText: 'Requested Delivery Date',
                    keyColor: ZPColors.white,
                    valueText: orderHistoryItem
                        .requestedDeliveryDate.toValidDateString,
                    valueColor: ZPColors.white,
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
              keyColor: ZPColors.white,
              valueText: orderHistoryItem.orderBy,
              valueColor: ZPColors.white,
            ),
            BalanceTextRow(
              keyText: 'Contact number',
              keyColor: ZPColors.white,
              valueText:
                  orderHistoryItem.telephoneNumber.displayTelephoneNumber,
              valueColor: ZPColors.white,
            ),
            BalanceTextRow(
              keyText: 'Delivery instructions',
              keyColor: ZPColors.white,
              valueText: orderHistoryItem
                  .specialInstructions.displaySpecialInstructions,
              valueColor: ZPColors.white,
            ),
          ]),
        );
      },
    );
  }
}
