import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemPrice extends StatelessWidget {
  final bool showPreviousPrice;
  final String originPrice;
  final String unitPrice;
  final bool hasDescription;
  const OrderItemPrice({
    Key? key,
    required this.showPreviousPrice,
    required this.unitPrice,
    required this.hasDescription,
    this.originPrice = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (showPreviousPrice)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PriceComponent(
                  salesOrgConfig: configs,
                  price: originPrice,
                  type: PriceStyle.counterOfferPrice,
                ),
              ),
            PriceComponent(
              salesOrgConfig: configs,
              price: unitPrice,
              type: PriceStyle.summaryPrice,
            ),
          ],
        ),
        if (showPreviousPrice && hasDescription)
          Text(
            context.tr('Offer applied'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                  fontSize: 10,
                ),
          ),
      ],
    );
  }
}
