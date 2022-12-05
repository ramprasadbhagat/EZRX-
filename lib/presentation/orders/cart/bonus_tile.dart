import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus_item_tile.dart';
import 'package:ezrxmobile/presentation/orders/cart/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              if (cartItem.isEligibleAddAdditionBonus &&
                  context.read<EligibilityBloc>().state.getBonusOverRide)
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
                (e) {
                  return BonusItemTile(
                    key: ValueKey('${e.materialInfo.materialNumber}${e.qty}'),
                    bonusItem: e,
                    cartItem: cartItem,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
