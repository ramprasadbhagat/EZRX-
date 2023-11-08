part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _CartPageInvalidItemsMessage extends StatelessWidget {
  const _CartPageInvalidItemsMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderEligibilityBloc, OrderEligibilityState>(
      buildWhen: (previous, current) =>
          previous.displayInvalidItemsWarning !=
          current.displayInvalidItemsWarning,
      builder: (context, state) {
        if (!state.displayInvalidItemsWarning) {
          return const SizedBox.shrink();
        }

        return InfoLabel(
          key: WidgetKeys.cartPagePriceMessageWidget,
          margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          mainColor: ZPColors.lightRedStatusColor,
          textValue: context.tr(
            'Please remove invalid items.',
          ),
        );
      },
    );
  }
}
