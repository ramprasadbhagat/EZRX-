import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/update_cart.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/choose_bonus_sheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet {
  static void showAddToCartBottomSheet({
    required BuildContext context,
    required PriceAggregate priceAggregate,
    bool isCovid19Tab = false,
  }) {
    final currentItem = context
        .read<CartBloc>()
        .state
        .getMaterialCartItem(material: priceAggregate)
        .materials
        .first;
    final isPresentInCart = currentItem != PriceAggregate.empty();
    context.read<AddToCartBloc>().add(
          AddToCartEvent.setCartItem(
            isPresentInCart ? currentItem : priceAggregate,
          ),
        );
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        return !isPresentInCart
            ? AddToCart(
                isCovid19Tab: isCovid19Tab,
              )
            : const UpdateCart();
      },
    );
  }

  static void showUpdateCartBottomSheet({
    required BuildContext context,
    required PriceAggregate cartItem,
  }) {
    context.read<AddToCartBloc>().add(
          AddToCartEvent.setCartItem(
            cartItem,
          ),
        );
    showModalBottomSheet(
      barrierColor: Colors.transparent,
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (_) {
        return const UpdateCart();
      },
    );
  }

  static void showUpdateCartBonusBottomSheet({
    required BuildContext context,
    required MaterialInfo item,
    required CartItem cartItem,
    required bool isUpdateFromCart,
  }) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        return UpdateBonus(
          materialInfo: item,
          cartItem: cartItem,
          isUpdateFromCart: isUpdateFromCart,
        );
      },
    );
  }
}
