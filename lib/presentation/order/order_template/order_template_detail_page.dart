import 'package:ezrxmobile/domain/order/entities/order_template.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/order/cart_item/cart_item_detail.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderTemplateDetailPage extends StatelessWidget {
  final OrderTemplate orderTemplateInfo;
  const OrderTemplateDetailPage({Key? key, required this.orderTemplateInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('OrderTemplateDetailPage'),
      backgroundColor: ZPColors.white,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppSearchBar(
          actionWidget: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: orderTemplateInfo.cartItems.length,
        itemBuilder: (context, index) {
          return CartItemDetail(
            cartItemInfo: orderTemplateInfo.cartItems[index],
          );
        },
      ),
    );
  }
}
