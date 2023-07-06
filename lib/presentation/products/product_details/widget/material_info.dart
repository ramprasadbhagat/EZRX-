import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialInformation extends StatelessWidget {
  const MaterialInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.materialDetailsInfoTile,
      title: Text(
        'Material information',
        style: Theme.of(context).textTheme.labelSmall,
      ).tr(),
      subtitle: Text(
        'Material number, Manufacturer, Country of origin , Unit of measure',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ZPColors.darkGray),
      ).tr(),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: MediaQuery.of(context).size.width * 0.04,
      ),
      onTap: () => showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (_) {
          return const _MaterialInfoDialog();
        },
      ),
    );
  }
}

class _MaterialInfoDialog extends StatelessWidget {
  const _MaterialInfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productDetailAggregate =
        context.read<ProductDetailBloc>().state.productDetailAggregate;
    final materialInfo = productDetailAggregate.materialInfo;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Material Information',
            style: Theme.of(context).textTheme.labelLarge,
          ).tr(),
          const SizedBox(
            height: 20,
          ),
          BalanceTextRow(
            keyText: 'Material Number'.tr(),
            valueText: materialInfo.materialNumber.displayMatNo,
            keyFlex: 1,
            valueFlex: 1,
            keyColor: ZPColors.black,
            valueColor: ZPColors.darkGray,
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: 'Manufacturer'.tr(),
            valueText:
                materialInfo.principalData.principalName
                .getOrDefaultValue(''),
            keyFlex: 1,
            valueFlex: 1,
            keyColor: ZPColors.black,
            valueColor: ZPColors.darkGray,
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: 'Unit of measurement'.tr(),
            valueText: materialInfo.unitOfMeasurement,
            keyFlex: 1,
            valueFlex: 1,
            keyColor: ZPColors.black,
            valueColor: ZPColors.darkGray,
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: 'Country of origin'.tr(),
            valueText: materialInfo.countryData.countryName,
            keyFlex: 1,
            valueFlex: 1,
            keyColor: ZPColors.black,
            valueColor: ZPColors.darkGray,
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: 'Batch'.tr(),
            valueText:
                productDetailAggregate.stockInfo.batch.getOrDefaultValue(''),
            keyFlex: 1,
            valueFlex: 1,
            keyColor: ZPColors.black,
            valueColor: ZPColors.darkGray,
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
                keyText: 'Expiry'.tr(),
                valueText: productDetailAggregate
                    .stockInfo.expiryDate.toSimpleDateString,
            keyFlex: 1,
            valueFlex: 1,
                keyColor: ZPColors.black,
                valueColor: ZPColors.darkGray,
              ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: Text(
                'Expiry date displayed is for reference, actual product may very',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: ZPColors.darkGray,
                    ),
              ).tr(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.router.pop(),
                  child: const Text('Close').tr(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
