import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class ItemDetailsSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ItemDetailsSection({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salesOrgConfigs =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderHistoryItem.manufactureName,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          CommonTileItem(
            isQuantityRequired: true,
            subtitle: '',
            label: orderHistoryItem.materialNumber.displayMatNo,
            title: orderHistoryItem.materialDescription,
            priceComponent: PriceComponent(
              price: orderHistoryItem.totalPrice.totalPrice.toStringAsFixed(2),
              salesOrgConfig: salesOrgConfigs,
            ),
            statusWidget: StatusLabel(
              key: WidgetKeys.orderItemStatusKey,
              status: StatusType(
                orderHistoryItem.status.displayOrderStatus,
              ),
            ),
            quantity: orderHistoryItem.qty.toString(),
            materialNumber: orderHistoryItem.materialNumber,
            isQuantityBelowImage: false,
            statusTag: orderHistoryItem.productTag,
            headerText: salesOrgConfigs.batchNumDisplay
                ? '${'Batch'.tr()}: ${orderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${orderHistoryItem.expiryDate.dateOrDashString})'
                : null,
            isCovidItem: orderHistoryItem.orderType.isCovidOrderType,
          ),
        ],
      ),
    );
  }
}
