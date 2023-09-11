part of 'package:ezrxmobile/presentation/orders/cart/override/request_counter_offer_bottomsheet.dart';

class _CounterOfferButtons extends StatelessWidget {
  final PriceAggregate cartItem;
  const _CounterOfferButtons({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PriceOverrideBloc, PriceOverrideState>(
      buildWhen: (previous, current) =>
          previous.showErrorMessages != current.showErrorMessages ||
          previous.isFetching != current.isFetching ||
          previous.item.materialInfo.counterOfferDetails !=
              current.item.materialInfo.counterOfferDetails,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                key: WidgetKeys.counterOfferCancelButton,
                onPressed: () {
                  context.router.pop();
                },
                child: Text('Cancel'.tr()),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                key: WidgetKeys.counterOfferConfirmButton,
                onPressed: () {
                  context
                      .read<PriceOverrideBloc>()
                      .add(const PriceOverrideEvent.validateInputFields());
                  if (state.isInputFieldValid &&
                      state.item.materialInfo.counterOfferDetails !=
                          cartItem.materialInfo.counterOfferDetails) {
                    context.read<CartBloc>().add(
                          CartEvent.upsertCart(
                            priceAggregate: state.item,
                            quantity: state.item.quantity,
                          ),
                        );
                  }
                },
                child: LoadingShimmer.withChild(
                  enabled: state.isFetching,
                  child: Text('Confirm'.tr()),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
