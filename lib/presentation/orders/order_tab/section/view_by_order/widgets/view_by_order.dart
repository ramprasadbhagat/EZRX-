part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _ViewByOrder extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;

  const _ViewByOrder({
    Key? key,
    required this.viewByOrderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return CustomCard(
      key: WidgetKeys.viewByOrdersItemKey,
      child: ListTile(
        onTap: () {
          if (!context.read<ReOrderPermissionBloc>().state.isFetching &&
              !context.read<CartBloc>().state.isBuyAgain) {
            trackMixpanelEvent(
              MixpanelEvents.orderDetailViewed,
              props: {
                MixpanelProps.subTabFrom:
                    RouterUtils.buildRouteTrackingName(context.routeData.path),
              },
            );
            context.read<ViewByOrderDetailsBloc>().add(
                  ViewByOrderDetailsEvent.setOrderDetails(
                    orderHistoryDetails: viewByOrderHistoryItem,
                  ),
                );
            context.read<ViewByItemDetailsBloc>().add(
                  ViewByItemDetailsEvent.searchOrderHistory(
                    searchKey: SearchKey(
                      viewByOrderHistoryItem.orderNumber.getValue(),
                    ),
                  ),
                );
            context.router.push(
              const ViewByOrderDetailsPageRoute(),
            );
          }
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Flexible(
                  child: Text(
                    '${context.tr(viewByOrderHistoryItem.processingStatus.prefix)} #${viewByOrderHistoryItem.orderNumber.getOrDefaultValue('')}',
                    key: WidgetKeys.viewByOrdersCodeLabelKey,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                if (viewByOrderHistoryItem.processingStatus.isInQueue)
                  const QueueNumberInfoIcon(),
                if (eligibilityState.salesOrg.isID)
                  StatusLabel(
                    key: WidgetKeys.viewByOrderStatusKey,
                    status: StatusType(
                      context.tr(
                        viewByOrderHistoryItem.processingStatus
                            .getOrDefaultValue(''),
                      ),
                    ),
                  ),
              ],
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
                    salesOrgConfig: eligibilityState.salesOrgConfigs,
                    price: eligibilityState
                            .salesOrgConfigs.displaySubtotalTaxBreakdown
                        ? '${viewByOrderHistoryItem.grandTotal(eligibilityState.isMYExternalSalesRepUser, isIDMarket: eligibilityState.isIDMarket)}'
                        : '${viewByOrderHistoryItem.orderedItemsValue(eligibilityState.isMYExternalSalesRepUser, isIDMarket: eligibilityState.isIDMarket)}',
                    title: context.tr('Order total : '),
                    priceLabelStyle:
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.darkGray,
                            ),
                  ),
                ],
              ),
            ),
            if (!eligibilityState.user.disableCreateOrder)
              BuyAgainButton(
                viewByOrderHistoryItem: viewByOrderHistoryItem,
                key: WidgetKeys.viewByOrderBuyAgainButtonKey,
              ),
          ],
        ),
      ),
    );
  }
}
