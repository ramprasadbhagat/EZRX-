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
        children: [
          Row(
            children: [
              ListPriceStrikeThroughComponent(
                priceAggregate: orderItem.priceAggregate,
              ),
              PriceComponent(
                key: WidgetKeys.orderSuccessItemUnitPrice,
                price: orderItem.itemUnitPrice(
                  isIDMarket,
                ),
                salesOrgConfig:
                    context.read<EligibilityBloc>().state.salesOrgConfigs,
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
