import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const StockLabel({required this.materialInfo, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addOosMaterials =
        context.read<SalesOrgBloc>().state.configs.addOosMaterials;

    final validateOutOfStockValue =
        context.read<EligibilityBloc>().state.validateOutOfStockValue;

    return materialInfo.inStock
        ? const SizedBox.shrink()
        : Container(
            key: WidgetKeys.materialListStockLabel,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: addOosMaterials.productTagColor(validateOutOfStockValue),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Text(
              addOosMaterials.productTag(validateOutOfStockValue),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: addOosMaterials
                        .productTagColor(validateOutOfStockValue),
                  ),
            ).tr(),
          );
  }
}
