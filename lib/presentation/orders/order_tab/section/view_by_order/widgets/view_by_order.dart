part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrder extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;

  const _ViewByOrder({
    Key? key,
    required this.viewByOrderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return CustomCard(
      key: WidgetKeys.viewByOrdersItemKey,
      child: ListTile(
        onTap: () {
          context.read<ViewByOrderDetailsBloc>().add(
                ViewByOrderDetailsEvent.setOrderDetails(
                  orderHistoryDetails: viewByOrderHistoryItem,
                ),
              );
          context.router.push(
            const ViewByOrderDetailsPageRoute(),
          );
        },
        contentPadding: const EdgeInsets.all(10),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.tr('Order')} #${viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
              key: WidgetKeys.viewByOrdersCodeLabelKey,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${viewByOrderHistoryItem.itemCount} ${context.tr('items')}',
                    key: WidgetKeys.viewByOrdersQtyLabelKey,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  PriceComponent(
                    salesOrgConfig: salesOrgConfigs,
                    price: viewByOrderHistoryItem
                        .orderedItemsValue(
                          context
                              .read<EligibilityBloc>()
                              .state
                              .isMYExternalSalesRepUser,
                        )
                        .toString(),
                    title: context.tr('Order total : '),
                    priceLabelStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                  ),
                ],
              ),
            ),
            BlocProvider(
              create: (context) => locator<ReOrderPermissionBloc>(),
              child: _BuyAgainButton(
                viewByOrderHistoryItem: viewByOrderHistoryItem,
                key: WidgetKeys.viewByOrderBuyAgainButtonKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
