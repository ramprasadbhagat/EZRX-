import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/cart_item.dart';
import 'package:ezrxmobile/presentation/core/custom_slidable.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemListTile extends StatelessWidget {
  final CartItem cartItem;
  const CartItemListTile({Key? key, required this.cartItem}) : super(key: key);

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
                        isFoc: itemPrice.isFOC,
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
