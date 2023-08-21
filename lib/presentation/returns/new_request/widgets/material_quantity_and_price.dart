import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialQuantityAndPrice extends StatelessWidget {
  const MaterialQuantityAndPrice({
    Key? key,
    required this.quantity,
    required this.unitPrice,
  }) : super(key: key);

  final int quantity;
  final double unitPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${'Qty'.tr()}: $quantity',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.black,
              ),
        ),
        PriceComponent(
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          price: (unitPrice * quantity).toString(),
        ),
      ],
    );
  }
}
