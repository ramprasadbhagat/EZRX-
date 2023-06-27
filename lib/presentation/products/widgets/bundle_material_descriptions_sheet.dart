import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:flutter/material.dart';

class BundleMaterialDescription extends StatelessWidget {
  const BundleMaterialDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Material information'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 24),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Material number'.tr(),
            valueText: '11007178',
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Manufacturer'.tr(),
            valueText: 'GlaxoSmithKline Pte Ltd',
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Unit of measurement'.tr(),
            valueText: '100 units/milliliterx',
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Country of origin'.tr(),
            valueText: 'Worthing, UK',
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Batch'.tr(),
            valueText: 'CN5890',
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Expiry date'.tr(),
            valueText: '24 Nov 2024',
          ),
          const SizedBox(height: 70),
          ElevatedButton(
            onPressed: () {
              context.router.pop();
            },
            child: Text('Close'.tr()),
          ),
        ],
      ),
    );
  }
}
