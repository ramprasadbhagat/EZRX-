import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/product_image.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details_order_items.dart';

class BundleItemMaterial extends StatelessWidget {
  const BundleItemMaterial({
    Key? key,
    required this.orderItem,
    required this.orderHistory,
  }) : super(key: key);
  final OrderHistoryDetailsOrderItem orderItem;
  final OrderHistory orderHistory;

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
            orderHistoryItem: orderHistory.orderHistoryItems.firstWhere(
              (e) => e.lineNumber == orderItem.lineNumber,
              orElse: () => orderHistory.orderHistoryItems.first,
            ),
            disableDeliveryDateForZyllemStatus:
                eligibilityState.salesOrgConfigs.disableDeliveryDate,
          ),
        );

    await context.router.push(
      const ViewByItemDetailsPageRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return InkWell(
      onTap: () => _goToViewByItemDetail(context, orderHistory),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomCard(
              showShadow: false,
              showBorder: true,
              child: ProductImage(
                width: 70,
                height: 70,
                fit: BoxFit.fitHeight,
                materialNumber: orderItem.materialNumber,
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  StatusLabel(
                    status: StatusType(
                      orderItem.sAPStatus.displayOrderStatus,
                    ),
                  ),
                  Text(
                    orderItem.combinationCode(
                      showGMCPart: configs.enableGMC,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    orderItem.materialDescription,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  if (configs.batchNumDisplay)
                    Text(
                      '${'Batch'.tr()}: ${orderItem.batch.displayDashIfEmpty} (${context.tr('EXP')}: ${orderItem.expiryDate.dateOrDashString})',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          orderItem.principalData.principalName.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${context.tr('Qty')}: ${orderItem.qty}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
