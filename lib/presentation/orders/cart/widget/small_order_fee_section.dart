import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/order_eligibility/order_eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/info_label.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/price_component.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SmallOrderFee extends StatelessWidget {
  final OrderEligibilityState orderEligibilityState;

  const SmallOrderFee({
    Key? key,
    required this.orderEligibilityState,
  }) : super(key: key);

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
    Key? key,
    required this.value,
    required this.message,
  }) : super(key: key);

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
            _DisplayPrice(
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

class _DisplayPrice extends StatelessWidget {
  const _DisplayPrice({
    Key? key,
    required this.priceComponent,
  }) : super(key: key);

  final PriceComponent priceComponent;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      buildWhen: (previous, current) =>
          previous.aplSimulatorOrder != current.aplSimulatorOrder,
      builder: (context, state) {
        if (state.isAplProductLoading) {
          return SizedBox(
            width: Responsive.isLargerThan(context, Breakpoint.desktop)
                ? MediaQuery.of(context).size.width * 0.2
                : MediaQuery.of(context).size.width * 0.3,
            child: LoadingShimmer.tile(),
          );
        }

        return priceComponent;
      },
    );
  }
}
