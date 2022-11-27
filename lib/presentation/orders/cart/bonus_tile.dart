import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_bonus.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_icon.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/orders/cart/custom_expansion_tile.dart'
    as custom;

class BounsTile extends StatelessWidget {
  final PriceAggregate cartItem;
  const BounsTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('bonusTile'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: custom.ExpansionTile(
            initiallyExpanded: true,
            title: Text(
              'Bonuses'.tr(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BonusAddPage(
                              cartItem: cartItem,
                            ),
                          ),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.add,
                            color: ZPColors.kPrimaryColor,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Add Bonus'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.apply(
                                            color: ZPColors.kPrimaryColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ...cartItem.addedBonusList.map(
                (e) => Stack(
                  children: [
                    Card(
                      // color: ZPColors.extraLightGray,
                      margin: const EdgeInsets.all(6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        e.materialDescription,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Expiry Data :-'.tr(),
                                  style: const TextStyle(
                                    color: ZPColors.lightGray,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'In Stock :'.tr(),
                                  style: const TextStyle(
                                    color: ZPColors.lightGray,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              QuantityIcon(
                                key: const Key('removeBonusFromCart'),
                                pressed: () {
                                  if (e.quantity - 1 > 0) {
                                    context.read<CartBloc>().add(
                                          CartEvent.updateBonusItem(
                                            bonusItemCount: e.quantity - 1,
                                            cartItem: cartItem,
                                            bonusItem: e,
                                            isUpdateFromCart: true,
                                          ),
                                        );
                                  } else {
                                    context.read<CartBloc>().add(
                                          CartEvent.deleteBonusItem(
                                            cartItem: cartItem,
                                            bonusItem: e,
                                            isUpdateFromCart: true,
                                          ),
                                        );
                                  }
                                },
                                icon: Icons.remove,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  e.quantity.toString().padLeft(2, '0'),
                                  key: Key(
                                    'itemCount${e.quantity}',
                                  ),
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              QuantityIcon(
                                key: const Key('addBonusFromCart'),
                                pressed: () {
                                  context.read<CartBloc>().add(
                                        CartEvent.updateBonusItem(
                                          bonusItemCount: e.quantity + 1,
                                          cartItem: cartItem,
                                          bonusItem: e,
                                          isUpdateFromCart: true,
                                        ),
                                      );
                                },
                                icon: Icons.add,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: -15,
                      child: IconButton(
                        key: const Key('deleteBonusFromCart'),
                        onPressed: () {
                          context.read<CartBloc>().add(
                                CartEvent.deleteBonusItem(
                                  cartItem: cartItem,
                                  bonusItem: e,
                                  isUpdateFromCart: true,
                                ),
                              );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
