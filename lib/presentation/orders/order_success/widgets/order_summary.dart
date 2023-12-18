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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr(
                  'Subtotal (${eligibilityState.salesOrgConfigs.displayPrefixTax}.tax)',
                )}:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                key: WidgetKeys.orderSuccessSubTotal,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price:
                    '${orderHistoryDetails.subTotalExcludeTax(eligibilityState.isMYExternalSalesRepUser)}',
              ),
            ],
          ),
          if (eligibilityState.salesOrgConfigs.showSubtotalTaxBreakdown)
            Row(
              key: WidgetKeys.orderSummaryTax,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eligibilityState.salesOrg.isVN
                      ? '${context.tr('Tax')}:'
                      : '${context.tr('Tax at')} ${orderHistoryDetails.totalTaxPercentage}%:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                PriceComponent(
                  key: WidgetKeys.orderSuccessSubTotal,
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                  price: orderHistoryDetails.totalTax.toString(),
                ),
              ],
            ),
          const Divider(
            indent: 0,
            endIndent: 0,
            thickness: 0.5,
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Grand total')}:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                key: WidgetKeys.orderSuccessGrandTotal,
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price:
                    '${orderHistoryDetails.grandTotal(eligibilityState.isMYExternalSalesRepUser)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
