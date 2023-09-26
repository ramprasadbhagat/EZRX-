part of 'package:ezrxmobile/presentation/orders/order_success/order_success_page.dart';

class _OrderItems extends StatelessWidget {
  final List<ViewByOrdersGroup> orderItems;
  const _OrderItems({
    Key? key,
    required this.orderItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Text(
            '${'Your items'.tr()}(${context.read<OrderSummaryBloc>().state.orderHistoryDetails.orderItemsCount})',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: ZPColors.black,
                ),
          ),
        ),
        Column(
          children: orderItems
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          item.principalName.getOrDefaultValue(''),
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ZPColors.black,
                                  ),
                        ),
                      ),
                      Column(
                        children: item.viewByOrderItem.map(
                          (e) {
                            return CommonTileItem(
                              materialNumber: e.materialNumber,
                              label: removeLeadingZero(
                                e.materialNumber.getOrDefaultValue(''),
                              ),
                              subtitle: StringUtils.displayPriceByMaterialType(
                                context
                                    .read<EligibilityBloc>()
                                    .state
                                    .salesOrgConfigs,
                                e.unitPrice.zpPrice,
                                e.type,
                              ),
                              title: e.materialDescription,
                              quantity: '${e.qty}',
                              isQuantityBelowImage: true,
                              isQuantityRequired: false,
                              statusTag: e.productTag,
                              footerWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${'Qty'.tr()}: ${e.qty}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: ZPColors.black,
                                        ),
                                  ),
                                  PriceComponent(
                                    salesOrgConfig: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    price: e.priceByMaterialType,
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
