part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class _BuyAgainButton extends StatelessWidget {
  const _BuyAgainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCustomerBlockedOrSuspended =
        context.read<EligibilityBloc>().state.customerBlockOrSuspended;

    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain && !current.isBuyAgain,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            context.read<AdditionalDetailsBloc>().add(
                  AdditionalDetailsEvent.initiateFromHistory(
                    data: DeliveryInfoData.empty().copyWith(
                      mobileNumber: context
                          .read<ViewByItemDetailsBloc>()
                          .state
                          .orderHistoryItem
                          .telephoneNumber,
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
      },
      buildWhen: (previous, current) =>
          previous.isBuyAgain != current.isBuyAgain,
      builder: (context, stateCart) {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching &&
                !current.isFetching,
            listener: (context, state) {
              state.failureOrSuccessOption.fold(
                () {
                  context.read<CartBloc>().add(
                        CartEvent.addHistoryItemsToCart(
                          items: state.availableProducts(
                            context
                                .read<MaterialPriceBloc>()
                                .state
                                .materialPrice,
                          ),
                          counterOfferDetails:
                              RequestCounterOfferDetails.empty(),
                        ),
                      );
                },
                (either) => either.fold(
                  (failure) {
                    ErrorUtils.handleApiFailure(context, failure);
                  },
                  (_) {},
                ),
              );
            },
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, reOrderState) => SafeArea(
              child: OutlinedButton(
                key: WidgetKeys.viewByItemDetailBuyAgainButton,
                style: OutlinedButton.styleFrom(
                  maximumSize: const Size(double.maxFinite, 45),
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: ZPColors.primary),
                ),
                onPressed: reOrderState.isFetching ||
                        isCustomerBlockedOrSuspended ||
                        stateCart.isBuyAgain
                    ? null
                    : () => _reOrder(context),
                child: LoadingShimmer.withChild(
                  enabled: reOrderState.isFetching || stateCart.isBuyAgain,
                  child: Text(
                    context.tr('Buy again'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: ZPColors.primary,
                        ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
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
          _reOrder(context);
        }
      });
    }
  }

  void _reOrder(BuildContext context) {
    final viewByItemDetailState = context.read<ViewByItemDetailsBloc>().state;
    final cartState = context.read<CartBloc>().state;
    final cartProducts = cartState.cartProducts;

    if (cartProducts.isEmpty) {
      _buyAgain(context);

      return;
    }

    final isCovidMaterialAvailable =
        viewByItemDetailState.orderHistory.isCovidMaterialAvailable;
    final containFocMaterialInCartProduct =
        cartState.containFocMaterialInCartProduct;

    if ((isCovidMaterialAvailable && !containFocMaterialInCartProduct) ||
        (!isCovidMaterialAvailable && containFocMaterialInCartProduct)) {
      _showDetailsPage(context);

      return;
    }

    _buyAgain(context);
  }

  void _buyAgain(BuildContext context) {
    final viewByItemDetailState = context.read<ViewByItemDetailsBloc>().state;
    final item = viewByItemDetailState.orderHistoryItem;

    trackMixpanelEvent(
      TrackingEvents.buyAgainClicked,
      props: {
        TrackingProps.productName: item.materialDescription,
        TrackingProps.productNumber: item.materialNumber.displayMatNo,
        TrackingProps.productManufacturer:
            item.principalData.principalName.getOrDefaultValue(''),
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    trackClevertapEvent(
      TrackingEvents.reorderClicked,
      props: {
        TrackingProps.productName: item.materialDescription,
        TrackingProps.productNumber: item.materialNumber.displayMatNo,
        TrackingProps.productManufacturer:
            item.principalData.principalName.getOrDefaultValue(''),
        TrackingProps.clickAt:
            RouterUtils.buildRouteTrackingName(context.routeData.path),
      },
    );

    context.read<ReOrderPermissionBloc>().add(
          ReOrderPermissionEvent.fetchItem(
            orderHistoryDetail: viewByItemDetailState.orderHistory,
            item: item,
          ),
        );
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
        context.read<CartBloc>().add(
              CartEvent.addHistoryItemsToCart(
                items: context
                    .read<ReOrderPermissionBloc>()
                    .state
                    .availableProducts(
                      context.read<MaterialPriceBloc>().state.materialPrice,
                    ),
                counterOfferDetails: RequestCounterOfferDetails.empty(),
              ),
            );
      }
    });
  }
}
