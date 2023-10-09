import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnMaterialInfoSection extends StatelessWidget {
  final ReturnMaterial returnMaterial;
  const ReturnMaterialInfoSection({
    Key? key,
    required this.returnMaterial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        bottom: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            returnMaterial.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            returnMaterial.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            key: WidgetKeys.newRequestSuccessItemTitle,
          ),
          PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: returnMaterial.unitPrice.apiParameterValue,
            type: PriceStyle.bonusPrice,
          ),
        ],
      ),
    );
  }
}
