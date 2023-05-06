import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_item_bonus.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter/material.dart';

class SaveOrderBounsTile extends StatelessWidget {
  final MaterialItem item;

  const SaveOrderBounsTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const Key('saveOrderBounsTile'),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: custom.ExpansionTile(
        keepHeaderBorder: true,
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
      margin: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (bonusItem.materialInfo.materialDescription.isNotEmpty)
            BalanceTextRow(
              keyText: 'Material Description'.tr(),
              valueText: bonusItem.materialInfo.materialDescription,
              keyFlex: 1,
              valueFlex: 1,
            ),
          BalanceTextRow(
            keyText: 'Material Number'.tr(),
            valueText: bonusItem.materialInfo.materialNumber.displayMatNo.tr(),
            keyFlex: 1,
            valueFlex: 1,
          ),
          BalanceTextRow(
            keyText: 'Material qty'.tr(),
            valueText: bonusItem.qty.toString(),
            keyFlex: 1,
            valueFlex: 1,
          ),
        ],
      ),
    );
  }
}
