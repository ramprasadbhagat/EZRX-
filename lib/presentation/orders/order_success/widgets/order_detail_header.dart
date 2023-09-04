part of '../order_success_page.dart';

class _OrderDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      buildWhen: (previous, current) =>
          previous.isConfirming != current.isConfirming,
      builder: (context, state) {
        return ListTile(
          minVerticalPadding: 15.0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          tileColor: ZPColors.primary,
          title: Text(
            '${'Order'.tr()} #${state.orderHistoryDetails.orderHistoryDetailsOrderHeader.orderNumber.getOrDefaultValue('')}',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.white,
                ),
          ),
          subtitle: Column(
            children: [
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Order Date'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state.orderHistoryDetails
                    .orderHistoryDetailsOrderHeader.createdDate.dateString,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'PO reference'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state.orderHistoryDetails
                    .orderHistoryDetailsOrderHeader.pOReference
                    .getOrDefaultValue(''),
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Request delivery date'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state
                    .orderHistoryDetails
                    .orderHistoryDetailsOrderHeader
                    .requestedDeliveryDate
                    .dateString,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Reference note'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state.orderHistoryDetails
                    .orderHistoryDetailsOrderHeader.referenceNotes,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Payment term'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText:
                    '${state.orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermCode.getOrDefaultValue('')} ${state.orderHistoryDetails.orderHistoryDetailsPaymentTerm.paymentTermDescription.getOrDefaultValue('')}',
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Contact person'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: context
                    .read<AdditionalDetailsBloc>()
                    .state
                    .deliveryInfoData
                    .contactPerson
                    .getOrDefaultValue(''),
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Contact number'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state
                    .orderHistoryDetails
                    .orderHistoryDetailsOrderHeader
                    .telephoneNumber
                    .displayTelephoneNumber,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Delivery instructions'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: state
                    .orderHistoryDetails
                    .orderHistoryDetailsSpecialInstructions
                    .displaySpecialInstructions,
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              BalanceTextRow(
                keyFlex: 2,
                valueFlex: 3,
                keyText: 'Attachments'.tr(),
                keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
                valueText: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
