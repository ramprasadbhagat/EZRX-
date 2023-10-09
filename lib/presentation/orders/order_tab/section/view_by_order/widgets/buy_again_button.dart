part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_order/view_by_order_section.dart';

class BuyAgainButton extends StatelessWidget {
  final OrderHistoryDetails viewByOrderHistoryItem;
  final String currentPath;
  const BuyAgainButton({
    Key? key,
    required this.viewByOrderHistoryItem,
    required this.currentPath,
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
                  viewByOrderHistoryItem.orderNumber &&
              currentPath != context.router.currentPath,
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
                      context.read<ReOrderPermissionBloc>().add(
                            ReOrderPermissionEvent.fetch(
                              orderHistoryDetailsOrderItems:
                                  viewByOrderHistoryItem
                                      .orderHistoryDetailsOrderItem,
                              salesOrganisation: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .salesOrganisation,
                              shipToInfo: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .shipToInfo,
                              customerCodeInfo: context
                                  .read<EligibilityBloc>()
                                  .state
                                  .customerCodeInfo,
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
}
