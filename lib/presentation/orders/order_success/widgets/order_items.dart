part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _MaterialItemSection extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;
  final bool isMarketPlace;

  const _MaterialItemSection({
    Key? key,
    required this.orderItems,
    this.isMarketPlace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orderItems.isEmpty) return const SizedBox();

    return Column(
      key: isMarketPlace
          ? WidgetKeys.orderSuccessMPItemsSection
          : WidgetKeys.orderSuccessZPItemsSection,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: orderItems
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: isMarketPlace
                        ? MarketPlaceSellerTitle(
                            sellerName: item.principalName.name,
                            textColor: ZPColors.black,
                          )
                        : Text(
                            item.principalName.name,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                  color: ZPColors.black,
                                ),
                          ),
                  ),
                  ...item.viewByOrderItem
                      .mapIndexed(
                        (index, e) => _MaterialItem(
                          key: WidgetKeys.orderSuccessMaterialItem(index),
                          orderItem: e,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _MaterialItem extends StatelessWidget {
  final OrderHistoryDetailsOrderItem orderItem;

  const _MaterialItem({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    final isIDMarket = eligibilityState.salesOrg.isID;

    final aplPromotions = context.read<CartBloc>().state.aplPromotionLabel(
          orderItem.priceAggregate.getMaterialNumber,
        );

    return CommonTileItem(
      materialNumber: orderItem.materialNumber,
      label: orderItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
      ),
      subtitle: '',
      priceComponent: !orderItem.isBonus
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrderItemPrice(
                  unitPrice: orderItem.itemUnitPrice(
                    isIDMarket,
                  ),
                  originPrice: orderItem.itemOriginPrice,
                  showPreviousPrice: orderItem.isCounterOffer,
                  hidePrice: orderItem.hidePrice,
                ),
                //Promotional Information for ID market from aplSimulatedOrder
                if (aplPromotions.isNotEmpty)
                  Text(
                    '${aplPromotions.map(
                          (e) => context.tr(
                            e.message,
                            namedArgs: e.arguments,
                          ),
                        ).join(',')} ${context.tr('offer applied')}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ZPColors.extraLightGrey4,
                          fontStyle: FontStyle.italic,
                        ),
                    key: WidgetKeys.promotionLabel(
                      orderItem.priceAggregate.getMaterialNumber.getValue(),
                    ),
                  ),
              ],
            )
          : const SizedBox.shrink(),
      title: orderItem.materialDescription,
      quantity: '${orderItem.qty}',
      isQuantityBelowImage: false,
      isQuantityRequired: false,
      statusTag: orderItem.productTag,
      showOfferTag: orderItem.showOfferTag,
      labelTrailing: orderItem.isBonus && !orderItem.inStock
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: StatusLabel(
                status: eligibilityState.outOfStockProductStatus,
                valueColor: eligibilityState
                    .outOfStockProductStatus.displayStatusTextColor,
              ),
            )
          : const SizedBox.shrink(),
      footerWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${'Qty'.tr()}: ${orderItem.qty}',
            key: WidgetKeys.cartItemProductQty,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.black,
                ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              PriceComponent(
                key: WidgetKeys.orderSuccessItemTotalPrice,
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: orderItem.itemNetPrice(
                  eligibilityState.salesOrgConfigs.displayItemTaxBreakdown,
                  isIDMarket,
                ),
              ),
              if (orderItem.showItemTax)
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: ItemTax(
                    cartItem: orderItem.priceAggregate,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
