import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/view_by_item_details/view_by_item_details_bloc.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_events.dart';
import 'package:ezrxmobile/infrastructure/core/common/tracking_properties.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/pre_order_label.dart';
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
    required this.orderNumber,
  }) : super(key: key);
  final OrderHistoryDetailsOrderItem orderItem;
  final OrderNumber orderNumber;

  Future _goToViewByItemDetail(
    BuildContext context,
  ) async {
    trackMixpanelEvent(
      TrackingEvents.orderDetailViewed,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          context.routeData.path,
        ),
      },
    );

    context.read<ViewByItemDetailsBloc>().add(
          ViewByItemDetailsEvent.fetchOrderHistoryDetails(
            orderNumber: orderNumber,
            lineNumber: orderItem.lineNumber,
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
      key: WidgetKeys.orderHistoryBundleItemMaterial(
        orderItem.materialNumber.displayMatNo,
      ),
      onTap: () => _goToViewByItemDetail(context),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          orderItem.combinationCode(
                            showGMCPart: configs.enableGMC,
                          ),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      PreOrderLabel(
                        stockInfo:
                            orderItem.reOrderMaterialInfo.productStockInfo,
                      ),
                    ],
                  ),
                  Text(
                    orderItem.materialDescription,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  if (configs.batchNumDisplay)
                    Text(
                      '${'Batch'.tr()}: ${orderItem.batch.displayDashIfEmpty} (${context.tr('Expires')}: ${orderItem.expiryDate.dateOrDashString})',
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
                        key: WidgetKeys.cartItemProductQty,
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
