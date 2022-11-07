import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_basic_info.dart';

class OrderHistoryListTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final Currency currency;
  final CustomerCodeInfo customerCodeInfo;
  final ShipToInfo shipToInfo;
  final OrderHistoryBasicInfo orderHistoryBasicInfo;
  final SalesOrganisationConfigs salesOrgConfigs;
  const OrderHistoryListTile({
    Key? key,
    required this.orderHistoryItem,
    required this.currency,
    required this.customerCodeInfo,
    required this.shipToInfo,
    required this.orderHistoryBasicInfo,
    required this.salesOrgConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(
          HistoryDetailsRoute(
            orderHistoryItem: orderHistoryItem,
            customerCodeInfo: customerCodeInfo,
            shipToInfo: shipToInfo,
            orderHistoryBasicInfo: orderHistoryBasicInfo,
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '#${orderHistoryItem.orderNumber}',
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: ZPColors.kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  salesOrgConfigs.disableProcessingStatus
                      ? const SizedBox.shrink()
                      : Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: ZPColors.secondary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Text(
                              orderHistoryItem.status,
                              style: const TextStyle(
                                color: ZPColors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                ],
              ),
              BalanceTextRow(
                key: const Key('orderTypeKey'),
                keyText: 'Order Type',
                valueText: orderHistoryItem.orderType,
              ),
              BalanceTextRow(
                keyText: 'Material ID',
                valueText: orderHistoryItem.materialNumber.displayMatNo,
              ),
              BalanceTextRow(
                keyText: 'Material Name',
                valueText: orderHistoryItem.materialDescription,
              ),
              BalanceTextRow(
                keyText: 'Order Date',
                valueText: orderHistoryItem.createdDate,
              ),
              BalanceTextRow(
                keyText: 'Delivery Date/Time',
                valueText: orderHistoryItem.deliveryDate,
              ),
              BalanceTextRow(
                keyText: 'Quantity',
                valueText: orderHistoryItem.qty.toString(),
              ),

              /// Need to clear about order value then i will calculate zp price
              /// if the price getting complicated, please consider using value_object transformation to mange it
              BalanceTextRow(
                keyText: 'ZP Price',
                valueText: _displayPrice(
                  salesOrgConfigs,
                  orderHistoryItem.unitPrice.zpPrice,
                ),
              ),
              BalanceTextRow(
                keyText: 'Total Price',
                valueText: _displayPrice(
                  salesOrgConfigs,
                  orderHistoryItem.totalPrice.totalPrice,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _displayPrice(SalesOrganisationConfigs salesOrgConfig, double price) {
  if (salesOrgConfig.currency.isVN) {
    return '${price.toStringAsFixed(2)} ${salesOrgConfig.currency.code}';
  }

  return '${salesOrgConfig.currency.code} ${price.toStringAsFixed(2)}';
}
