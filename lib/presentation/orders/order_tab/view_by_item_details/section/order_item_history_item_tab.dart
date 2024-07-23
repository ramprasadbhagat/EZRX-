part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class _OrderItemHistoryItemTab extends StatelessWidget {
  const _OrderItemHistoryItemTab();

  @override
  Widget build(BuildContext context) {
    final state = context.read<ViewByItemDetailsBloc>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemDetailsSection(
          orderHistoryItem: state.orderHistoryItem,
        ),
        OtherItemDetailsSection(
          otherItems: state.otherItems,
          isMarketPlace: state.orderHistoryItem.isMarketPlace,
        ),
      ],
    );
  }
}
