import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_group.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    Key? key,
    required this.viewByOrderHistoryGroupList,
  }) : super(key: key);
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;

  @override
  Widget build(BuildContext context) {
    if (viewByOrderHistoryGroupList.isEmpty) return const SizedBox.shrink();

    return Padding(
      key: WidgetKeys.viewByOrderDetailItemsSection,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        children: viewByOrderHistoryGroupList
            .map(
              (e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    e.principalName.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<ViewByItemDetailsBloc, ViewByItemDetailsState>(
                    buildWhen: (previous, current) =>
                        previous.orderHistory.orderHistoryItems !=
                        current.orderHistory.orderHistoryItems,
                    builder: (context, state) =>
                        state.orderHistory.orderHistoryItems.isEmpty
                            ? const SizedBox.shrink()
                            : Column(
                                children: e.viewByOrderItem
                                    .mapIndexed(
                                      (index, e) => _OrderItemTile(
                                        orderHistory: state.orderHistory,
                                        orderItem: e,
                                      ),
                                    )
                                    .toList(),
                              ),
                  ),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

class _OrderItemTile extends StatelessWidget {
  final OrderHistoryDetailsOrderItem orderItem;
  final OrderHistory orderHistory;

  const _OrderItemTile({
    Key? key,
    required this.orderItem,
    required this.orderHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final salesOrgConfig = eligibilityState.salesOrgConfigs;
    final isIDMarket = eligibilityState.salesOrganisation.salesOrg.isID;

    return CommonTileItem(
      onTap: () => _goToViewByItemDetail(
        context,
        orderHistory,
        orderItem,
      ),
      key: WidgetKeys.viewByOrderDetailItem(
        orderItem.materialNumber.displayMatNo,
        orderItem.isBonus,
      ),
      label: orderItem.combinationCode(
        showGMCPart: salesOrgConfig.enableGMC,
      ),
      title: orderItem.materialDescription,
      priceComponent: orderItem.isBonus
          ? null
          : Row(
              children: [
                if (orderItem.showMaterialListPrice)
                  PriceComponent(
                    key: WidgetKeys.materialListPriceStrikeThrough,
                    salesOrgConfig: salesOrgConfig,
                    price: orderItem.getListPrice.toString(),
                    type: PriceStyle.materialListPriceStrikeThrough,
                  ),
                OrderItemPrice(
                  unitPrice: orderItem.itemUnitPrice(
                    isIDMarket,
                  ),
                  originPrice: orderItem.originPrice.toString(),
                  showPreviousPrice: orderItem.isCounterOffer,
                  hasDescription: true,
                ),
              ],
            ),
      statusWidget: isIDMarket
          ? null
          : StatusLabel(
              status: StatusType(
                orderItem.sAPStatus.displaySAPOrderStatus,
              ),
            ),
      quantity: '',
      materialNumber: orderItem.materialNumber,
      isQuantityBelowImage: true,
      isQuantityRequired: false,
      showOfferTag: orderItem.showOfferTag,
      statusTag:
          salesOrgConfig.salesOrg.isID ? null : orderItem.orderDetailBonusTag,
      headerText: salesOrgConfig.batchNumDisplay && orderItem.batchNumHasData
          ? '${'Batch'.tr()}: ${orderItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${orderItem.expiryDate.dateOrDashString})'
          : '',
      subtitle: '',
      footerWidget: QuantityAndPriceWithTax(
        quantity: orderItem.qty,
        quantityDescription: isIDMarket
            ? '${orderItem.pickedQuantity} ${context.tr('of')} ${orderItem.qty} ${context.tr('stocks fulfilled')}'
            : '',
        netPrice: orderItem.itemNetPrice(
          isIDMarket,
        ),
        taxPercentage: orderItem.taxPercentage,
      ),
    );
  }

  Future _goToViewByItemDetail(
    BuildContext context,
    OrderHistory orderHistory,
    OrderHistoryDetailsOrderItem orderItem,
  ) async {
    trackMixpanelEvent(
      MixpanelEvents.orderDetailViewed,
      props: {
        MixpanelProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    final eligibilityState = context.read<EligibilityBloc>().state;
    final orderHistoryItem = orderHistory.orderHistoryItems.firstWhere(
      (
        element,
      ) =>
          element.materialNumber == orderItem.materialNumber,
      orElse: () => orderHistory.orderHistoryItems.first,
    );

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistory,
            orderHistoryItem: orderHistoryItem,
            disableDeliveryDateForZyllemStatus:
                eligibilityState.salesOrgConfigs.disableDeliveryDate,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
