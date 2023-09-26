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
        context.read<ViewByItemDetailsBloc>().add(
              ViewByItemDetailsEvent.fetch(
                orderNumber: orderHistoryItem.orderNumber,
                salesOrganisation:
                    context.read<EligibilityBloc>().state.salesOrganisation,
                user: context.read<EligibilityBloc>().state.user,
                materialNumber: orderHistoryItem.materialNumber,
                soldTo: customerCodeInfo,
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
        label: orderHistoryItem.materialNumber.displayMatNo,
        title: orderHistoryItem.materialDescription,
        subtitle: orderHistoryItem.manufactureName,
        isCovidItem: orderHistoryItem.orderType.isCovidOrderType,
        headerText:
            '${context.tr('Order')} #${orderHistoryItem.orderNumber.getOrDefaultValue('')}',
        statusWidget: StatusLabel(
          key: WidgetKeys.orderItemStatusKey,
          status: StatusType(
            context.tr(orderHistoryItem.status.displayOrderStatus),
          ),
        ),
        quantity: orderHistoryItem.qty.toString(),
        footerWidget: orderHistoryItem.invoiceNumber.isNotEmpty
            ? _InvoiceNumber(
                orderHistoryItem: orderHistoryItem,
              )
            : null,
        materialNumber: orderHistoryItem.materialNumber,
        isQuantityBelowImage: false,
        isQuantityRequired: true,
        statusTag: orderHistoryItem.productTag,
      ),
    );
  }
}
