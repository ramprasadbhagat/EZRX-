import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/presentation/orders/cart/custom_expansion_tile.dart'
    as custom;
import 'package:flutter/material.dart';

class SaveOrderBounsTile extends StatelessWidget {
  final MaterialItem item;
  const SaveOrderBounsTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: custom.ExpansionTile(
        initiallyExpanded: true,
        title: Text(
          'Bonuses'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        children: item.bonuses
            .map(
              (e) => _BonusItemTile(
                bonusItem: e,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _BonusItemTile extends StatelessWidget {
  const _BonusItemTile({
    Key? key,
    required this.bonusItem,
  }) : super(key: key);

  final MaterialItemBonus bonusItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          'Materail Number'.tr(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bonusItem.materialInfo.materialNumber.displayMatNo,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Materail qty'.tr(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          bonusItem.qty.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
