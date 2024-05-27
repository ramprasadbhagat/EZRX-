part of 'package:ezrxmobile/presentation/orders/cart/price_summary/price_summary_tile.dart';

class _SmallOrderFee extends StatelessWidget {
  final OrderEligibilityState orderEligibilityState;

  const _SmallOrderFee({
    Key? key,
    required this.orderEligibilityState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final messageObject = orderEligibilityState.smallOrderFeeAppliedMessage;

    return _SmallOrderFeeSection(
      value: orderEligibilityState.smallOrderFee,
      message: context.tr(
        messageObject.message,
        namedArgs: messageObject.arguments,
      ),
    );
  }
}

class _AplSmallOrderFee extends StatelessWidget {
  final CartState cartState;

  const _AplSmallOrderFee({Key? key, required this.cartState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return _SmallOrderFeeSection(
      value: cartState.aplSimulatorOrder.smallOrderFee,
      message: context.tr(
        'A small order fee applies to orders with ZP in-stock items that are under the minimum order value of {smallOrderFee} for ZP subtotal.',
        namedArgs: {
          'smallOrderFee': StringUtils.displayPrice(
            eligibilityState.salesOrgConfigs,
            eligibilityState.salesOrg.smallOrderThreshold,
          ),
        },
      ),
    );
  }
}

class _SmallOrderFeeSection extends StatelessWidget {
  final double value;
  final String message;

  const _SmallOrderFeeSection({
    Key? key,
    required this.value,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Column(
      key: WidgetKeys.checkoutSummarySmallOrderFee,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Small order fee'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            _DisplayPrice(
              priceComponent: PriceComponent(
                key: WidgetKeys.checkoutSummarySmallOrderFeePrice,
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: value.toString(),
                type: PriceStyle.summaryPrice,
              ),
            ),
          ],
        ),
        InfoLabel(
          textValue: message,
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          mainColor: ZPColors.blueAccent,
          textStyle: Theme.of(context).textTheme.bodySmall,
          textColor: ZPColors.infoTextBlueColor,
        ),
      ],
    );
  }
}
