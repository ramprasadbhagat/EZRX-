part of 'package:ezrxmobile/presentation/returns/new_request/tabs/return_review_tab/return_review_tab.dart';

class _QuantityAndPrice extends StatelessWidget {
  const _QuantityAndPrice({
    Key? key,
    required this.quantity,
    required this.unitPrice,
  }) : super(key: key);

  final int quantity;
  final double unitPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${'Qty'.tr()}: $quantity',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.black,
              ),
        ),
        PriceComponent(
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: unitPrice.toString(),
        ),
      ],
    );
  }
}
