import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/cart_item_list_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
            },
            (_) {
              context.read<AuthBloc>().add(const AuthEvent.authCheck());
            },
          ),
        );
      },
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Scaffold(
          key: const Key('cartpage'),
          appBar: AppBar(
            title: Text(
              '${'My Cart'.tr()} (${state.cartItemList.length})',
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ScrollList<CartItem>(
                    emptyMessage: 'Cart is Empty',
                    onRefresh: () {
                      context.read<CartBloc>().add(const CartEvent.fetch());
                    },
                    onLoadingMore: () {},
                    isLoading: state.isFetching,
                    itemBuilder: (context, index, item) =>
                        CartItemListTile(cartItem: item),
                    items: state.cartItemList,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75),
                    ),
                  ],
                  color: ZPColors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    state.cartItemList.isNotEmpty
                        ? ElevatedButton(
                            onPressed: () {
                              context.router.pushNamed('order_summary');
                            },
                            child: const Text('Order Summary').tr(),
                          )
                        : const SizedBox.shrink(),
                    Text(
                      '${'Grand Total : '.tr()}${_getTotalPrice(context, state.cartItemList)}   ',
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: ZPColors.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getTotalPrice(BuildContext context, List<CartItem> cartItemList) {
    var sum = 0.0;
    for (final item in cartItemList) {
      final totalPrice = context
          .read<MaterialPriceBloc>()
          .state
          .materialPrice[item.materialInfo.materialNumber];
      if (null != totalPrice) {
        final unitPrice = totalPrice.finalPrice.getOrCrash();
        sum += unitPrice * item.quantity;
      }
    }

    return sum.toStringAsFixed(2);
  }
}
