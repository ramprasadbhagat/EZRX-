part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _AccountSummarySearchBar extends StatelessWidget {
  final String currentActiveTabName;

  const _AccountSummarySearchBar({
    required this.currentActiveTabName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      return _SummarySearchBar(
        searchKey: context
            .allInvoicesBloc(context.isMPPayment)
            .state
            .appliedFilter
            .searchKey
            .getOrDefaultValue(''),
        hintText: context.isMPPayment
            ? 'Search by MP full invoice number'
            : 'Search by full invoice number',
      );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      return _SummarySearchBar(
        searchKey: context
            .allCreditsBloc(context.isMPPayment)
            .state
            .appliedFilter
            .searchKey
            .getOrDefaultValue(''),
        hintText: context.isMPPayment
            ? 'Search by MP full credit note number'
            : 'Search by full credit note number',
      );
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      return _SummarySearchBar(
        searchKey: context
            .fullSummaryBloc(context.isMPPayment)
            .state
            .appliedFilter
            .searchKey
            .getOrDefaultValue(''),
        hintText: context.isMPPayment
            ? 'Search by MP full invoice/credit number'
            : 'Search by invoice/credit number',
      );
    }

    return const SizedBox.shrink();
  }
}

class _SummarySearchBar extends StatelessWidget {
  final String searchKey;
  final String hintText;

  const _SummarySearchBar({
    required this.searchKey,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
        hintText: hintText,
        initialValue: searchKey,
        enabled: true,
        onSearchChanged: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSearchSubmitted: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        customValidator: (value) => SearchKey.search(value).isValid(),
        onClear: () => _fetch(
          context: context,
          searchKey: '',
        ),
      ),
    );
  }

  void _fetch({
    required BuildContext context,
    required String searchKey,
  }) {
    if (context.tabsRouter.current.name == AllInvoicesPageRoute.name) {
      context.allInvoicesBloc(context.isMPPayment).add(
            AllInvoicesEvent.fetch(
              appliedFilter: searchKey.isEmpty
                  ? AllInvoicesFilter.defaultFilter()
                  : AllInvoicesFilter.empty().copyWith(
                      searchKey: SearchKey.search(searchKey),
                    ),
            ),
          );

      return;
    }
    if (context.tabsRouter.current.name == AllCreditsPageRoute.name) {
      context.allCreditsBloc(context.isMPPayment).add(
            AllCreditsEvent.fetch(
              appliedFilter: searchKey.isEmpty
                  ? AllCreditsFilter.defaultFilter()
                  : AllCreditsFilter.empty().copyWith(
                      searchKey: SearchKey.search(searchKey),
                    ),
            ),
          );

      return;
    }
    if (context.tabsRouter.current.name == FullSummaryPageRoute.name) {
      context.fullSummaryBloc(context.isMPPayment).add(
            FullSummaryEvent.fetch(
              appliedFilter: searchKey.isEmpty
                  ? FullSummaryFilter.defaultFilter()
                  : FullSummaryFilter.empty().copyWith(
                      searchKey: SearchKey.search(searchKey),
                    ),
            ),
          );

      return;
    }
  }
}
