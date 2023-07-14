import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/common_tile_item.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsSection extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;

  const ItemDetailsSection({
    Key? key,
    required this.orderHistoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              currencyCodeTextStyle:
                  Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.darkGray,
                      ),
            ),
            statusWidget: StatusLabel(
              status: StatusType(
                orderHistoryItem.status.getOrDefaultValue(''),
              ),
            ),
            quantity: orderHistoryItem.qty.toString(),
            materialNumber: orderHistoryItem.materialNumber,
            isQuantityBelowImage: false,
            tag: orderHistoryItem.isBonusMaterial ? 'Bonus' : '',
            headerText:
                'Batch ${orderHistoryItem.batch}\n(EXP: ${orderHistoryItem.expiryDate.toValidDateString})',
          ),
        ],
      ),
    );
  }
}
