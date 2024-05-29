part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSuccessSummary extends StatelessWidget {
  final List<OrderHistoryDetails> orderHistoryDetailList;

  const _OrderSuccessSummary({
    Key? key,
    required this.orderHistoryDetailList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderEligibilityState = context.read<OrderEligibilityBloc>().state;

    return ListTile(
      key: WidgetKeys.orderSuccessOrderSummarySection,
      minVerticalPadding: 25.0,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          context.tr('Order summary'),
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: ZPColors.black,
              ),
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (orderHistoryDetailList.mpOrderOnly.isNotEmpty) ...[
            Row(
              key: WidgetKeys.checkoutSummaryZPSubTotal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ZP ${context.tr(
                    'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                  )}:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                PriceComponent(
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price:
                      '${orderHistoryDetailList.zpOrderOnly.subtotal(eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)}',
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              key: WidgetKeys.checkoutSummaryMPSubTotal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'MP ${context.tr(
                    'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                  )}:',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
                PriceComponent(
                  salesOrgConfig: eligibilityState.salesOrgConfigs,
                  price:
                      '${orderHistoryDetailList.mpOrderOnly.subtotal(eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)}',
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
          Row(
            key: WidgetKeys.orderSuccessSubTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  '${context.tr(
                    'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                  )}:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              PriceComponent(
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price:
                    '${orderHistoryDetailList.subtotal(eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)}',
              ),
            ],
          ),
          if (eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                key: WidgetKeys.orderSummaryTax,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    eligibilityState.salesOrg.isVN
                        ? '${context.tr('Tax')}:'
                        : '${context.tr('Tax at')} ${eligibilityState.salesOrgConfigs.vatValue}%:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: orderHistoryDetailList.totalTax.toString(),
                  ),
                ],
              ),
            ),
          if (orderEligibilityState.smallOrderFeeApplied)
            SmallOrderFee(orderEligibilityState: orderEligibilityState),
          if (eligibilityState.salesOrg.showManualFee)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                key: WidgetKeys.orderSummaryManualFee,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Manual fee')}:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: orderHistoryDetailList.manualFee.toString(),
                  ),
                ],
              ),
            ),
          const Divider(
            indent: 0,
            endIndent: 0,
            thickness: 0.5,
            height: 15,
          ),
          Row(
            key: WidgetKeys.orderSuccessGrandTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Grand total')}:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: orderHistoryDetailList.grandTotal.toStringAsFixed(2),
              ),
            ],
          ),
          if (eligibilityState.salesOrg.showTotalSaving)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                key: WidgetKeys.orderSummaryTotalSaving,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Total savings')}:',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  PriceComponent(
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: orderHistoryDetailList.totalSaving.toString(),
                    type: PriceStyle.summaryPrice,
                  ),
                ],
              ),
            ),
          if (orderHistoryDetailList.allItems.containsMaterialsWithInvalidPrice)
            const PriceNotAvailableMessage(
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
        ],
      ),
    );
  }
}
