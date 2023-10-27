part of 'package:ezrxmobile/presentation/orders/cart/cart_page.dart';

class _StockInvalidIDMarketMessage extends StatelessWidget {
  const _StockInvalidIDMarketMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.read<EligibilityBloc>().state.salesOrg.isID
        ? BlocBuilder<CartBloc, CartState>(
            buildWhen: (previous, current) =>
                previous.isNotAvailableToCheckoutForID !=
                current.isNotAvailableToCheckoutForID,
            builder: (context, state) {
              return state.isNotAvailableToCheckoutForID
                  ? InfoLabel(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      mainColor: ZPColors.lightRedStatusColor,
                      textValue:
                          'Please ensure that the order quantity of each item is within order limit'
                              .tr(),
                    )
                  : const SizedBox.shrink();
            },
          )
        : const SizedBox.shrink();
  }
}
