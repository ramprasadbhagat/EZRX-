part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class ViewByItemOrderItemTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ViewByItemOrderItemTile({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return OrderItemCommonTile(
      batchExpiryDate: OrderHistoryStockInfo.viewByItem(
        eligibilityState: eligibilityState,
        item: orderHistoryItem,
      ),
      sellerName: orderHistoryItem.sellerName,
      label: orderHistoryItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
      ),
      priceComponentSubtitle: _PriceComponentSubtitle(
        orderHistoryItem: orderHistoryItem,
      ),
      footerWidget: QuantityAndPriceWithTax.order(
        quantity: orderHistoryItem.qty,
        taxPercentage: orderHistoryItem.taxPercentage,
        netPrice: orderHistoryItem.itemTotalNetPrice(
          eligibilityState.salesOrgConfigs.displayItemTaxBreakdown,
          eligibilityState.salesOrg.isID,
        ),
        isTopAlignment: true,
      ),
      statusWidget: StatusLabel(
        key: WidgetKeys.orderItemStatusKey,
        status: StatusType(
          orderHistoryItem.status.displayOrderStatus,
        ),
      ),
      quantity: orderHistoryItem.qty.toString(),
      materialNumber: orderHistoryItem.materialNumber,
      materialDescription: orderHistoryItem.materialDescription,
      tenderContractSection: !orderHistoryItem.tenderOrderReason.isEmpty
          ? TenderContractSection(
              tenderContract: orderHistoryItem.orderItemTenderContract,
            )
          : const SizedBox.shrink(),
      statusTag: eligibilityState.salesOrg.isID
          ? StatusType('')
          : orderHistoryItem.productTag,
      isCovidItem: orderHistoryItem.isCovid,
      showOfferTag: orderHistoryItem.isOfferItem,
      showBundleTag: orderHistoryItem.isBundle,
    );
  }
}

class _PriceComponentSubtitle extends StatelessWidget {
  const _PriceComponentSubtitle({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  final OrderHistoryItem orderHistoryItem;

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    if (!orderHistoryItem.isBonusMaterial) {
      return Wrap(
        children: [
          if (eligibilityState.salesOrgConfigs.enableListPrice &&
              orderHistoryItem.showMaterialListPrice)
            PriceComponent(
              key: WidgetKeys.materialListPriceStrikeThrough,
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              price: orderHistoryItem.getListPrice.toString(),
              type: PriceStyle.materialListPriceStrikeThrough,
            ),
          OrderItemPrice(
            unitPrice: orderHistoryItem.itemUnitPrice(
              eligibilityState.salesOrgConfigs.salesOrg.isID,
            ),
            originPrice: orderHistoryItem.originPrice.toString(),
            showPreviousPrice: false,
            hidePrice: orderHistoryItem.hidePrice,
          ),
        ],
      );
    }

    return const SizedBox.shrink();
  }
}
