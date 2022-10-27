import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class CartItemDetail extends StatelessWidget {
  final CartItem cartItemInfo;
  const CartItemDetail({Key? key, required this.cartItemInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: ZPColors.darkGray.withOpacity(0.15)),
            color: const Color.fromARGB(255, 251, 251, 251),
          ),
          key: Key(
            'materialOption${cartItemInfo.materialInfo.materialNumber}',
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Material Number: '),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(cartItemInfo
                          .materialInfo.materialNumber.displayMatNo),
                    ),
                  ],
                ),
                _sizedBoxH5,
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Material Description: '),
                    ),
                    Expanded(
                      flex: 1,
                      child:
                          Text(cartItemInfo.materialInfo.materialDescription),
                    ),
                  ],
                ),
                _sizedBoxH5,
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Qty: '),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(cartItemInfo.quantity.toString()),
                    ),
                  ],
                ),
                _sizedBoxH5,
                Row(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: Text('Unit Price: '),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        cartItemInfo.materialInfo.principalData.principalName,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const _sizedBoxH5 = SizedBox(
    height: 5,
  );
}
