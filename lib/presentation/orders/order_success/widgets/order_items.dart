part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _MaterialItemSection extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;

  const _MaterialItemSection({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
      buildWhen: (previous, current) =>
          previous.orderHistory.orderHistoryItems !=
          current.orderHistory.orderHistoryItems,
      builder: (context, state) {
        if (orderItems.isEmpty ||
            state.orderHistory.orderHistoryItems.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          key: WidgetKeys.orderSuccessItemsSection,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: orderItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          item.principalName.name,
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ZPColors.black,
                                  ),
                        ),
                      ),
                      ...item.viewByOrderItem
                          .mapIndexed(
                            (index, e) => _MaterialItem(
                              key: WidgetKeys.orderSuccessMaterialItem(index),
                              orderItem: e,
                              viewByItemOrderHistory: state.orderHistory,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final OrderHistoryDetailsOrderItem orderItem;
  final OrderHistory viewByItemOrderHistory;

  const _MaterialItem({
    Key? key,
    required this.orderItem,
    required this.viewByItemOrderHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    final isIDMarket = eligibilityState.salesOrg.isID;

    return CommonTileItem(
      onTap: () => _goToViewByItemDetail(
        context,
        viewByItemOrderHistory,
        orderItem,
      ),
      materialNumber: orderItem.materialNumber,
      label: orderItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
      ),
      subtitle: '',
      priceComponent: Column(
        children: [
          Row(
            children: [
              ListPriceStrikeThroughComponent(
                priceAggregate: orderItem.priceAggregate,
              ),
              PriceComponent(
                key: WidgetKeys.orderSuccessItemUnitPrice,
                price: orderItem.itemUnitPrice(
                  isIDMarket,
                ),
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
              ),
            ],
          ),
          GovtListPriceComponent(
            price: orderItem.priceAggregate.display(PriceType.listPrice),
          ),
        ],
      ),
      title: orderItem.materialDescription,
      quantity: '${orderItem.qty}',
      isQuantityBelowImage: false,
      isQuantityRequired: false,
      statusTag: orderItem.productTag,
      showOfferTag: orderItem.showOfferTag,
      footerWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty'.tr()}: ${orderItem.qty}',
            key: WidgetKeys.cartItemProductQty,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          Column(
            children: [
              PriceComponent(
                key: WidgetKeys.orderSuccessItemTotalPrice,
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: orderItem.itemTotalPrice(
                  isIDMarket,
                ),
              ),
              if (orderItem.showItemTax)
                ItemTax(
                  cartItem: orderItem.priceAggregate,
                ),
            ],
          ),
        ],
      ),
    );
  }

  void _goToViewByItemDetail(
    BuildContext context,
    OrderHistory orderHistory,
    OrderHistoryDetailsOrderItem orderItem,
  ) {
    trackMixpanelEvent(
      MixpanelEvents.orderDetailViewed,
      props: {
        MixpanelProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderHistoryItem = orderHistory.orderHistoryItems.firstWhere(
      (e) => e.lineNumber == orderItem.lineNumber,
      orElse: () => orderHistory.orderHistoryItems.first,
    );

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistory,
            orderHistoryItem: orderHistoryItem,
            disableDeliveryDateForZyllemStatus:
                eligibilityState.salesOrgConfigs.disableDeliveryDate,
          ),
        );

    context.router.push(const ViewByItemDetailsPageRoute());
  }
}
