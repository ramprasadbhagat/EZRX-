part of '../payment_page.dart';

class _PaymentTotalInvoice extends StatelessWidget {
  final bool isMarketPlace;

  const _PaymentTotalInvoice({
    Key? key,
    required this.isMarketPlace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountSummaryBloc, AccountSummaryState>(
      bloc: context.accountSummaryBloc(isMarketPlace),
      buildWhen: (previous, current) =>
          previous.isFetchingOutstandingBalance !=
          current.isFetchingOutstandingBalance,
      builder: (context, state) {
        return _ItemCard(
          key: WidgetKeys.paymentHomeInvoiceCard,
          keyVal: [
            _KeyValuePair(
              key: 'Total outstanding',
              value: state.outstandingBalance.amount.displayNAIfEmpty,
              widgetKey: WidgetKeys.totalOutstanding,
            ),
            _KeyValuePair(
              key: 'Total overdue',
              value: state.outstandingBalance.overdue.displayNAIfEmpty,
              widgetKey: WidgetKeys.totalOverdue,
            ),
          ],
          isFetching: state.isFetchingOutstandingBalance,
        );
      },
    );
  }
}
