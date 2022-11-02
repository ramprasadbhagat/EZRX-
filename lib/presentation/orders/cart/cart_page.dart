import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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
                        _ListContent(cartItem: item),
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
                    ElevatedButton(
                      onPressed: () {
                        context.router.pushNamed('order_summary');
                      },
                      child: const Text('Order Summary').tr(),
                    ),
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

class _ListContent extends StatelessWidget {
  final CartItem cartItem;
  const _ListContent({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomSlidable(
        endActionPaneActions: [
          CustomSlidableAction(
            label: 'Delete',
            icon: Icons.delete_outline,
            onPressed: (context) => context
                .read<CartBloc>()
                .add(CartEvent.removeFromCart(item: cartItem)),
          ),
        ],
        borderRadius: 4,
        child: ListTile(
          key: Key(
            'cartItem${cartItem.materialInfo.materialNumber}',
          ),
          leading: SizedBox(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cartItem.quantity.toString().padLeft(2, '0'),
                  key: Key('itemCount${cartItem.materialInfo.materialNumber}'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Flexible(
                  child: Row(
                    children: [
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (cartItem.quantity > 1) {
                              context.read<CartBloc>().add(
                                    CartEvent.addToCart(
                                      item: cartItem.copyWith(quantity: -1),
                                    ),
                                  );
                            } else {
                              context.read<CartBloc>().add(
                                    CartEvent.removeFromCart(item: cartItem),
                                  );
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: ZPColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: ZPColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                                  CartEvent.addToCart(
                                    item: cartItem.copyWith(quantity: 1),
                                  ),
                                );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: ZPColors.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: ZPColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            cartItem.materialInfo.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: ZPColors.kPrimaryColor,
                ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartItem.materialInfo.materialDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                cartItem.materialInfo.principalData.principalName,
                style: Theme.of(context).textTheme.subtitle2?.apply(
                      color: ZPColors.lightGray,
                    ),
              ),

              // Text(
              //   '${'Unit price before GST: '.tr()}${cartItem.listPrice()}',
              //   style: Theme.of(context).textTheme.bodyText1?.apply(
              //         color: ZPColors.lightGray,
              //       ),
              // ),

              // Text(
              //   '${'Unit price: '.tr()}${cartItem.unitPrice()}',
              //   style: Theme.of(context).textTheme.bodyText1?.apply(
              //         color: ZPColors.black,
              //       ),
              // ),

              BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
                buildWhen: (previous, current) =>
                    previous.isFetching != current.isFetching,
                builder: (context, state) {
                  final itemPrice =
                      state.materialPrice[cartItem.materialInfo.materialNumber];

                  if (itemPrice != null) {
                    final currentCurrency =
                        context.read<SalesOrgBloc>().state.configs.currency;
                    final isHidePrice = cartItem.materialInfo.hidePrice;

                    return Text(
                      '${'Unit Price: '.tr()}${itemPrice.finalPrice.displayWithCurrency(
                        currency: currentCurrency,
                        hidePrice: isHidePrice,
                      )}',
                      style: Theme.of(context).textTheme.bodyText1?.apply(
                            color: ZPColors.black,
                          ),
                    );
                  }
                  if (state.isFetching) {
                    return SizedBox(
                      key: const Key('price-loading'),
                      width: 40,
                      child: LoadingShimmer.tile(),
                    );
                  }

                  return Text(
                    '${'Unit Price: '.tr()}NA',
                    style: Theme.of(context).textTheme.bodyText1?.apply(
                          color: ZPColors.black,
                        ),
                  );
                },
              ),
            ],
          ),
          isThreeLine: true,
          trailing: IconButton(
            onPressed: () {
              context
                  .read<CartBloc>()
                  .add(CartEvent.removeFromCart(item: cartItem));
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      ),
    );
  }
}
