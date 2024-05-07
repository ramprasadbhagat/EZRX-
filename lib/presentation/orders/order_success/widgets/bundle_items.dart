part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _BundleItemSection extends StatelessWidget {
  final OrderNumber orderNumber;
  final List<ViewByOrdersGroup> bundleItems;
  const _BundleItemSection({
    Key? key,
    required this.orderNumber,
    required this.bundleItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bundleItems.isEmpty) return const SizedBox.shrink();

    return Padding(
      key: WidgetKeys.viewByOrderDetailItemsSection,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: bundleItems
            .map(
              (e) => OrderBundleItem(
                viewByOrdersGroup: e,
                orderNumber: orderNumber,
              ),
            )
            .toList(),
      ),
    );
  }
}
