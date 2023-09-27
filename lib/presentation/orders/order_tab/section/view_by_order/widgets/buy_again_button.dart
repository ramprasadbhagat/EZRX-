part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class _BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetailsOrderHeader viewByOrderHistoryItem;

  const _BuyAgainButton({Key? key, required this.viewByOrderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          previous.isUpserting != current.isUpserting,
      builder: (context, stateCart) {
        return BlocListener<ViewByOrderDetailsBloc, ViewByOrderDetailsState>(
          listenWhen: (previous, current) =>
              previous.isLoading != current.isLoading && !current.isLoading,
          listener: (context, viewByOrderState) {
            context.read<ReOrderPermissionBloc>().add(
                  ReOrderPermissionEvent.fetch(
                    orderHistoryDetailsOrderItems: viewByOrderState
                        .orderHistoryDetails.orderHistoryDetailsOrderItem
                        .toList(),
                    salesOrganisation:
                        context.read<EligibilityBloc>().state.salesOrganisation,
                    shipToInfo:
                        context.read<EligibilityBloc>().state.shipToInfo,
                    customerCodeInfo:
                        context.read<EligibilityBloc>().state.customerCodeInfo,
                  ),
                );
          },
          child: BlocConsumer<ReOrderPermissionBloc, ReOrderPermissionState>(
            listenWhen: (previous, current) =>
                previous.isFetching != current.isFetching &&
                !current.isFetching,
            listener: (context, reOrderState) {
              final cartState = context.read<CartBloc>().state;
              context.read<CartBloc>().add(
                    CartEvent.addHistoryItemsToCart(
                      priceAggregate: reOrderState
                          .validOrderHistoryDetailsOrderItems
                          .map(
                            (e) => PriceAggregate.empty().copyWith(
                              materialInfo: MaterialInfo.empty().copyWith(
                                type: e.productType,
                                materialNumber: e.materialNumber,
                                parentID:
                                    e.productType.typeBundle ? e.parentId : '',
                              ),
                              salesOrgConfig: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrgConfigs,
                            ),
                          )
                          .toList(),
                      quantity: reOrderState.validOrderHistoryDetailsOrderItems
                          .map(
                            (e) =>
                                (e.productType.typeMaterial
                                    ? cartState.getQuantityOfProduct(
                                        productNumber: e.materialNumber,
                                      )
                                    : cartState.getQuantityOfBundle(
                                        bundleCode: e.parentId,
                                        materialNumber: e.materialNumber,
                                      )) +
                                e.qty,
                          )
                          .toList(),
                      user: context.read<EligibilityBloc>().state.user,
                      counterOfferDetails: RequestCounterOfferDetails.empty(),
                    ),
                  );
            },
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.maxFinite, 45),
                ),
                onPressed: stateCart.isFetching || stateCart.isUpserting
                    ? null
                    : () {
                        context.read<ViewByOrderDetailsBloc>().add(
                              ViewByOrderDetailsEvent.fetch(
                                user:
                                    context.read<EligibilityBloc>().state.user,
                                orderNumber: viewByOrderHistoryItem.orderNumber,
                                customerCodeInfo: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .customerCodeInfo,
                                salesOrganisation: context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrganisation,
                              ),
                            );
                      },
                child: LoadingShimmer.withChild(
                  enabled: state.isFetching ||
                      stateCart.isUpserting ||
                      stateCart.isFetching,
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
