import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateCart extends StatelessWidget {
  const UpdateCart({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final PriceAggregate cartItem;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(
      text: '${cartItem.quantity}',
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              CartItemDetailWidget(
                cartItem: cartItem,
                onQuantityChanged: (int value) {},
              ),
              ElevatedButton(
                onPressed: () {
                  final updatedCartItem = cartItem.copyWith(
                    quantity: int.tryParse(controller.text) ?? 1,
                  );
                  context.read<CartBloc>().add(
                        CartEvent.updateCartItem(item: updatedCartItem),
                      );
                  context.router.pop();
                },
                child: const Text('Update Cart').tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
