import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disableCreateOrder =
        context.read<UserBloc>().state.user.disableCreateOrder;

    return disableCreateOrder
        ? const SizedBox.shrink()
        : BlocBuilder<CartBloc, CartState>(
            buildWhen: (previous, current) =>
                previous.cartItems.length != current.cartItems.length,
            builder: (context, state) {
              return Badge(
                badgeContent: Text(
                  state.cartItems.length.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.white,
                      ),
                ),
                badgeColor: ZPColors.red,
                showBadge: state.cartItems.isNotEmpty,
                elevation: 0,
                position: BadgePosition.topEnd(top: 0, end: 3),
                animationType: BadgeAnimationType.fade,
                child: IconButton(
                  key: const Key('CartButton'),
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    final cartState = context.read<CartBloc>().state;
                    locator<CountlyService>()
                        .addCountlyEvent('Cart Window', segmentation: {
                      'numItemInCart': cartState.cartItems.length,
                      'subTotal': cartState.subtotal,
                      'grandTotal': cartState.grandTotal,
                    });
                    context.router.pushNamed('cart_page');
                  },
                ),
              );
            },
          );
  }
}
