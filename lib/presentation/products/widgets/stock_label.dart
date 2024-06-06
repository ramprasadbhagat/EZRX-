import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/product_tag.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockLabel extends StatelessWidget {
  final MaterialInfo materialInfo;

  const StockLabel({required this.materialInfo, super.key});

  @override
  Widget build(BuildContext context) {
    final addOosMaterials =
        context.read<EligibilityBloc>().state.salesOrgConfigs.addOosMaterials;

    final validateOutOfStockValue =
        context.read<EligibilityBloc>().state.validateOutOfStockValue;

    final salesOrgConfig =
        context.read<EligibilityBloc>().state.salesOrgConfigs;

    return materialInfo.displayOOSPreorderTag(salesOrgConfig.hideStockDisplay)
        ? Container(
            key: WidgetKeys.materialListStockLabel,
            child: ProductTag.preOrderTag(
              label: addOosMaterials.productTag(validateOutOfStockValue),
              backgroundColor:
                  addOosMaterials.productTagColor(validateOutOfStockValue),
              labelColor:
                  addOosMaterials.productTagLabelColor(validateOutOfStockValue),
            ),
          )
        : const SizedBox.shrink();
  }
}
