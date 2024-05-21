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
                currentRoutePath == 'orders/view_by_order_details_page' ||
                currentRoutePath == 'orders/cart')) {
          context.read<ReOrderPermissionBloc>().add(
                ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                  orderNumberWillUpsert: OrderNumber(''),
                ),
              );

          state.apiFailureOrSuccessOption.fold(
            () {
              context.read<AdditionalDetailsBloc>().add(
                    AdditionalDetailsEvent.initiateFromHistory(
                      data: DeliveryInfoData.empty().copyWith(
                        mobileNumber: viewByOrderHistoryItem.telephoneNumber,
                      ),
                    ),
                  );

              context.router.push(const CartPageRoute());
            },
            (either) => either.fold(
              (failure) {
                _handleCartFailure(context, failure);
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
            reOrderState.failureOrSuccessOption.fold(
              () {
                context.read<CartBloc>().add(
                      CartEvent.addHistoryItemsToCart(
                        items: reOrderState.availableProducts(
                          context.read<MaterialPriceBloc>().state.materialPrice,
                        ),
                        counterOfferDetails: RequestCounterOfferDetails.empty(),
                      ),
                    );
              },
              (either) => either.fold(
                (failure) {
                  context.read<ReOrderPermissionBloc>().add(
                        ReOrderPermissionEvent.resetOrderNumberWillUpsert(
                          orderNumberWillUpsert: OrderNumber(''),
                        ),
                      );
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.orderNumberWillUpsert != current.orderNumberWillUpsert,
          builder: (context, state) {
            final isCustomerBlockedOrSuspended =
                context.read<EligibilityBloc>().state.customerBlockOrSuspended;

            return OutlinedButton(
              style: OutlinedButton.styleFrom(
                maximumSize: const Size(double.maxFinite, 45),
              ),
              onPressed: (state.orderNumberWillUpsert ==
                          viewByOrderHistoryItem.orderNumber ||
                      stateCart.isUpserting ||
                      stateCart.isFetching ||
                      isCustomerBlockedOrSuspended)
                  ? null
                  : () => _reOrder(context),
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

  void _reOrder(BuildContext context) {
    final cartState = context.read<CartBloc>().state;
    final cartProducts = cartState.cartProducts;

    if (cartProducts.isEmpty) {
      _buyAgain(context);

      return;
    }

    final isCovidMaterialAvailable =
        viewByOrderHistoryItem.isCovidMaterialAvailable;
    final containFocMaterialInCartProduct =
        cartState.containFocMaterialInCartProduct;

    if ((isCovidMaterialAvailable && !containFocMaterialInCartProduct) ||
        (!isCovidMaterialAvailable && containFocMaterialInCartProduct)) {
      _showDetailsPage(context);

      return;
    }

    _buyAgain(context);
  }

  void _showDetailsPage(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return AddToCartErrorSection.forCovid(
          cartContainsFocProduct:
              context.read<CartBloc>().state.containFocMaterialInCartProduct,
          context: context,
        );
      },
    ).then((value) {
      if (value != null) {
        _buyAgain(context);
      }
    });
  }

  void _buyAgain(BuildContext context) {
    _trackBuyAgainEvent(
      context,
      viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
    );

    context.read<ReOrderPermissionBloc>().add(
          ReOrderPermissionEvent.fetchOrder(
            orderHistoryDetailsOrderItems:
                viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
            orderNumberWillUpsert: viewByOrderHistoryItem.orderNumber,
          ),
        );
  }

  void _handleCartFailure(BuildContext context, ApiFailure failure) {
    if (failure == const ApiFailure.addAnimalHealthWithNormalProductToCart()) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: false,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (_) {
          return AddToCartErrorSection.forAnimalHealth(
            context: context,
          );
        },
      ).then((value) {
        if (value != null) {
          context.read<ReOrderPermissionBloc>().add(
                ReOrderPermissionEvent.fetchOrder(
                  orderHistoryDetailsOrderItems:
                      viewByOrderHistoryItem.orderHistoryDetailsOrderItem,
                  orderNumberWillUpsert: viewByOrderHistoryItem.orderNumber,
                ),
              );
        }
      });
    }
  }

  void _trackBuyAgainEvent(
    BuildContext context,
    List<OrderHistoryDetailsOrderItem> items,
  ) {
    final currentPage =
        RouterUtils.buildRouteTrackingName(context.routeData.path);
    for (final item in items) {
      trackMixpanelEvent(
        TrackingEvents.buyAgainClicked,
        props: {
          TrackingProps.productName: item.materialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.clickAt: currentPage,
        },
      );

      trackClevertapEvent(
        TrackingEvents.reorderClicked,
        props: {
          TrackingProps.productName: item.materialDescription,
          TrackingProps.productNumber: item.materialNumber.displayMatNo,
          TrackingProps.productManufacturer:
              item.principalData.principalName.name,
          TrackingProps.clickAt: currentPage,
        },
      );
    }
  }
}
