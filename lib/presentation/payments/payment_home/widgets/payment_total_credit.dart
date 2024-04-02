part of '../payment_page.dart';

class _PaymentTotalCredit extends StatelessWidget {
  final bool isMarketPlace;

  const _PaymentTotalCredit({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
      bloc: context.accountSummaryBloc(isMarketPlace),
      buildWhen: (previous, current) =>
          previous.isFetchingCreditLimit != current.isFetchingCreditLimit,
      builder: (context, state) {
        return _ItemCard(
          key: WidgetKeys.paymentHomeCreditCard,
          keyVal: [
            _KeyValuePair(
              key: 'Total credit limit',
              value: state.creditLimit.creditLimit.displayNAIfEmpty,
              widgetKey: WidgetKeys.totalCreditLimit,
            ),
            _KeyValuePair(
              key: 'Utilized credit',
              value: state.creditLimit.creditExposure.displayNAIfEmpty,
              widgetKey: WidgetKeys.creditLimitUtilized,
            ),
            _KeyValuePair(
              key: 'Credit limit remaining',
              value: state.creditLimit.creditBalance.displayNAIfEmpty,
              widgetKey: WidgetKeys.creditLimitRemaining,
            ),
          ],
          isFetching: state.isFetchingCreditLimit,
        );
      },
    );
  }
}
