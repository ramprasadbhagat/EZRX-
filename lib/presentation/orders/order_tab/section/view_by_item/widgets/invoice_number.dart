part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _InvoiceNumber extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  const _InvoiceNumber({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: ZPColors.accentColor,
          height: 15,
          indent: 0,
          endIndent: 0,
        ),
        Text(
          '${'Invoice'.tr()} #${orderHistoryItem.invoiceNumber}',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
