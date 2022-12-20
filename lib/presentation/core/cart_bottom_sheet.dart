import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/orders/cart/update_bonus.dart';
import 'package:ezrxmobile/presentation/orders/create_order/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/create_order/update_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet {
  static void showAddToCartBottomSheet({
    required BuildContext context,
    required PriceAggregate priceAggregate,
    bool isCovid19Tab = false,
  }) {
    final isPresentInCart = context.read<CartBloc>().state.cartItemList.any(
          (cartItem) =>
      cartItem.materialNumberString ==
          priceAggregate.materialNumberString,
    );
    final currentItem = context.read<CartBloc>().state.cartItemList.firstWhere(
          (cartItem) =>
      cartItem.materialNumberString ==
          priceAggregate.materialNumberString,
      orElse: () => priceAggregate,
    );
    context.read<AddToCartBloc>().add(
      AddToCartEvent.setCartItem(
        currentItem,
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
    required PriceAggregate cartItem,
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
