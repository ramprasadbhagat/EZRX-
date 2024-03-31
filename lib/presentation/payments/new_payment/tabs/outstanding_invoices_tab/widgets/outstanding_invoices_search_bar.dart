part of 'package:ezrxmobile/presentation/payments/new_payment/tabs/outstanding_invoices_tab/outstanding_invoices_tab.dart';

class _OutstandingInvoicesSearchBar extends StatelessWidget {
  const _OutstandingInvoicesSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OutstandingInvoicesBloc, OutstandingInvoicesState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          key: WidgetKeys.genericKey(
            key: state.searchKey.searchValueOrEmpty,
          ),
          onSearchChanged: (value) =>
              _search(context: context, searchKey: value),
          onSearchSubmitted: (value) =>
              _search(context: context, searchKey: value),
          hintText: context.tr('Search'),
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // Only digits
            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
          ],
          customValidator: (value) => SearchKey.search(value).isValid(),
          enabled: !state.isLoading,
          onClear: () => _search(context: context, searchKey: ''),
          initialValue: state.searchKey.searchValueOrEmpty,
        );
      },
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    trackMixpanelEvent(MixpanelEvents.documentNumberSearched);
    context.read<OutstandingInvoicesBloc>().add(
          OutstandingInvoicesEvent.fetch(
            appliedFilter: searchKey.isEmpty
                ? OutstandingInvoiceFilter.defaultFilter()
                : OutstandingInvoiceFilter.empty(),
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }
}
