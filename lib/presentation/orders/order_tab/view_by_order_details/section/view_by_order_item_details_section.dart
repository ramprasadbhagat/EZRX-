import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
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
import 'package:ezrxmobile/application/order/view_by_order_details/view_by_order_details_bloc.dart';

class OrderItemDetailsSection extends StatelessWidget {
  const OrderItemDetailsSection({
    Key? key,
    required this.viewByOrderHistoryGroupList,
  }) : super(key: key);
  final List<ViewByOrdersGroup> viewByOrderHistoryGroupList;

  @override
  Widget build(BuildContext context) {
    if (viewByOrderHistoryGroupList.isEmpty) return const SizedBox.shrink();

    final eligibilityState = context.read<EligibilityBloc>().state;
    final salesOrgConfig = eligibilityState.salesOrgConfigs;
    final invoiceNumber = context
        .read<ViewByOrderDetailsBloc>()
        .state
        .orderHistoryDetails
        .invoiceNumber;
    final isMYExternalSalesRep = eligibilityState.isMYExternalSalesRepUser;
    final isIDMarket = eligibilityState.salesOrganisation.salesOrg.isID;

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
                    builder: (context, state) => state
                            .orderHistory.orderHistoryItems.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            children: e.viewByOrderItem
                                .mapIndexed(
                                  (index, e) => CommonTileItem(
                                    onTap: () => _goToViewByItemDetail(
                                      context,
                                      state.orderHistory,
                                    ),
                                    key: WidgetKeys.viewByOrderDetailItem(
                                      e.materialNumber.displayMatNo,
                                      e.isBonus,
                                    ),
                                    label: e.combinationCode(
                                      showGMCPart: salesOrgConfig.enableGMC,
                                    ),
                                    title: e.materialDescription,
                                    priceComponent: e.isBonus
                                        ? null
                                        : Row(
                                            children: [
                                              if (e.showMaterialListPrice)
                                                PriceComponent(
                                                  key: WidgetKeys
                                                      .materialListPriceStrikeThrough,
                                                  salesOrgConfig: context
                                                      .read<EligibilityBloc>()
                                                      .state
                                                      .salesOrgConfigs,
                                                  price:
                                                      e.originPrice.toString(),
                                                  type: PriceStyle
                                                      .materialListPriceStrikeThrough,
                                                ),
                                              OrderItemPrice(
                                                unitPrice: e.itemUnitPrice(
                                                  invoiceNumber,
                                                  isMYExternalSalesRep,
                                                  isIDMarket,
                                                ),
                                                originPrice:
                                                    e.originPrice.toString(),
                                                showPreviousPrice:
                                                    e.isCounterOffer,
                                                hasDescription: true,
                                              ),
                                            ],
                                          ),
                                    statusWidget: isIDMarket
                                        ? null
                                        : StatusLabel(
                                            status: StatusType(
                                              e.sAPStatus.displaySAPOrderStatus,
                                            ),
                                          ),
                                    quantity: '',
                                    materialNumber: e.materialNumber,
                                    isQuantityBelowImage: true,
                                    isQuantityRequired: false,
                                    showOfferTag: e.showOfferTag,
                                    statusTag: e.orderDetailBonusTag,
                                    headerText: salesOrgConfig.batchNumDisplay
                                        ? '${'Batch'.tr()}: ${e.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${e.expiryDate.dateOrDashString})'
                                        : '',
                                    subtitle: '',
                                    footerWidget: QuantityAndPriceWithTax(
                                      quantity: e.qty,
                                      quantityDescription: isIDMarket
                                          ? '${e.pickedQuantity} ${context.tr('of')} ${e.qty} ${context.tr('stocks fulfilled')}'
                                          : '',
                                      netPrice: e.itemNetPrice(
                                        invoiceNumber,
                                        isMYExternalSalesRep,
                                        isIDMarket,
                                      ),
                                      taxPercentage: e.taxPercentage,
                                    ),
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

  Future _goToViewByItemDetail(
    BuildContext context,
    OrderHistory orderHistory,
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
    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.setItemOrderDetails(
            orderHistory: orderHistory,
            orderHistoryItem: orderHistory.orderHistoryItems.first,
            disableDeliveryDateForZyllemStatus:
                eligibilityState.salesOrgConfigs.disableDeliveryDate,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }
}
