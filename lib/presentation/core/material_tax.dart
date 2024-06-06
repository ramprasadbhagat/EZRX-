import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialTax extends StatelessWidget {
  final double totalPrice;
  final double percentage;
  final double taxValue;
  const MaterialTax({
    super.key,
    required this.totalPrice,
    required this.percentage,
    required this.taxValue,
  });

  @override
  Widget build(BuildContext context) {
    final txtStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: ZPColors.darkGray,
        );

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Wrap(
          children: [
            Text(
              '+ ',
              style: txtStyle,
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: taxValue.toString(),
              type: PriceStyle.taxPrice,
            ),
            Text(
              '($percentage% ${context.tr('tax')})',
              style: txtStyle,
            ),
          ],
        ),
        Wrap(
          children: [
            Text(
              '= ',
              style: txtStyle,
            ),
            PriceComponent(
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              //TODO : This is a temporary solution once C4P fix the calculated total, we will remove this
              price: (totalPrice + taxValue).toString(),
              type: PriceStyle.taxPrice,
            ),
          ],
        ),
      ],
    );
  }
}
