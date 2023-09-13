part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderSummaary extends StatelessWidget {
  final OrderHistoryDetails orderHistoryDetails;
  const _OrderSummaary({Key? key, required this.orderHistoryDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 25.0,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          'Order summary'.tr(),
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
                'Subtotal (incl. tax):'.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price:
                    '${orderHistoryDetails.orderHistoryDetailsOrderHeader.orderValue}',
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
                'Grand total:'.tr(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              PriceComponent(
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price:
                    '${orderHistoryDetails.orderHistoryDetailsOrderHeader.grandTotal}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
