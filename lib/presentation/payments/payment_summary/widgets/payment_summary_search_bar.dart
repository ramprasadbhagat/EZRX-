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
          previous.appliedFilter.searchKey != current.appliedFilter.searchKey,
      builder: (context, state) {
        final searchKey = state.appliedFilter.searchKey;

        return CustomSearchBar(
          key: WidgetKeys.genericKey(key: searchKey.searchValueOrEmpty),
          hintText: context.isMPPayment
              ? 'Search by MP payment advice / voucher no.'
              : 'Search by payment advice / voucher no.',
          enabled: !state.isFetching,
          initialValue: searchKey.searchValueOrEmpty,
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
    final bloc = context.paymentSummaryBloc(context.isMPPayment);
    final currenSearchValue =
        bloc.state.appliedFilter.searchKey.getOrDefaultValue('');
    if (currenSearchValue != searchValue) {
      bloc.add(
        PaymentSummaryEvent.fetch(
          appliedFilter: searchValue.isEmpty
              ? PaymentSummaryFilter.defaultFilter()
              : PaymentSummaryFilter.empty().copyWith(
                  searchKey: SearchKey.searchFilter(searchValue),
                ),
        ),
      );
    }
  }
}
