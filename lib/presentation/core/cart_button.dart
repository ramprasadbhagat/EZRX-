import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<CartBloc>().add(
              const CartEvent.fetch(),
            );
        context.router.pushNamed('cart_page');
      },
      child: BlocBuilder<CartBloc, CartState>(
        buildWhen: (previous, current) =>
            previous.cartItemList.length != current.cartItemList.length,
        builder: (context, state) {
          return Badge(
            badgeContent: Text(
              state.cartItemList.length.toString(),
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ZPColors.white,
                  ),
            ),
            showBadge: state.cartItemList.isNotEmpty,
            elevation: 0,
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationType: BadgeAnimationType.slide,
            child: const IconButton(
              key: Key('CartButton'),
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: null,
            ),
          );
        },
      ),
    );
  }
}
