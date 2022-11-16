import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller.text = '1';
    context.read<AddToCartBloc>().add(AddToCartEvent.updateQuantity(
          1,
          context.read<CartBloc>().state.zmgMaterialCount,
        ));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddToCartBloc, AddToCartState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return ListView(
                children: [
                  CartItemDetailWidget(
                    controller: _controller,
                    cartItem: state.cartItem,
                    onQuantityChanged: (int value) {
                      context.read<AddToCartBloc>().add(
                            AddToCartEvent.updateQuantity(
                              value,
                              context.read<CartBloc>().state.zmgMaterialCount,
                            ),
                          );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => _addToCart(context, state.cartItem),
                    child: const Text('Add to Cart').tr(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context, PriceAggregate selectedCartItem) {
    final cartState = context.read<CartBloc>().state;
    if (selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containNonFocMaterial) {
      showSnackBar(
        context: context,
        message:
            'Covid material cannot be combined with commercial material.'.tr(),
      );
    } else if (!selectedCartItem.materialInfo.materialGroup4.isFOC &&
        cartState.containFocMaterial) {
      showSnackBar(
        context: context,
        message:
            'Commercial material cannot be combined with covid material.'.tr(),
      );
    } else {
      context.read<CartBloc>().add(CartEvent.addToCart(item: selectedCartItem));
      context.router.pop();
    }
  }
}
