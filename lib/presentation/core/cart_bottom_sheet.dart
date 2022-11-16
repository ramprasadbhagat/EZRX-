import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/presentation/orders/create_order/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/create_order/update_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBottomSheet {
  static void showAddToCartBottomSheet({
    required BuildContext context,
    required MaterialInfo materialInfo,
  }) {
    final itemPrice = context
        .read<MaterialPriceBloc>()
        .state
        .materialPrice[materialInfo.materialNumber];

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        context.read<AddToCartBloc>().add(
              AddToCartEvent.setCartItem(
                PriceAggregate(
                  price: itemPrice ?? Price.empty(),
                  materialInfo: materialInfo,
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  quantity: 1,
                  zmgMaterialCountOnCart:
                      context.read<CartBloc>().state.zmgMaterialCount,
                  isOverride: false,
                ),
              ),
            );

        return const AddToCart();
      },
    );
  }

  static void showUpdateCartBottomSheet({
    required BuildContext context,
    required PriceAggregate cartItem,
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
        return UpdateCart(cartItem: cartItem);
      },
    );
  }
}
