part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItem extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const _ViewByOrderItem({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return GestureDetector(
      onTap: () {
        trackMixpanelEvent(
          MixpanelEvents.orderDetailViewed,
          props: {
            MixpanelProps.subTabFrom:
                RouterUtils.buildRouteTrackingName(context.routeData.path),
          },
        );
        context.read<ViewByItemDetailsBloc>().add(
              ViewByItemDetailsEvent.setItemOrderDetails(
                orderHistory:
                    context.read<ViewByItemsBloc>().state.orderHistory,
                orderHistoryItem: orderHistoryItem,
                disableDeliveryDateForZyllemStatus:
                    salesOrgConfigs.disableDeliveryDate,
              ),
            );

        context.router.push(
          const ViewByItemDetailsPageRoute(),
        );
      },
      child: CommonTileItem(
        key: WidgetKeys.viewByItemsOrderItemKey,
        label: orderHistoryItem.combinationCode(
          showGMCPart: salesOrgConfigs.enableGMC,
        ),
        title: orderHistoryItem.materialDescription,
        subtitle:
            orderHistoryItem.principalData.principalName.getOrDefaultValue(''),
        isCovidItem: orderHistoryItem.orderType.isCovidOrderType,
        headerText:
            '${context.tr(orderHistoryItem.status.prefix)} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
        headerTextInfoIcon: orderHistoryItem.status.isInQueue
            ? const QueueNumberInfoIcon()
            : null,
        statusWidget: StatusLabel(
          key: WidgetKeys.orderItemStatusKey,
          status: StatusType(
            context.tr(orderHistoryItem.status.displayOrderStatus),
          ),
        ),
        quantity: orderHistoryItem.qty.toString(),
        footerWidget: _InvoiceNumber(
          orderHistoryItem: orderHistoryItem,
        ),
        materialNumber: orderHistoryItem.materialNumber,
        isQuantityBelowImage: false,
        isQuantityRequired: true,
        statusTag:
            salesOrgConfigs.salesOrg.isID ? null : orderHistoryItem.productTag,
        showOfferTag: orderHistoryItem.isOfferItem,
        showBundleTag: orderHistoryItem.isBundle,
      ),
    );
  }
}
