part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;

  const BuyAgainButton({
    Key? key,
    required this.viewByOrderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.isUpserting != current.isUpserting,
      builder: (context, stateCart) {
        return BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching &&
              !current.isFetching &&
              current.orderNumberWillUpsert ==
                  viewByOrderHistoryItem.orderNumber,
          listener: (context, reOrderState) {
            context.read<CartBloc>().add(
                  CartEvent.addHistoryItemsToCart(
                    items: reOrderState.validOrderItems,
                    counterOfferDetails: RequestCounterOfferDetails.empty(),
                  ),
                );
            context.read<ReOrderPermissionBloc>().add(
                  ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                    orderNumberWillUpsert: OrderNumber(''),
                  ),
                );
            context.router.pushNamed('orders/cart');
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.orderNumberWillUpsert != current.orderNumberWillUpsert,
          builder: (context, state) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(double.maxFinite, 45),
              ),
              onPressed: state.orderNumberWillUpsert != OrderNumber('') ||
                      (state.orderNumberWillUpsert ==
                              viewByOrderHistoryItem.orderNumber &&
                          (stateCart.isUpserting || stateCart.isFetching))
                  ? null
                  : () {
                      _trackBuyAgainEvent(
                        context,
                        viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
                      );
                      context.read<ReOrderPermissionBloc>().add(
                            ReOrderPermissionEvent.fetchOrder(
                              orderHistoryDetailsOrderItems:
                                  viewByOrderHistoryItem
                                      .orderHistoryDetailsOrderItem,
                              orderNumberWillUpsert:
                                  viewByOrderHistoryItem.orderNumber,
                            ),
                          );
                    },
              child: LoadingShimmer.withChild(
                enabled: state.orderNumberWillUpsert ==
                        viewByOrderHistoryItem.orderNumber &&
                    (stateCart.isUpserting || stateCart.isFetching),
                child: Text(
                  'Buy again'.tr(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _trackBuyAgainEvent(
    BuildContext context,
    List<OrderHistoryDetailsOrderItem> items,
  ) {
    final currentPage =
        RouterUtils.buildRouteTrackingName(context.routeData.path);
    for (final item in items) {
      trackMixpanelEvent(
        MixpanelEvents.buyAgainClicked,
        props: {
          MixpanelProps.productName: item.materialDescription,
          MixpanelProps.productCode: item.materialNumber.displayMatNo,
          MixpanelProps.productManufacturer:
              item.principalData.principalName.name,
          MixpanelProps.clickAt: currentPage,
        },
      );
    }
  }
}
