import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialQuantityAndPrice extends StatelessWidget {
  const MaterialQuantityAndPrice({
    Key? key,
    required this.quantity,
    required this.totalPrice,
  }) : super(key: key);

  final int quantity;
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${context.tr('Qty')}: $quantity',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ZPColors.black,
              ),
        ),
        PriceComponent(
          salesOrgConfig: context.read<EligibilityBloc>().state.salesOrgConfigs,
          price: totalPrice.toString(),
        ),
      ],
    );
  }
}
