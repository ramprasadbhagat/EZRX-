part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderSummaryBloc, OrderSummaryState>(
      buildWhen: (previous, current) =>
          previous.isConfirming != current.isConfirming,
      builder: (context, state) {
        final eligibilityState = context.read<EligibilityBloc>().state;

        return ListTile(
          minVerticalPadding: 15.0,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
          tileColor: ZPColors.primary,
          title: Text(
            '${'Order'.tr()} #${state.orderHistoryDetails.orderNumber.getOrDefaultValue('')}',
            key: WidgetKeys.orderSuccessOrderId,
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
                valueText: state.orderHistoryDetails.createdDate.dateString,
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
                valueText:
                    state.orderHistoryDetails.pOReference.getOrDefaultValue(''),
                valueTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.white,
                    ),
              ),
              if (eligibilityState.salesOrgConfigs.enableFutureDeliveryDay)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Request delivery date'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: state
                      .orderHistoryDetails.requestedDeliveryDate.dateString,
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.salesOrgConfigs.enableReferenceNote)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Reference note'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: state.orderHistoryDetails.referenceNotes,
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.displayPaymentTerm)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Payment term'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: state.orderHistoryDetails
                      .orderHistoryDetailsPaymentTerm.displayPaymentTerm,
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.salesOrgConfigs.enableMobileNumber)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Contact person'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: context
                      .read<AdditionalDetailsBloc>()
                      .state
                      .deliveryInfoData
                      .contactPerson
                      .getOrDefaultValue(''),
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.salesOrgConfigs.enableMobileNumber)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Contact number'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: state.orderHistoryDetails.telephoneNumber
                      .displayTelephoneNumber,
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.salesOrgConfigs.enableSpecialInstructions)
                BalanceTextRow(
                  keyFlex: 2,
                  valueFlex: 3,
                  keyText: context.tr('Delivery instructions'),
                  keyTextStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                  valueText: state
                      .orderHistoryDetails
                      .orderHistoryDetailsSpecialInstructions
                      .displaySpecialInstructions,
                  valueTextStyle:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: ZPColors.white,
                          ),
                ),
              if (eligibilityState.salesOrgConfigs.showPOAttachment)
                const OrderSuccessAttachmentSection(),
            ],
          ),
        );
      },
    );
  }
}
