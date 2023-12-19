import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
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
      onTap: () {
        _trackShowProductInfo(context);
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (_) => const _MaterialInfoDialog(),
        );
      },
    );
  }

  void _trackShowProductInfo(BuildContext context) {
    final materialInfo = context
        .read<ProductDetailBloc>()
        .state
        .productDetailAggregate
        .materialInfo;

    trackMixpanelEvent(
      MixpanelEvents.productInfoViewed,
      props: {
        MixpanelProps.productName: materialInfo.displayDescription,
        MixpanelProps.productCode: materialInfo.materialNumber.displayMatNo,
        MixpanelProps.productManufacturer: materialInfo.getManufactured,
      },
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
      key: WidgetKeys.materialInfoDialog,
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
          if (context
              .read<EligibilityBloc>()
              .state
              .salesOrgConfigs
              .expiryDateDisplay)
            _ExpiryDateWidget(
              expiryDateText:
                  productDetailAggregate.stockInfo.expiryDate.dateOrNaString,
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

class _ExpiryDateWidget extends StatelessWidget {
  const _ExpiryDateWidget({
    Key? key,
    required this.expiryDateText,
  }) : super(key: key);

  final String expiryDateText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 7),
        BalanceTextRow(
          key: WidgetKeys.productDetailExpiryDate,
          keyText: context.tr('Expiry'),
          valueText: expiryDateText,
          valueFlex: 1,
          keyTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.black,
              ),
          valueTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: ZPColors.darkGray,
              ),
        ),
        Row(
          children: [
            const Spacer(),
            Expanded(
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
          ],
        ),
      ],
    );
  }
}
