part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _SearchBar extends StatelessWidget {
  final bool isInvoiceTabActive;
  const _SearchBar({
    Key? key,
    required this.isInvoiceTabActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isInvoiceTabActive
        ? BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
            buildWhen: (previous, current) =>
                current.isLoading != previous.isLoading,
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isLoading,
                isInvoiceTabActive: isInvoiceTabActive,
                searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
              );
            },
          )
        : BlocBuilder<AllCreditsBloc, AllCreditsState>(
            buildWhen: (previous, current) =>
                previous.isLoading != current.isLoading,
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isLoading,
                searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
                isInvoiceTabActive: isInvoiceTabActive,
              );
            },
          );
  }
}

class _SummarySearchBar extends StatelessWidget {
  final bool isEnable;
  final bool isInvoiceTabActive;
  final String searchKey;
  const _SummarySearchBar({
    Key? key,
    required this.isEnable,
    required this.isInvoiceTabActive,
    required this.searchKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
        initialValue: searchKey,
        enabled: isEnable,
        onSearchChanged: (value) => _autoSearch(
          context: context,
          searchKey: value,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSearchSubmitted: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        clearIconKey: WidgetKeys.clearIconKey,
        customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        onClear: () => _fetch(
          context: context,
          searchKey: '',
          onClear: true,
        ),
      ),
    );
  }

  void _autoSearch({
    required BuildContext context,
    required String searchKey,
  }) =>
      isInvoiceTabActive
          ? context.read<AllInvoicesBloc>().add(
                AllInvoicesEvent.autoSearchProduct(
                  searchKey: SearchKey.searchFilter(searchKey),
                ),
              )
          : context.read<AllCreditsBloc>().add(
                AllCreditsEvent.autoSearchProduct(
                  searchKey: SearchKey.searchFilter(searchKey),
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  customerCodeInfo:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                ),
              );

  void _fetch({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    isInvoiceTabActive
        ? context.read<AllInvoicesBloc>().add(
              AllInvoicesEvent.fetch(
                appliedFilter: context
                    .read<AllInvoicesBloc>()
                    .state
                    .appliedFilter
                    .copyWith(
                      searchKey: SearchKey.searchFilter(searchKey),
                    ),
              ),
            )
        : context.read<AllCreditsBloc>().add(
              AllCreditsEvent.fetch(
                appliedFilter:
                    context.read<AllCreditsBloc>().state.appliedFilter.copyWith(
                          searchKey: SearchKey(searchKey),
                        ),
                salesOrganisation:
                    context.read<SalesOrgBloc>().state.salesOrganisation,
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
              ),
            );
  }
}
