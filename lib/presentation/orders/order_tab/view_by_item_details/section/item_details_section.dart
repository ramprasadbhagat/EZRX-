part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class ItemDetailsSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ItemDetailsSection({
    super.key,
    required this.orderHistoryItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12.0,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!orderHistoryItem.isMarketPlace) ...[
            Text(
              orderHistoryItem.principalData.principalName.name,
              style: Theme.of(context).textTheme.labelMedium,
              key: WidgetKeys.manufacturerMaterials,
            ),
            const SizedBox(height: 10),
          ],
          ViewByItemOrderItemTile(orderHistoryItem: orderHistoryItem),
        ],
      ),
    );
  }
}
