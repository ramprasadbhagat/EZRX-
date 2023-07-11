import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus/choose_bonus_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet {
  static void showQuickAddToCartBottomSheet({
    required BuildContext context,
    required String materialNumber,
  }) {
    final cartState = context.read<CartBloc>().state;
    final material = PriceAggregate.empty().copyWith(
      materialInfo: MaterialInfo.empty().copyWith(
        materialNumber: MaterialNumber(materialNumber),
      ),
    );
    final currentCartItem =
        cartState.getMaterialCartItem(material: material).materials.first;
    final isPresentInCart = currentCartItem != PriceAggregate.empty();

    if (isPresentInCart) {
      showUpdateCartBottomSheet(
        context: context,
        cartItem: currentCartItem,
      );
    } else {
      context.router.push(
        AddToCartRoute(
          isCovid19Tab: false,
          material: material,
          isShortcutAccess: true,
        ),
      );
    }
  }

  static void showAddToCartBottomSheet({
    required BuildContext context,
    required PriceAggregate priceAggregate,
  }) {
    final cartBloc = context.read<CartBloc>();
    final currentCartItem = cartBloc.state
        .getMaterialCartItem(material: priceAggregate)
        .materials
        .first;
    final isPresentInCart = currentCartItem != PriceAggregate.empty();
    if (isPresentInCart) {
      showUpdateCartBottomSheet(
        context: context,
        cartItem: currentCartItem,
      );
    } else {
      context.router.push(
        AddToCartRoute(
          isCovid19Tab: false,
          material: priceAggregate,
        ),
      );
    }
  }

  static void showUpdateCartBottomSheet({
    required BuildContext context,
    required PriceAggregate cartItem,
  }) {
    context.router.push(
      UpdateCartRoute(
        material: cartItem,
      ),
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
