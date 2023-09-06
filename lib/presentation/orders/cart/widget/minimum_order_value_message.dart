part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _MovCheckMessage extends StatelessWidget {
  const _MovCheckMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayMovWarning != current.displayMovWarning,
      builder: (context, state) {
        return state.displayMovWarning
            ? InfoLabel(
                margin:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                mainColor: ZPColors.lightRedStatusColor,
                textValue:
                    '${'Please ensure that the order value satisfies the minimum order value of'.tr()} ${StringUtils.displayPrice(
                  context.read<EligibilityBloc>().state.salesOrgConfigs,
                  double.parse(
                    context
                        .read<EligibilityBloc>()
                        .state
                        .salesOrgConfigs
                        .minOrderAmount,
                  ),
                )}',
              )
            : const SizedBox.shrink();
      },
    );
  }
}
