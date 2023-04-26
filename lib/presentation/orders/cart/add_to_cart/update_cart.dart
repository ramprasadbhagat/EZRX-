import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_detail_widget.dart';
import 'package:ezrxmobile/presentation/orders/create_order/select_contract.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class UpdateCart extends StatelessWidget {
  const UpdateCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    
    return Scaffold(
      backgroundColor: ZPColors.white,
      appBar: AppBar(
        title: const Text('Material Detail').tr(),
      ),
      key: const ValueKey('updateCartBottomSheet'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<AddToCartBloc, AddToCartState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: SvgPicture.asset(
                            'assets/svg/default_product_image.svg',
                            key: const ValueKey('updateCartProductImage'),
                            height: 80,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      CartItemDetailWidget(
                        cartItem: state.cartItem,
                        onQuantityChanged: (int value) {
                          final discountedMaterialCount =
                              cartBloc.state.zmgMaterialWithoutMaterial(
                            state.cartItem,
                          );
                          context.read<AddToCartBloc>().add(
                                AddToCartEvent.updateQuantity(
                                  value,
                                  discountedMaterialCount,
                                ),
                              );
                        },
                      ),
                      state.cartItem.materialInfo.hasValidTenderContract
                          ? SelectContract(
                              materialInfo: state.cartItem.materialInfo,
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                UpdateCartButton(cartItem: state.cartItem),
              ],
            );
          },
        ),
      ),
    );
  }
}
