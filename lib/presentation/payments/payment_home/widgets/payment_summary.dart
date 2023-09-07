part of '../payment_page.dart';

class _PaymentSummary extends StatelessWidget {
  const _PaymentSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentInProgressBloc, PaymentInProgressState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              title: 'Payment summary',
              onTapIconButton: () =>
                  context.router.pushNamed('payments/payment_summary'),
            ),
            _ItemCard(
              key: WidgetKeys.paymentHomeInProgressCard,
              keyVal: [
                KeyValuePair(
                  key: 'In progress',
                  value: state.amount.displayNAIfEmpty,
                  widgetKey: WidgetKeys.inProgressAmount,

                ),
              ],
              isFetching: state.isFetching,
            ),
          ],
        );
      },
    );
  }
}
