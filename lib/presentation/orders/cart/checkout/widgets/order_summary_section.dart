part of 'package:ezrxmobile/presentation/orders/cart/checkout/checkout_page.dart';

class _OrderSummarySection extends StatelessWidget {
  final CartState cartState;
  const _OrderSummarySection({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('Order summary'),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: ZPColors.neutralsBlack,
              ),
        ),
        const SizedBox(height: 24.0),
        Row(
          key: WidgetKeys.checkoutSummarySubTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr(
                'Subtotal (${salesOrgConfig.displaySubtotalTaxBreakdown ? "excl" : "incl"}.tax):',
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: cartState.displaySubTotal.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        if (salesOrgConfig.displaySubtotalTaxBreakdown) ...[
          const SizedBox(height: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${context.tr('Tax at ')}${cartState.totalTaxPercent}%',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ZPColors.neutralsBlack,
                        ),
                  ),
                  PriceComponent(
                    salesOrgConfig: salesOrgConfig,
                    price: cartState.displayTotalTax.toString(),
                    type: PriceStyle.summaryPrice,
                  ),
                ],
              ),
              Text(
                context.tr('Applies to materials with full tax'),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ZPColors.neutralsBlack,
                      fontSize: 10,
                    ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryStampDuty,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Stamp duty:'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: 0.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Column(
          key: WidgetKeys.checkoutSummarySmallOrderFee,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('Small order fee'),
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),

                ///ToDo: hard code
                PriceComponent(
                  salesOrgConfig: salesOrgConfig,
                  price: 0.toString(),
                  type: PriceStyle.summaryPrice,
                ),
              ],
            ),
            // Text(
            //   'Applies to orders less than MYR 2,000,000.00'.tr(),
            //   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            //         color: ZPColors.neutralsBlack,
            //         fontSize: 10,
            //       ),
            // ),
          ],
        ),
        const SizedBox(height: 4.0),
        const Divider(
          thickness: 1,
          color: ZPColors.extraLightGrey3,
          indent: 0,
          endIndent: 0,
        ),
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryGrandTotal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Grand Total: '),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: cartState.displayGrandTotal.toString(),
              type: PriceStyle.totalPrice,
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          key: WidgetKeys.checkoutSummaryTotalSaving,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Total savings:'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceComponent(
              salesOrgConfig: salesOrgConfig,
              price: 0.toString(),
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
      ],
    );
  }
}
