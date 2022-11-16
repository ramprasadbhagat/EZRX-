import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/orders/create_order/price_tier_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/quantity_input.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemDetailWidget extends StatelessWidget {
  const CartItemDetailWidget({
    Key? key,
    required this.controller,
    required this.cartItem,
    required this.onQuantityChanged,
  }) : super(key: key);

  final PriceAggregate cartItem;
  final TextEditingController controller;
  final Function(int) onQuantityChanged;

  @override
  Widget build(BuildContext context) {
    final taxCode = context.read<SalesOrgBloc>().state.salesOrg.taxCode;
    final enableVat = context.read<SalesOrgBloc>().state.configs.enableVat;

    return Column(
      children: [
        Center(
          child: Text(
            cartItem.materialInfo.materialDescription,
            style: Theme.of(context).textTheme.headline6?.apply(
                  color: ZPColors.black,
                ),
          ),
        ),
        Center(
          child: Text(
            cartItem.materialInfo.principalData.principalName,
            style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: ZPColors.lightGray,
                ),
          ),
        ),
        Center(
          child: Text(
            cartItem.materialInfo.materialNumber.displayMatNo,
            style: Theme.of(context).textTheme.subtitle2?.apply(
                  color: ZPColors.lightGray,
                ),
          ),
        ),
        if (cartItem.price.zmgDiscount)
          Column(
            children: [
              ...cartItem.price.tiers.first.items
                  .map((e) => PriceTierLabel(priceTierItem: e))
                  .toList(),
            ],
          ),
        QuantityInput(
          controller: controller,
          onFieldChange: onQuantityChanged,
          minusPressed: onQuantityChanged,
          addPressed: onQuantityChanged,
        ),
        const SizedBox(height: 15),
        enableVat
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: 'Unit price before $taxCode'.tr(),
                  valueText: cartItem.display(PriceType.listPrice),
                  keyFlex: 1,
                  valueFlex: 1,
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BalanceTextRow(
            keyText: 'Unit Price'.tr(),
            valueText: cartItem.display(PriceType.unitPrice),
            keyFlex: 1,
            valueFlex: 1,
          ),
        ),
        enableVat
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: BalanceTextRow(
                  keyText: 'Total price before $taxCode'.tr(),
                  valueText: cartItem.display(PriceType.listPriceTotal),
                  keyFlex: 1,
                  valueFlex: 1,
                ),
              )
            : const SizedBox.shrink(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BalanceTextRow(
            keyText: 'Total price'.tr(),
            valueText: cartItem.display(PriceType.unitPriceTotal),
            keyFlex: 1,
            valueFlex: 1,
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
