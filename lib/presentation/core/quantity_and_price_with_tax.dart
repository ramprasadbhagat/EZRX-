import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/material_tax.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';

class QuantityAndPriceWithTax extends StatelessWidget {
  final int quantity;
  final String quantityDescription;
  final String netPrice;
  final double taxPercentage;
  final double? taxValue;

  const QuantityAndPriceWithTax._({
    Key? key,
    required this.quantity,
    this.quantityDescription = '',
    required this.taxPercentage,
    required this.netPrice,
    this.taxValue,
  }) : super(key: key);

  factory QuantityAndPriceWithTax.order({
  required int quantity,
  String quantityDescription = '',
  required String netPrice,
  required double taxPercentage,
  }) => QuantityAndPriceWithTax._(
    quantity: quantity,
    quantityDescription: quantityDescription,
    netPrice: netPrice,
    taxPercentage: taxPercentage,
  );

  factory QuantityAndPriceWithTax.invoice({
    required int quantity,
    required String netPrice,
    required double taxValue,
    required double taxPercentage,
  }) =>
      QuantityAndPriceWithTax._(
        quantity: quantity,
        netPrice: netPrice,
        taxValue: taxValue,
        taxPercentage: taxPercentage,

      );

  @override
  Widget build(BuildContext context) {
    //TODO: Will cover this parse in another refactoring task later
    final eligibilityState = context.read<EligibilityBloc>().state;
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
              salesOrgConfig: eligibilityState.salesOrgConfigs,
              price: netPrice,
            ),
            if (eligibilityState.salesOrgConfigs.displayItemTaxBreakdown &&
                netPriceValue > 0)
              MaterialTax(
                totalPrice: netPriceValue,
                percentage: taxPercentage,
                //TODO : This is a temporary solution once C4P fix the calculated total, we will remove this
                taxValue: taxValue ??
                    (eligibilityState.salesOrgConfigs.salesOrg.isID
                        ? (netPriceValue * taxPercentage / 100).floorToDouble()
                        : (netPriceValue * taxPercentage / 100)),
              ),
          ],
        ),
      ],
    );
  }
}
