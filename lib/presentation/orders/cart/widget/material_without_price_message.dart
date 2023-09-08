part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _MWPCheckMessage extends StatelessWidget {
  const _MWPCheckMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayMWPNotAllowedWarning !=
          current.displayMWPNotAllowedWarning,
      builder: (context, state) {
        return state.displayMWPNotAllowedWarning
            ? InfoLabel(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                textValue:
                    "Can't order material without price. Please remove to continue to check out."
                        .tr(),
                mainColor: ZPColors.lightRedStatusColor,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
