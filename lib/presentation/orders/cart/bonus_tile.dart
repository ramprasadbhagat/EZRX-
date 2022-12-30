import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/orders/cart/bonus_item_tile.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BounsTile extends StatelessWidget {
  final PriceAggregate cartItem;

  const BounsTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1. isSalesRep => userdata.hasBonusOverride , isClient => salesOrgConfig.priceOverride
    // 2. ZPFB and ZPFC cannot override bonus
    final isBonusOverrideEnable =
        context.read<EligibilityBloc>().state.isBonusOverrideEnable &&
            !context.read<OrderDocumentTypeBloc>().state.isSpecialOrderType;
    final bonusList = cartItem.getAddedBonusList;
    final isEligibleAddAdditionBonus = cartItem.isEligibleAddAdditionBonus;

    return Column(
      key: const Key('bonusTile'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: (isEligibleAddAdditionBonus && isBonusOverrideEnable) ||
                  (!isBonusOverrideEnable && bonusList.isNotEmpty)
              ? custom.ExpansionTile(
                  initiallyExpanded: true,
                  keepHeaderBorder: true,
                  title: Text(
                    'Bonuses'.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  children: <Widget>[
                    if (isBonusOverrideEnable)
                      Row(
                        key: const ValueKey('addBonusButton'),
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            child: TextButton(
                              onPressed: () => context.router
                                  .push(BonusAddPageRoute(cartItem: cartItem)),
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
                                                    color:
                                                        ZPColors.kPrimaryColor,
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
                    ...bonusList.map(
                      (bonusItem) {
                        return BonusItemTile(
                          key: ValueKey(
                            '${bonusItem.materialInfo.materialNumber}${bonusItem.additionalBonusFlag}${bonusItem.qty}',
                          ),
                          bonusItem: bonusItem,
                          cartItem: cartItem,
                          isBonusOverrideEnable: isBonusOverrideEnable,
                        );
                      },
                    ),
                  ],
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
