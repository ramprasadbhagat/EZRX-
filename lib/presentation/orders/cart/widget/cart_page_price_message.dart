part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPagePriceMessage extends StatelessWidget {
  const _CartPagePriceMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayCartPagePriceMessage !=
          current.displayCartPagePriceMessage,
      builder: (context, state) {
        if (!state.displayCartPagePriceMessage) {
          return const SizedBox.shrink();
        }

        return InfoLabel(
          key: WidgetKeys.cartPagePriceMessageWidget,
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          mainColor: ZPColors.lightRedStatusColor,
          textValue: context.tr(
            'Can’t order material without price. Please remove to continue to check out.',
          ),
        );
      },
    );
  }
}
