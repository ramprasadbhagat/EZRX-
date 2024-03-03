part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSummary extends StatelessWidget {
  final OrderHistoryDetails orderHistoryDetails;
  const _OrderSummary({Key? key, required this.orderHistoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

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
          Row(
            key: WidgetKeys.orderSuccessSubTotal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr(
                  'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                )}:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price:
                    '${orderHistoryDetails.subTotal(eligibilityState.salesOrgConfigs.displaySubtotalTaxBreakdown)}',
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
                    price: orderHistoryDetails.totalTax.toString(),
                  ),
                ],
              ),
            ),
          if (eligibilityState.salesOrg.showSmallOrderFee) ...[
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                key: WidgetKeys.orderSummarySmallFee,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Small order fee')}:',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: orderHistoryDetails.deliveryFee.toString(),
                  ),
                ],
              ),
            ),
            Text(
              '${context.tr('Applies to orders less than')} ${StringUtils.displayPrice(
                eligibilityState.salesOrgConfigs,
                eligibilityState.salesOrg.smallOrderThreshold,
              )}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                  ),
            ),
          ],
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
                    price: orderHistoryDetails.manualFee.toString(),
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
                price: orderHistoryDetails.totalValue.toStringAsFixed(2),
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
                    price: orderHistoryDetails.totalDiscount.toString(),
                    type: PriceStyle.summaryPrice,
                  ),
                ],
              ),
            ),
          if (orderHistoryDetails.orderContainsMaterialsWithInvalidPrice)
            const PriceNotAvailableMessage(
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
        ],
      ),
    );
  }
}
