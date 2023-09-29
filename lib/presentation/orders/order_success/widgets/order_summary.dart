part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSummaary extends StatelessWidget {
  final OrderHistoryDetails orderHistoryDetails;
  const _OrderSummaary({Key? key, required this.orderHistoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMYExternalSalesRep =
        context.read<EligibilityBloc>().state.isMYExternalSalesRepUser;

    return ListTile(
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
                context.tr('Subtotal (incl. tax):'),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price:
                    '${orderHistoryDetails.orderedItemsValue(isMYExternalSalesRep)}',
              ),
            ],
          ),
          const Divider(
            indent: 0,
            endIndent: 0,
            thickness: 0.2,
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${context.tr('Grand Total')}:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
                price:
                    '${orderHistoryDetails.grandTotal(isMYExternalSalesRep)}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
