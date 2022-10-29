import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderHistoryListTile extends StatelessWidget {
  final OrderHistoryItem orderHistoryItem;
  final Currency currency;
  const OrderHistoryListTile({
    Key? key,
    required this.orderHistoryItem,
    required this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Expanded(
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
                        color: ZPColors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            TextRow(
              key: const Key('orderTypeKey'),
              keyText: 'Order Type',
              valueText: orderHistoryItem.orderType,
            ),
            TextRow(
              keyText: 'Material ID',
              valueText: orderHistoryItem.materialNumber.displayMatNo,
            ),
            TextRow(
              keyText: 'Material Name',
              valueText: orderHistoryItem.materialDescription,
            ),
            TextRow(
              keyText: 'Order Date',
              valueText: orderHistoryItem.createdDate,
            ),
            TextRow(
              keyText: 'Delivery Date/Time',
              valueText: orderHistoryItem.deliveryDate,
            ),
            TextRow(
              keyText: 'Quantity',
              valueText: orderHistoryItem.qty.toString(),
            ),

            /// Need to clear about order value then i will calculate zp price
            /// if the price getting complicated, please consider using value_object transformation to mange it
            TextRow(
              keyText: 'ZP Price',
              valueText:
                  '${currency.code} ${orderHistoryItem.unitPrice.getOrCrash()}',
            ),
            TextRow(
              keyText: 'Total Price',
              valueText:
                  '${currency.code} ${orderHistoryItem.totalPrice.getOrCrash()}',
            ),
          ],
        ),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String keyText;
  final String valueText;

  const TextRow({
    Key? key,
    required this.keyText,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const keyTextStyle = TextStyle(
      color: ZPColors.darkGray,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    const valueTextStyle = TextStyle(
      color: ZPColors.black,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              keyText,
              style: keyTextStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              ': $valueText',
              style: valueTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
