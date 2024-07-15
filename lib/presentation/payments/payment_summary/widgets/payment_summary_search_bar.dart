part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummarySearchBar extends StatelessWidget {
  const _PaymentSummarySearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final initialSearchKey = context
        .paymentSummaryBloc(context.isMPPayment)
        .state
        .appliedFilter
        .searchKey;

    return CustomSearchBar(
      key: WidgetKeys.genericKey(key: initialSearchKey.searchValueOrEmpty),
      hintText: context.isMPPayment
          ? 'Search by MP payment advice / voucher no.'
          : 'Search by payment advice / voucher no.',
      enabled: true,
      initialValue: initialSearchKey.searchValueOrEmpty,
      onSearchChanged: (value) => _fetchPaymentSummary(
        searchValue: value,
        context: context,
      ),
      onSearchSubmitted: (value) => _fetchPaymentSummary(
        searchValue: value,
        context: context,
      ),
      customValidator: (value) => SearchKey.search(value).isValid(),
      onClear: () => _fetchPaymentSummary(
        searchValue: '',
        context: context,
      ),
    );
  }

  void _fetchPaymentSummary({
    required String searchValue,
    required BuildContext context,
  }) =>
      context.paymentSummaryBloc(context.isMPPayment).add(
            PaymentSummaryEvent.fetch(
              appliedFilter: searchValue.isEmpty
                  ? PaymentSummaryFilter.defaultFilter()
                  : PaymentSummaryFilter.empty().copyWith(
                      searchKey: SearchKey.search(searchValue),
                    ),
            ),
          );
}
