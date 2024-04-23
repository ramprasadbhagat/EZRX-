part of 'package:ezrxmobile/presentation/payments/account_summary/account_summary_page.dart';

class _AccountSummarySearchBar extends StatelessWidget {
  final String currentActiveTabName;

  const _AccountSummarySearchBar({
    required this.currentActiveTabName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (currentActiveTabName == AllInvoicesPageRoute.name) {
      return BlocBuilder<AllInvoicesBloc, AllInvoicesState>(
        bloc: context.allInvoicesBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            current.isLoading != previous.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
            hintText: context.isMPPayment
                ? 'Search by MP full invoice number'
                : 'Search by full invoice number',
          );
        },
      );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      return BlocBuilder<AllCreditsBloc, AllCreditsState>(
        bloc: context.allCreditsBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
            hintText: context.isMPPayment
                ? 'Search by MP full credit note number'
                : 'Search by full credit note number',
          );
        },
      );
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      return BlocBuilder<FullSummaryBloc, FullSummaryState>(
        bloc: context.fullSummaryBloc(context.isMPPayment),
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
            hintText: context.isMPPayment
                ? 'Search by MP full invoice/credit number'
                : 'Search by invoice/credit number',
          );
        },
      );
    }

    return const SizedBox.shrink();
  }
}

class _SummarySearchBar extends StatelessWidget {
  final bool isEnable;
  final String searchKey;
  final String hintText;

  const _SummarySearchBar({
    Key? key,
    required this.isEnable,
    required this.searchKey,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
        hintText: hintText,
        initialValue: searchKey,
        enabled: isEnable,
        onSearchChanged: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onSearchSubmitted: (value) => _fetch(
          context: context,
          searchKey: value,
        ),
        customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        onClear: () => _fetch(
          context: context,
          searchKey: '',
          onClear: true,
        ),
      ),
    );
  }

  void _fetch({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    //TODO: Will revisit this while enhancing the search implementation logic.
    var previousSearchKey = SearchKey('');
    if (context.tabsRouter.current.name == AllInvoicesPageRoute.name) {
      previousSearchKey = context
          .allInvoicesBloc(context.isMPPayment)
          .state
          .appliedFilter
          .searchKey;
    } else if (context.tabsRouter.current.name == AllCreditsPageRoute.name) {
      previousSearchKey = context
          .allCreditsBloc(context.isMPPayment)
          .state
          .appliedFilter
          .searchKey;
    } else {
      previousSearchKey = context
          .fullSummaryBloc(context.isMPPayment)
          .state
          .appliedFilter
          .searchKey;
    }

    if (!onClear && searchKey.isEmpty ||
        searchKey == previousSearchKey.getOrDefaultValue('')) return;

    if (context.tabsRouter.current.name == AllInvoicesPageRoute.name) {
      context.allInvoicesBloc(context.isMPPayment).add(
            AllInvoicesEvent.fetch(
              appliedFilter: searchKey.isEmpty
                  ? AllInvoicesFilter.defaultFilter()
                  : AllInvoicesFilter.empty().copyWith(
                      searchKey: SearchKey.searchFilter(searchKey),
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
                      searchKey: SearchKey.searchFilter(searchKey),
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
                      searchKey: SearchKey.searchFilter(searchKey),
                    ),
            ),
          );

      return;
    }
  }
}
