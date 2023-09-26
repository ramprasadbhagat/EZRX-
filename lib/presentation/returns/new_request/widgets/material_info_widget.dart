import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialInfoWidget extends StatelessWidget {
  const MaterialInfoWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

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
            data.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            data.materialDescription,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Wrap(
            children: [
              Text(
                '${'Batch'.tr()} ${data.batch} ',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                      fontSize: 12,
                    ),
              ),
              Text(
                '(${'Expires'.tr()} ${data.expiryDate.dateString})',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: ZPColors.darkGray,
                      fontSize: 12,
                    ),
              ),
            ],
          ),
          PriceComponent(
            salesOrgConfig:
                context.read<EligibilityBloc>().state.salesOrgConfigs,
            price: data.unitPrice.apiParameterValue,
            type: PriceStyle.bonusPrice,
          ),
        ],
      ),
    );
  }
}
