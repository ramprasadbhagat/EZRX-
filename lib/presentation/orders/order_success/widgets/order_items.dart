part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderItems extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;
  const _OrderItems({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orderItems.isEmpty) return const SizedBox.shrink();

    return Column(
      key: WidgetKeys.orderSuccessItemsSection,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
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
                      Column(
                        children: item.viewByOrderItem.mapIndexed(
                          (index, e) {
                            final eligibilityState =
                                context.read<EligibilityBloc>().state;

                            final isIDMarket = eligibilityState.salesOrg.isID;

                            return CommonTileItem(
                              key: WidgetKeys.orderSuccessItem(index),
                              materialNumber: e.materialNumber,
                              label: e.combinationCode(
                                showGMCPart:
                                    eligibilityState.salesOrgConfigs.enableGMC,
                              ),
                              subtitle: '',
                              priceComponent: Row(
                                children: [
                                  ListPriceStrikeThroughComponent(
                                    priceAggregate: e.priceAggregate,
                                  ),
                                  PriceComponent(
                                    key: WidgetKeys.orderSuccessItemUnitPrice,
                                    price: e.itemUnitPrice(
                                      isIDMarket,
                                    ),
                                    salesOrgConfig: context
                                        .read<EligibilityBloc>()
                                        .state
                                        .salesOrgConfigs,
                                  ),
                                ],
                              ),
                              title: e.materialDescription,
                              quantity: '${e.qty}',
                              isQuantityBelowImage: false,
                              isQuantityRequired: false,
                              statusTag: e.productTag,
                              showOfferTag: e.showOfferTag,
                              footerWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${'Qty'.tr()}: ${e.qty}',
                                    key: WidgetKeys.orderSuccessItemQty,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: ZPColors.black,
                                        ),
                                  ),
                                  PriceComponent(
                                    key: WidgetKeys.orderSuccessItemTotalPrice,
                                    salesOrgConfig: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    price: e.itemTotalPrice(
                                      isIDMarket,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
