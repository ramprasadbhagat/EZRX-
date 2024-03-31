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
        buildWhen: (previous, current) =>
            current.isLoading != previous.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
          );
        },
      );
    }
    if (currentActiveTabName == AllCreditsPageRoute.name) {
      return BlocBuilder<AllCreditsBloc, AllCreditsState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
          );
        },
      );
    }
    if (currentActiveTabName == FullSummaryPageRoute.name) {
      return BlocBuilder<FullSummaryBloc, FullSummaryState>(
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          return _SummarySearchBar(
            isEnable: !state.isLoading,
            searchKey: state.appliedFilter.searchKey.searchValueOrEmpty,
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
  const _SummarySearchBar({
    Key? key,
    required this.isEnable,
    required this.searchKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
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
      previousSearchKey =
          context.read<AllInvoicesBloc>().state.appliedFilter.searchKey;
    } else if (context.tabsRouter.current.name == AllCreditsPageRoute.name) {
      previousSearchKey =
          context.read<AllCreditsBloc>().state.appliedFilter.searchKey;
    } else {
      previousSearchKey =
          context.read<FullSummaryBloc>().state.appliedFilter.searchKey;
    }

    if (!onClear && searchKey.isEmpty ||
        searchKey == previousSearchKey.getOrDefaultValue('')) return;

    if (context.tabsRouter.current.name == AllInvoicesPageRoute.name) {
      context.read<AllInvoicesBloc>().add(
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
      context.read<AllCreditsBloc>().add(
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
      context.read<FullSummaryBloc>().add(
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
