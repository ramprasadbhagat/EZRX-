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
        context.tr('Material information'),
        style: Theme.of(context).textTheme.labelSmall,
      ),
      subtitle: Text(
        '${context.tr('Material number')}, ${context.tr('Manufacturer')}, ${context.tr('Country of origin')}, ${context.tr('Unit of measurement')}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: ZPColors.extraLightGrey4),
      ),
      trailing: const Icon(
        Icons.chevron_right,
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
            context.tr('Material Information'),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          BalanceTextRow(
            keyText: context.tr('Material Number'),
            valueText: materialInfo.materialNumber.displayMatNo,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Manufacturer'),
            valueText: materialInfo.principalData.principalName.name,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Unit of measurement'),
            valueText: materialInfo.unitOfMeasurement.displayNAIfEmpty,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Country of origin'),
            valueText: materialInfo.countryData.countryName.displayNAIfEmpty,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Batch'),
            valueText: productDetailAggregate.stockInfo.batch.displayLabel,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          const SizedBox(height: 7),
          BalanceTextRow(
            keyText: context.tr('Expiry'),
            valueText:
                productDetailAggregate.stockInfo.expiryDate.dateOrNaString,
            valueFlex: 1,
            keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.black,
                ),
            valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.43,
              child: Text(
                context.tr(
                  'Expiry date displayed is for reference, actual product may vary',
                ),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 10,
                      color: ZPColors.darkGray,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.router.pop(),
                  child: Text(context.tr('Close')),
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
