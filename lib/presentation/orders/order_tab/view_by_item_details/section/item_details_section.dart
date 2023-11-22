import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/order_item_price.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/quantity_and_price_with_tax.dart';
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
        top: 12.0,
        left: 12.0,
        right: 12.0,
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
            subtitle: '',
            label: orderHistoryItem.materialNumber.displayMatNo,
            title: orderHistoryItem.materialDescription,
            priceComponent: orderHistoryItem.isBonusMaterial
                ? null
                : OrderItemPrice(
                    unitPrice: orderHistoryItem.unitPrice.zpPrice.toString(),
                    originPrice:
                        orderHistoryItem.originPrice.getOrDefaultValue(''),
                    showPreviousPrice: orderHistoryItem.isCounterOffer,
                    hasDescription: true,
                  ),
            statusWidget: StatusLabel(
              key: WidgetKeys.orderItemStatusKey,
              status: StatusType(
                orderHistoryItem.status.displayOrderStatus,
              ),
            ),
            quantity: '',
            isQuantityBelowImage: true,
            isQuantityRequired: false,
            materialNumber: orderHistoryItem.materialNumber,
            statusTag: orderHistoryItem.productTag,
            headerText: salesOrgConfigs.batchNumDisplay
                ? '${'Batch'.tr()}: ${orderHistoryItem.batch.displayDashIfEmpty}\n(${'EXP'.tr()}: ${orderHistoryItem.expiryDate.dateOrDashString})'
                : '',
            isCovidItem: orderHistoryItem.orderType.isCovidOrderType,
            showOfferTag: orderHistoryItem.isOfferItem,
            showBundleTag: orderHistoryItem.isBundle,
            footerWidget: QuantityAndPriceWithTax(
              quantity: orderHistoryItem.qty,
              totalPriceString:
                  orderHistoryItem.totalPrice.totalPrice.toString(),
              taxPercentage: orderHistoryItem.tax,
            ),
          ),
        ],
      ),
    );
  }
}
