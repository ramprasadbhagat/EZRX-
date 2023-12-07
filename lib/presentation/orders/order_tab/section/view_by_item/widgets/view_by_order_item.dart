part of 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item/view_by_item_section.dart';

class _ViewByOrderItem extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final CustomerCodeInfo customerCodeInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;

  const _ViewByOrderItem({
    Key? key,
    required this.orderHistoryItem,
    required this.customerCodeInfo,
    required this.orderHistoryBasicInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                disableDeliveryDateForZyllemStatus: context
                    .read<EligibilityBloc>()
                    .state
                    .salesOrgConfigs
                    .disableDeliveryDate,
              ),
            );

        context.router.push(
          const ViewByItemDetailsPageRoute(),
        );
      },
      child: CommonTileItem(
        key: WidgetKeys.viewByItemsOrderItemKey,
        label: orderHistoryItem.combinationCode(
          showGMCPart:
              context.read<EligibilityBloc>().state.salesOrgConfigs.enableGMC,
        ),
        title: orderHistoryItem.materialDescription,
        subtitle:
            orderHistoryItem.principalData.principalName.getOrDefaultValue(''),
        isCovidItem: orderHistoryItem.orderType.isCovidOrderType,
        headerText:
            '${context.tr('Order')} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
        statusWidget: StatusLabel(
          key: WidgetKeys.orderItemStatusKey,
          status: StatusType(
            context.tr(orderHistoryItem.status.getOrDefaultValue('')),
          ),
        ),
        quantity: orderHistoryItem.qty.toString(),
        footerWidget: _InvoiceNumber(
          orderHistoryItem: orderHistoryItem,
        ),
        materialNumber: orderHistoryItem.materialNumber,
        isQuantityBelowImage: false,
        isQuantityRequired: true,
        statusTag: orderHistoryItem.productTag,
        showOfferTag: orderHistoryItem.isOfferItem,
        showBundleTag: orderHistoryItem.isBundle,
      ),
    );
  }
}
