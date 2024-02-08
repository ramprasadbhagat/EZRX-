part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _MaterialItemSection extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;

  const _MaterialItemSection({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: WidgetKeys.orderSuccessItemsSection,
      crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
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

    return CommonTileItem(
      materialNumber: orderItem.materialNumber,
      label: orderItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
      ),
      subtitle: '',
      priceComponent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (eligibilityState.salesOrgConfigs.enableListPrice &&
                  orderItem.showMaterialListPrice)
                ListPriceStrikeThroughComponent(
                  priceAggregate: orderItem.priceAggregate,
                ),
              OrderItemPrice(
                unitPrice: orderItem.itemUnitPrice(
                  isIDMarket,
                ),
                originPrice: orderItem.originPrice.toString(),
                showPreviousPrice: orderItem.isCounterOffer,
                hidePrice: orderItem.hidePrice,
              ),
            ],
          ),
          GovtListPriceComponent(
            price: orderItem.priceAggregate.display(PriceType.listPrice),
          ),
        ],
      ),
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
          : null,
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
            children: [
              PriceComponent(
                key: WidgetKeys.orderSuccessItemTotalPrice,
                salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                price: orderItem.itemTotalPrice(
                  isIDMarket,
                ),
              ),
              if (orderItem.showItemTax)
                ItemTax(
                  cartItem: orderItem.priceAggregate,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
