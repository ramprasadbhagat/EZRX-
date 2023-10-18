import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_item_details.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnItemPrice extends StatelessWidget {
  const ReturnItemPrice({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ReturnMaterial data;

  @override
  Widget build(BuildContext context) {
    final configs = context.read<EligibilityBloc>().state.salesOrgConfigs;
    var details =
        context.read<NewRequestBloc>().state.getReturnItemDetails(data.uuid);
    if (details == ReturnItemDetails.empty()) {
      details = data.validatedItemDetails;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (details.priceOverride.isValid())
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: PriceComponent(
                  salesOrgConfig: configs,
                  price: details.unitPrice.apiParameterValue,
                  type: PriceStyle.counterOfferPrice,
                ),
              ),
            PriceComponent(
              salesOrgConfig: configs,
              price: details.priceOverride.isValid()
                  ? details.priceOverride.stringValue
                  : details.unitPrice.apiParameterValue,
              type: PriceStyle.totalPrice,
            ),
          ],
        ),
        if (details.priceOverride.isValid())
          Text(
            context.tr('Requested return value counter offer'),
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: ZPColors.darkGray,
                  fontSize: 10,
                ),
          ),
      ],
    );
  }
}
