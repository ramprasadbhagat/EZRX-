part of 'package:ezrxmobile/presentation/orders/order_tab/view_by_item_details/view_by_item_details.dart';

class ViewByItemOrderItemTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ViewByItemOrderItemTile({Key? key, required this.orderHistoryItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final headerText = _batchExpiryDateText(context);

    return CommonTileItem(
      subtitle: '',
      label: orderHistoryItem.combinationCode(
        showGMCPart: eligibilityState.salesOrgConfigs.enableGMC,
      ),
      title: orderHistoryItem.materialDescription,
      priceComponent: orderHistoryItem.isBonusMaterial
          ? null
          : Row(
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
                    eligibilityState.salesOrg.isID,
                  ),
                  originPrice: orderHistoryItem.originPrice.toString(),
                  showPreviousPrice: orderHistoryItem.isCounterOffer,
                  hidePrice: orderHistoryItem.hidePrice,
                ),
              ],
            ),
      statusWidget: StatusLabel(
        key: WidgetKeys.orderItemStatusKey,
        status: StatusType(orderHistoryItem.status.displayOrderStatus),
      ),
      quantity: '',
      isQuantityBelowImage: true,
      isQuantityRequired: false,
      materialNumber: orderHistoryItem.materialNumber,
      statusTag:
          eligibilityState.salesOrg.isID ? null : orderHistoryItem.productTag,
      headerText: eligibilityState.salesOrgConfigs.batchNumDisplay &&
              headerText.isNotEmpty
          ? headerText
          : '',
      headerTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: ZPColors.neutralsGrey1,
          ),
      isCovidItem: (eligibilityState.salesOrg.isPH &&
              orderHistoryItem.orderType.isCovidOrderTypeForPH) ||
          (eligibilityState.salesOrg.isSg &&
              orderHistoryItem.orderType.isCovidOrderTypeForSG),
      showOfferTag: orderHistoryItem.isOfferItem,
      showBundleTag: orderHistoryItem.isBundle,
      footerWidget: QuantityAndPriceWithTax.order(
        quantity: orderHistoryItem.qty,
        taxPercentage: orderHistoryItem.taxPercentage,
        netPrice: orderHistoryItem.itemTotalNetPrice(
          eligibilityState.salesOrgConfigs.displayItemTaxBreakdown,
          eligibilityState.salesOrg.isID,
        ),
      ),
    );
  }

  String _batchExpiryDateText(BuildContext context) {
    if (orderHistoryItem.isMarketPlace) {
      return '${context.tr('Batch')} NA (${context.tr('EXP')}: NA)';
    }

    if (orderHistoryItem.batchNumHasData) {
      return '${context.tr('Batch')}: ${orderHistoryItem.batch.displayDashIfEmpty}\n(${context.tr('EXP')}: ${orderHistoryItem.expiryDate.dateOrDashString})';
    }

    return '';
  }
}
