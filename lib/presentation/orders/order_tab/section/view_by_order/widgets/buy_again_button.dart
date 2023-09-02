part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  const _BuyAgainButton({Key? key, required this.viewByOrderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isUpserting != current.isUpserting,
      builder: (context, stateCart) {
        return BlocListener<ReOrderPermissionBloc, ReOrderPermissionState>(
          listenWhen: (previous, current) =>
              previous.isFetching != current.isFetching && !current.isFetching,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () => context.read<ViewByOrderDetailsBloc>().add(
                    ViewByOrderDetailsEvent.fetchDetailItemList(
                      validOrderHistoryDetailsOrderItems:
                          state.validOrderHistoryDetailsOrderItems,
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<EligibilityBloc>().state.shipToInfo,
                      locale: context.locale,
                    ),
                  ),
              (option) => option.fold(
                (failure) => ErrorUtils.handleApiFailure(context, failure),
                (_) {},
              ),
            );
          },
          child: BlocConsumer<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
            listenWhen: (previous, current) =>
                previous.isFetchingList != current.isFetchingList &&
                !current.isFetchingList,
            listener: (context, state) {
              final materialPriceBlocState =
                  context.read<MaterialPriceBloc>().state;
              final cartBlocState = context.read<CartBloc>().state;
              final viewByOrderDetailsBlocState =
                  context.read<ViewByOrderDetailsBloc>().state;
              context.read<CartBloc>().add(
                    CartEvent.addHistoryItemsToCart(
                      priceAggregate: state.productDetailAggregateList
                          .map(
                            (e) => PriceAggregate.empty().copyWith(
                              materialInfo: e.materialInfo,
                              price: materialPriceBlocState.materialPrice[
                                      e.materialInfo.materialNumber] ??
                                  Price.empty(),
                              salesOrgConfig:
                                  context.read<SalesOrgBloc>().state.configs,
                            ),
                          )
                          .toList(),
                      quantity: state.productDetailAggregateList
                          .map(
                            (e) =>
                                cartBlocState.getQuantityOfProduct(
                                  productNumber: e.materialInfo.materialNumber,
                                ) +
                                viewByOrderDetailsBlocState.orderHistoryDetails
                                    .getOrderHistoryDetailsOrderItem(
                                      materialNumber:
                                          e.materialInfo.materialNumber,
                                    )
                                    .qty,
                          )
                          .toList(),
                      user: context.read<UserBloc>().state.user,
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                    ),
                  );
            },
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading ||
                previous.isFetchingList != current.isFetchingList,
            builder: (context, state) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 45),
                ),
                onPressed: state.isLoading ||
                        state.isFetchingList ||
                        stateCart.isUpserting
                    ? null
                    : () {
                        context.read<ReOrderPermissionBloc>().add(
                              ReOrderPermissionEvent.fetch(
                                orderHistoryDetailsOrderItems: state
                                    .orderHistoryDetails
                                    .orderHistoryDetailsOrderItem
                                    .toList(),
                                salesOrganisation: context
                                    .read<SalesOrgBloc>()
                                    .state
                                    .salesOrganisation,
                                shipToInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .shipToInfo,
                                customerCodeInfo: context
                                    .read<CustomerCodeBloc>()
                                    .state
                                    .customerCodeInfo,
                              ),
                            );
                      },
                child: LoadingShimmer.withChild(
                  enabled: state.isLoading ||
                      state.isFetchingList ||
                      stateCart.isUpserting,
                  child: Text(
                    'Buy again'.tr(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
