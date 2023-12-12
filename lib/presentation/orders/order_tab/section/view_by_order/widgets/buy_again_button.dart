part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;
  const BuyAgainButton({
    Key? key,
    required this.viewByOrderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain && !current.isBuyAgain,
      listener: (context, state) {
        final reOrderPermissionOrderNumber =
            context.read<ReOrderPermissionBloc>().state.orderNumberWillUpsert;
        final currentRoutePath = context.router.currentPath;
        if (viewByOrderHistoryItem.orderNumber ==
                reOrderPermissionOrderNumber &&
            (currentRoutePath == 'main/orders_tab/orders/view_by_orders' ||
                currentRoutePath == 'orders/view_by_order_details_page')) {
          state.apiFailureOrSuccessOption.fold(
            () {
              context.read<ReOrderPermissionBloc>().add(
                    ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                      orderNumberWillUpsert: OrderNumber(''),
                    ),
                  );
              context.router.pushNamed('orders/cart');
            },
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleReorderFailure(context, failure);
              },
              (_) {},
            ),
          );
        }
      },
      buildWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain ||
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
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.orderNumberWillUpsert != current.orderNumberWillUpsert,
          builder: (context, state) {
            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(double.maxFinite, 45),
              ),
              onPressed: (state.orderNumberWillUpsert ==
                          viewByOrderHistoryItem.orderNumber ||
                      stateCart.isBuyAgainNotAllowed)
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
                    (stateCart.isBuyAgain ||
                        stateCart.isUpserting ||
                        stateCart.isFetching),
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
