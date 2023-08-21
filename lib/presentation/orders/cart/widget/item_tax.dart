import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemTax extends StatelessWidget {
  const ItemTax({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  final PriceAggregate cartItem;

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
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              price: cartItem.itemTax.toString(),
              type: PriceStyle.taxPrice,
            ),
            Text(
              '(${cartItem.itemTaxPercent}% tax)',
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
              salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
              price: cartItem.finalPriceTotalWithTax.toStringAsFixed(2),
              type: PriceStyle.taxPrice,
            ),
          ],
        ),
      ],
    );
  }
}
