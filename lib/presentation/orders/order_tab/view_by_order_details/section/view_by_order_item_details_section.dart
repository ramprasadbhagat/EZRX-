import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/core/quantity_and_price_with_tax.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
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
    this.isMarketPlace = false,
  }) : super(key: key);
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;
  final bool isMarketPlace;

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
                  if (!isMarketPlace) ...[
                    Text(
                      e.principalName.name,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                  ...e.viewByOrderItem.map(
                    (item) => _OrderItemTile(
                      orderItem: item,
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

  const _OrderItemTile({
    Key? key,
    required this.orderItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;
    final salesOrgConfig = eligibilityState.salesOrgConfigs;
    final isIDMarket = eligibilityState.salesOrganisation.salesOrg.isID;
    final isMarketPlace = orderItem.isMarketPlace;
    final headerText = _batchExpiryDateText(context, isMarketPlace);

    return CommonTileItem(
      padding: const EdgeInsets.symmetric(vertical: 10),
      onTap: () => _goToViewByItemDetail(
        context,
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
                if (salesOrgConfig.enableListPrice &&
                    orderItem.showMaterialListPrice)
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
                  showPreviousPrice: false,
                  hidePrice: orderItem.hidePrice,
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
      isCovidItem: orderItem.isCovid,
      showOfferTag: orderItem.showOfferTag,
      statusTag:
          salesOrgConfig.salesOrg.isID ? null : orderItem.orderDetailBonusTag,
      headerText: salesOrgConfig.batchNumDisplay && headerText.isNotEmpty
          ? headerText
          : '',
      headerTextStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: ZPColors.darkGray,
          ),
      subtitle: '',
      footerWidget: QuantityAndPriceWithTax.order(
        quantity: orderItem.qty,
        quantityDescription: isIDMarket
            ? '${orderItem.pickedQuantity} ${context.tr('of')} ${orderItem.qty} ${context.tr('stocks fulfilled')}'
            : '',
        netPrice: orderItem.itemNetPrice(
          salesOrgConfig.displayItemTaxBreakdown,
          isIDMarket,
        ),
        taxPercentage: orderItem.taxPercentage,
      ),
    );
  }

  String _batchExpiryDateText(BuildContext context, bool isMarketPlace) {
    if (isMarketPlace) {
      return '${context.tr('Batch')}: NA (${context.tr('Expires')}: NA)';
    }

    if (orderItem.batchNumHasData) {
      return '${context.tr('Batch')}: ${orderItem.batch.displayDashIfEmpty}\n(${context.tr('Expires')}: ${orderItem.expiryDate.dateOrDashString})';
    }

    return '';
  }

  Future _goToViewByItemDetail(
    BuildContext context,
    OrderHistoryDetailsOrderItem orderItem,
  ) async {
    trackMixpanelEvent(
      TrackingEvents.orderDetailViewed,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    final orderHistoryDetails =
        context.read<ViewByOrderDetailsBloc>().state.orderHistoryDetails;
    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderHistoryDetails.orderNumber,
            lineNumber: orderItem.lineNumber,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
