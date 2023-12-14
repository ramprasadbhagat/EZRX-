import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/widgets/material_tax.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class QuantityAndPriceWithTax extends StatelessWidget {
  final int quantity;
  final String quantityDescription;
  final String netPrice;
  final double taxPercentage;

  const QuantityAndPriceWithTax({
    Key? key,
    required this.quantity,
    this.quantityDescription = '',
    required this.taxPercentage,
    required this.netPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Will cover this parse in another refactoring task later
    final netPriceValue = double.tryParse(netPrice) ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              '${context.tr('Qty')}: $quantity',
              key: WidgetKeys.cartItemProductQty,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            if (quantityDescription.isNotEmpty)
              Text(
                quantityDescription,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: ZPColors.black,
                    ),
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PriceComponent(
              key: WidgetKeys.cartItemProductTotalPrice,
              salesOrgConfig:
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
              price: netPrice,
            ),
            if (taxPercentage > 0 &&
                netPriceValue > 0 &&
                !context.read<EligibilityBloc>().state.salesOrg.isID)
              MaterialTax(
                totalPrice: netPriceValue,
                percentage: taxPercentage,
              ),
          ],
        ),
      ],
    );
  }
}
