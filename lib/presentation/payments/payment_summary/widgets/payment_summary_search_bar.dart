part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummarySearchBar extends StatelessWidget {
  const _PaymentSummarySearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      bloc: context.paymentSummaryBloc(context.isMPPayment),
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          current.searchKey.isValueEmpty,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          hintText: context.isMPPayment
              ? 'Search by MP payment advice / voucher no.'
              : 'Search by payment advice / voucher no.',
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => _fetchPaymentSummary(
            searchValue: value,
            context: context,
          ),
          onSearchSubmitted: (value) => _fetchPaymentSummary(
            searchValue: value,
            context: context,
          ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => _fetchPaymentSummary(
            searchValue: '',
            context: context,
          ),
        );
      },
    );
  }

  void _fetchPaymentSummary({
    required String searchValue,
    required BuildContext context,
  }) {
    final appliedFilter = searchValue.isEmpty
        ? PaymentSummaryFilter.defaultFilter()
        : PaymentSummaryFilter.empty();
    context.paymentSummaryBloc(context.isMPPayment).add(
          PaymentSummaryEvent.fetch(
            appliedFilter: appliedFilter,
            searchKey: SearchKey.searchFilter(searchValue),
          ),
        );
  }
}
