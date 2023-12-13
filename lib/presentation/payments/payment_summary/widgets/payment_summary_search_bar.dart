part of 'package:ezrxmobile/presentation/payments/payment_summary/payment_summary_page.dart';

class _PaymentSummarySearchBar extends StatelessWidget {
  const _PaymentSummarySearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSummaryBloc, PaymentSummaryState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching ||
          current.searchKey.isValueEmpty,
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          hintText: 'Search by payment advice / voucher no.',
          enabled: !state.isFetching,
          initialValue: state.searchKey.searchValueOrEmpty,
          onSearchChanged: (value) => context.read<PaymentSummaryBloc>().add(
                PaymentSummaryEvent.fetch(
                  appliedFilter: state.appliedFilterForSearch,
                  searchKey: SearchKey.searchFilter(value),
                ),
              ),
          onSearchSubmitted: (value) => context.read<PaymentSummaryBloc>().add(
                PaymentSummaryEvent.fetch(
                  appliedFilter: state.appliedFilterForSearch,
                  searchKey: SearchKey.searchFilter(value),
                ),
              ),
          customValidator: (value) => SearchKey.searchFilter(value).isValid(),
          onClear: () => context.read<PaymentSummaryBloc>().add(
                PaymentSummaryEvent.fetch(
                  appliedFilter: state.appliedFilterForSearch,
                  searchKey: SearchKey.searchFilter(''),
                ),
              ),
        );
      },
    );
  }
}
