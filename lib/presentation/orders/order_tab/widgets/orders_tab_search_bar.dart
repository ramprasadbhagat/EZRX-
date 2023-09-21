part of 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';

class _OrdersTabSearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  const _OrdersTabSearchBar({Key? key, required this.isFromViewByOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isFromViewByOrder
          ? BlocBuilder<ViewByOrderBloc, ViewByOrderState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching ||
                  current.searchKey.isValueEmpty,
              builder: (context, state) {
                return _OrderSearchBar(
                  isFromViewByOrder: isFromViewByOrder,
                  isFetching: state.isFetching,
                  searchText: state.searchKey.searchValueOrEmpty,
                );
              },
            )
          : BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
              buildWhen: (previous, current) =>
                  previous.isFetching != current.isFetching ||
                  current.searchKey.isValueEmpty,
              builder: (context, state) {
                return _OrderSearchBar(
                  isFromViewByOrder: isFromViewByOrder,
                  isFetching: state.isFetching,
                  searchText: state.searchKey.searchValueOrEmpty,
                );
              },
            ),
    );
  }
}

class _OrderSearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  final bool isFetching;
  final String searchText;
  const _OrderSearchBar({
    Key? key,
    required this.isFromViewByOrder,
    required this.isFetching,
    required this.searchText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomSearchBar(
      key: WidgetKeys.genericKey(
        key: searchText,
      ),
      enabled: !isFetching,
      initialValue: searchText,
      onSearchChanged: (value) => _onSearchChanged(
        context,
        value,
      ),
      onSearchSubmitted: (value) => _onSearch(
        context,
        value,
      ),
      //customValidator: we are not taking the value from the state, as there is autosearch.
      //It take time for 3 sec to emit the state, so we have used from local.
      customValidator: (value) => SearchKey.searchFilter(value).isValid(),
      onClear: () => _onSearch(
        context,
        '',
        onClear: true,
      ),
    );
  }

  void _onSearchChanged(BuildContext context, String value) => isFromViewByOrder
      ? _doViewByOrderAutoSearch(
          context: context,
          searchKey: value,
        )
      : _doViewByItemAutoSearch(
          context: context,
          searchKey: value,
        );

  void _onSearch(BuildContext context, String value, {bool onClear = false}) =>
      isFromViewByOrder
          ? _doViewByOrderFetch(
              context: context,
              searchKey: value,
              onClear: onClear,
            )
          : _doFetchViewByItemFetch(
              context: context,
              searchKey: value,
              onClear: onClear,
            );

  void _doFetchViewByItemFetch({
    required BuildContext context,
    String searchKey = '',
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ViewByItemsBloc>().add(
          ViewByItemsEvent.fetch(
            viewByItemFilter:
                context.read<ViewByItemsBloc>().state.appliedFilter,
            searchKey: SearchKey.searchFilter(searchKey),
          ),
        );
  }

  void _doViewByOrderFetch({
    required BuildContext context,
    String searchKey = '',
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ViewByOrderBloc>().add(
          ViewByOrderEvent.fetch(
            searchKey: SearchKey.searchFilter(searchKey),
            filter: context.read<ViewByOrderFilterBloc>().state.filter,
          ),
        );
  }

  void _doViewByItemAutoSearch({
    required BuildContext context,
    String searchKey = '',
  }) =>
      context.read<ViewByItemsBloc>().add(
            ViewByItemsEvent.autoSearchProduct(
              searchKey: SearchKey.searchFilter(searchKey),
            ),
          );

  void _doViewByOrderAutoSearch({
    required BuildContext context,
    String searchKey = '',
  }) =>
      context.read<ViewByOrderBloc>().add(
            ViewByOrderEvent.autoSearchProduct(
              searchKey: SearchKey.searchFilter(searchKey),
            ),
          );
}
