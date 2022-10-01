import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderHistoryListTile extends StatelessWidget {
  final OrderHistory orderHistory;
  const OrderHistoryListTile({Key? key, required this.orderHistory})
      : super(key: key);

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
                  flex: 2,
                  child: Text(
                    'Order #${orderHistory.orderNumber}',
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
                      orderHistory.status,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
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
              valueText: orderHistory.orderType,
            ),
            TextRow(
              keyText: 'Material ID',
              valueText: orderHistory.materialCode,
            ),
            TextRow(
              keyText: 'Material Name',
              valueText: orderHistory.materialDescription,
            ),
            const TextRow(
              keyText: 'Order Date',
              valueText: '',
            ),
            const TextRow(
              keyText: 'Delivery Date/Time',
              valueText: '',
            ),
            TextRow(
              keyText: 'Quantity',
              valueText: orderHistory.qty.toString(),
            ),

            /// Need to clear about order value then i will calculate zp price
            /// if the price getting complicated, please consider using value_object transformation to mange it
            const TextRow(
              keyText: 'ZP Price',
              valueText: '',
            ),
            TextRow(
              keyText: 'Total Price',
              valueText: '\$${orderHistory.totalPrice.toStringAsFixed(2)}',
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
    var keyTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12.0,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
    var valueTextStyle = const TextStyle(
      color: Colors.black,
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
