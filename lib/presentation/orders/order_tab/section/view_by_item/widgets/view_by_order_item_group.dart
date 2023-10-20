part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItemGroup extends StatelessWidget {
  final ViewByItemGroup orderHistoryItem;
  final bool showDivider;
  final bool showBanner;
  const _ViewByOrderItemGroup({
    Key? key,
    required this.orderHistoryItem,
    required this.showDivider,
    required this.showBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.viewByItemsOrderGroupKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showBanner)
          InfoLabel(
            textValue: context
                .tr('Order history is limited to the last 6 months from today'),
            mainColor: ZPColors.blueAccent,
            margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          ),
        if (showDivider)
          const Divider(
            indent: 0,
            height: 20,
            endIndent: 0,
            color: ZPColors.lightGray2,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  '${context.tr('Ordered on')} ${orderHistoryItem.createdDate.dateString}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkerGrey,
                      ),
                ),
              ),
              ...orderHistoryItem.orderHistoryItem.map((e) {
                return _ViewByOrderItem(
                  orderHistoryItem: e,
                  customerCodeInfo:
                      context.read<EligibilityBloc>().state.customerCodeInfo,
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
