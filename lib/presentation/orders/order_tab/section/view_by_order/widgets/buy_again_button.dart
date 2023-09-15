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
        return BlocConsumer<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          listenWhen: (previous, current) =>
              previous.isFetchingList != current.isFetchingList &&
              !current.isFetchingList,
          listener: (context, state) {
            final materialPriceBlocState =
                context.read<MaterialPriceBloc>().state;
            final cartBlocState = context.read<CartBloc>().state;

            context.read<ReOrderPermissionBloc>().add(
                  ReOrderPermissionEvent.fetch(
                    orderHistoryDetailsOrderItems: state
                        .orderHistoryDetails.orderHistoryDetailsOrderItem
                        .toList(),
                    salesOrganisation:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  ),
                );
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
                              state.orderHistoryDetails
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
                      context.read<ViewByOrderDetailsBloc>().add(
                            ViewByOrderDetailsEvent.fetch(
                              user: context.read<UserBloc>().state.user,
                              orderHeader: viewByOrderHistoryItem,
                              customerCodeInfo: context
                                  .read<CustomerCodeBloc>()
                                  .state
                                  .customerCodeInfo,
                              salesOrganisation: context
                                  .read<SalesOrgBloc>()
                                  .state
                                  .salesOrganisation,
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
        );
      },
    );
  }
}
