part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/payment_method/payment_method_tab.dart';

class _PaymentMethodSelector extends StatelessWidget {
  const _PaymentMethodSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewPaymentBloc, NewPaymentState>(
      listenWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod &&
          !current.isFetchingPaymentMethod,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) => ErrorUtils.handleApiFailure(context, failure),
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetchingPaymentMethod != current.isFetchingPaymentMethod ||
          previous.selectedPaymentMethod != current.selectedPaymentMethod,
      builder: (context, state) {
        return state.isFetchingPaymentMethod
            ? LoadingShimmer.tile()
            : Wrap(
                children: [
                  if (state.paymentMethods.isNotEmpty)
                    Row(
                      children: state.paymentMethods
                          .map(
                            (paymentMethod) => Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: InkWell(
                                onTap: () {
                                  context.read<NewPaymentBloc>().add(
                                        NewPaymentEvent
                                            .updatePaymentMethodSelected(
                                          paymentMethodSelected: paymentMethod,
                                        ),
                                      );
                                },
                                child: Row(
                                  children: [
                                    Radio(
                                      value: paymentMethod,
                                      groupValue: state.selectedPaymentMethod,
                                      onChanged: null,
                                    ),
                                    Text(
                                      paymentMethod.getValue(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                ],
              );
      },
    );
  }
}
