part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItemTile extends StatelessWidget {
  const _ViewByOrderItemTile({
    Key? key,
    required this.orderHistoryItem,
    required this.salesOrgConfigs,
  }) : super(key: key);
  final OrderHistoryItem orderHistoryItem;
  final SalesOrganisationConfigs salesOrgConfigs;

  @override
  Widget build(BuildContext context) {
    final headerText =
        '${context.tr(orderHistoryItem.status.prefix)} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}';

    final subtitle = (orderHistoryItem.manufacturerPrefix.isNotEmpty
            ? '${context.tr(orderHistoryItem.manufacturerPrefix)}: '
            : '') +
        orderHistoryItem.principalData.principalName.name;

    return CustomCard(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: StatusLabel(
                key: WidgetKeys.orderItemStatusKey,
                status: StatusType(
                  orderHistoryItem.status.displayOrderStatus,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ImageBox(
                    materialNumber: orderHistoryItem.materialNumber,
                    isCovidItem: orderHistoryItem.isCovid,
                    showOfferTag: orderHistoryItem.isOfferItem,
                    showBundleTag: orderHistoryItem.isBundle,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 8, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (orderHistoryItem.isMarketPlace)
                                Row(
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ZPColors.orangeChipColor,
                                        ),
                                      ),
                                      child: const MarketPlaceIcon(),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              Flexible(
                                child: Text(
                                  orderHistoryItem.combinationCode(
                                    showGMCPart: salesOrgConfigs.enableGMC,
                                    showIRNPart: salesOrgConfigs.enableIRN,
                                  ),
                                  key: WidgetKeys.viewOrderByItemTileLabel,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              if (!salesOrgConfigs.salesOrg.isID &&
                                  orderHistoryItem.productTag
                                      .getOrDefaultValue('')
                                      .isNotEmpty) ...[
                                const SizedBox(width: 5),
                                StatusLabel(
                                  key: WidgetKeys.commonTileItemStatusLabel,
                                  status: orderHistoryItem.productTag,
                                  valueColor: orderHistoryItem
                                      .productTag.displayStatusTextColor,
                                ),
                              ],
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              orderHistoryItem.materialDescription,
                              key: WidgetKeys.viewOrderByItemTileTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            key: WidgetKeys.viewOrderByItemTileSubTitle,
                            subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: ZPColors.darkerGrey,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: RichText(
                      key: WidgetKeys.viewByItemsOrderDetailOrderOrQueueNumber,
                      text: TextSpan(
                        text: headerText,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: ZPColors.black,
                            ),
                        children: [
                          WidgetSpan(
                            child: orderHistoryItem.status.isInQueue
                                ? const QueueNumberInfoIcon()
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _InvoiceNumber(
                    invoiceData: orderHistoryItem.invoiceNumber,
                  ),
                ],
              ),
            ),
            const Divider(
              endIndent: 0,
              indent: 0,
              color: ZPColors.lightGray2,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: _Subtitle(
                quantity: orderHistoryItem.qty.toString(),
                priceComponent: PriceComponent(
                  type: PriceStyle.tenderViewOrderByItemPrice,
                  price: orderHistoryItem.totalPrice.toString(),
                  salesOrgConfig:
                      context.read<EligibilityBloc>().state.salesOrgConfigs,
                ),
              ),
            ),
            if (orderHistoryItem.tenderOrderReason.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TenderContractSection(
                  tenderContract: orderHistoryItem.orderItemTenderContract,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({
    Key? key,
    required this.quantity,
    required this.priceComponent,
  }) : super(key: key);

  final String quantity;
  final Widget priceComponent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (quantity.isNotEmpty)
          Text(
            '${context.tr('Qty')}: $quantity',
            key: WidgetKeys.commonTileItemQty,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: ZPColors.black,
                ),
          ),
        priceComponent,
      ],
    );
  }
}

class _ImageBox extends StatelessWidget {
  const _ImageBox({
    required this.materialNumber,
    required this.isCovidItem,
    required this.showOfferTag,
    required this.showBundleTag,
  });

  final bool isCovidItem;
  final bool showOfferTag;
  final bool showBundleTag;
  final MaterialNumber materialNumber;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      showBorder: true,
      showShadow: false,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.fromLTRB(0, 7, 8, 0),
      child: Stack(
        children: [
          ProductImage(
            materialNumber: materialNumber,
            fit: BoxFit.fitHeight,
            width: 80,
            height: 80,
          ),
          if (showOfferTag) ProductTag.onOfferIcon(),
          if (showBundleTag) ProductTag.bundleOfferIcon(),
          if (isCovidItem)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.055,
              child: const CovidTag(),
            ),
        ],
      ),
    );
  }
}
