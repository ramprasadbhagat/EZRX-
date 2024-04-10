part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class _BuyAgainButton extends StatelessWidget {
  const _BuyAgainButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCustomerBlockedOrSuspended =
        context.read<EligibilityBloc>().state.customerBlockOrSuspended;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
        listenWhen: (previous, current) =>
            previous.isFetching != current.isFetching && !current.isFetching,
        listener: (context, state) {
          state.failureOrSuccessOption.fold(
            () {
              context.read<CartBloc>().add(
                    CartEvent.addHistoryItemsToCart(
                      items: state.availableProducts(
                        context.read<MaterialPriceBloc>().state.materialPrice,
                      ),
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                    ),
                  );

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
              context.router.pushNamed('orders/cart');
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
            onPressed: reOrderState.isFetching || isCustomerBlockedOrSuspended
                ? null
                : () => _reOrder(context),
            child: LoadingShimmer.withChild(
              enabled: reOrderState.isFetching,
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
  }

  void _reOrder(BuildContext context) {
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
}
