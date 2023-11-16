part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_order_details/view_by_order_details.dart';

class _ViewByOrderStatusTracker extends StatelessWidget {
  final OrderHistoryDetails orderHistoryDetails;
  const _ViewByOrderStatusTracker({
    Key? key,
    required this.orderHistoryDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusTrackerSection(
      createDateTime: orderHistoryDetails.createdDate,
      title: context.tr('Order status'),
      status: orderHistoryDetails.processingStatus.getOrDefaultValue(''),
      onTap: () => _showDetailsPage(
        context: context,
      ),
    );
  }

  void _showDetailsPage({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isDismissible: false,
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * .8),
      builder: (_) => OrderStatusSection(
        deliveryDate: orderHistoryDetails.requestedDeliveryDate,
        steps: orderHistoryDetails.processingStatus.viewByOrderHistorySteps,
      ),
    );
  }
}
