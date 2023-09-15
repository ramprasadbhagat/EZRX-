part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItemGroup extends StatelessWidget {
  final ViewByItemGroup orderHistoryItem;
  final bool showDivider;
  const _ViewByOrderItemGroup({
    Key? key,
    required this.orderHistoryItem,
    required this.showDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.viewByItemsOrderGroupKey,
      children: [
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  '${'Ordered on'.tr()} ${orderHistoryItem.createdDate.dateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              ...orderHistoryItem.orderHistoryItem.map((e) {
                return _ViewByOrderItem(
                  orderHistoryItem: e,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  orderHistoryBasicInfo: context
                      .read<ViewByItemsBloc>()
                      .state
                      .orderHistoryList
                      .orderBasicInformation,
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
