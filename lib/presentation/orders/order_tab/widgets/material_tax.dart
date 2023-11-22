import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialTax extends StatelessWidget {
  final double totalPrice;
  final double percentage;
  const MaterialTax({
    Key? key,
    required this.totalPrice,
    required this.percentage,
  }) : super(key: key);

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
              price: (totalPrice * percentage / 100).toString(),
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
              price: (totalPrice * (1 + percentage / 100)).toString(),
              type: PriceStyle.taxPrice,
            ),
          ],
        ),
      ],
    );
  }
}
