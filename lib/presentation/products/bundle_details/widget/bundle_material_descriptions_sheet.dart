import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BundleMaterialDescription extends StatelessWidget {
  const BundleMaterialDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final materialInfo = context
        .read<ProductDetailBloc>()
        .state
        .productDetailAggregate
        .materialInfo;

    return Padding(
      key: WidgetKeys.bundleMaterialDescriptionBottomSheet,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Material information'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 24),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Bundle Code'.tr(),
            valueText: materialInfo.materialNumber.getOrDefaultValue(''),
          ),
          const SizedBox(height: 8),
          BalanceTextRow(
            keyFlex: 3,
            valueFlex: 4,
            keyText: 'Manufacturer'.tr(),
            valueText: materialInfo.manufactured,
          ),
          const SizedBox(height: 70),
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
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
