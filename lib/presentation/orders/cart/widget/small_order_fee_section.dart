import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/cart/widget/price_display_widget.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallOrderFee extends StatelessWidget {
  final OrderEligibilityState orderEligibilityState;

  const SmallOrderFee({
    super.key,
    required this.orderEligibilityState,
  });

  @override
  Widget build(BuildContext context) {
    final messageObject = orderEligibilityState.smallOrderFeeAppliedMessage;

    return SmallOrderFeeSection(
      value: orderEligibilityState.smallOrderFee,
      message: context.tr(
        messageObject.message,
        namedArgs: messageObject.arguments,
      ),
    );
  }
}

class SmallOrderFeeSection extends StatelessWidget {
  final double value;
  final String message;

  const SmallOrderFeeSection({
    super.key,
    required this.value,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return Column(
      key: WidgetKeys.checkoutSummarySmallOrderFee,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('Small order fee'),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: ZPColors.neutralsBlack,
                  ),
            ),
            PriceDisplayWidget(
              priceComponent: PriceComponent(
                key: WidgetKeys.checkoutSummarySmallOrderFeePrice,
                salesOrgConfig: eligibilityState.salesOrgConfigs,
                price: value.toString(),
                type: PriceStyle.summaryPrice,
              ),
            ),
          ],
        ),
        if (value > 0)
          InfoLabel(
            textValue: message,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
            mainColor: ZPColors.blueAccent,
            textStyle: Theme.of(context).textTheme.bodySmall,
            textColor: ZPColors.infoTextBlueColor,
          ),
      ],
    );
  }
}