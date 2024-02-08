part of 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';

class _OrdersTabSearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  const _OrdersTabSearchBar({
    Key? key,
    required this.isFromViewByOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFromViewByOrder
        ? BlocBuilder<ViewByOrderBloc, ViewByOrderState>(
            buildWhen: (previous, current) =>
                current.isFetching != previous.isFetching,
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isFetching,
                isFromViewByOrder: isFromViewByOrder,
                searchKey: state.searchKey.searchValueOrEmpty,
              );
            },
          )
        : BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _SummarySearchBar(
                isEnable: !state.isFetching,
                searchKey: state.searchKey.searchValueOrEmpty,
                isFromViewByOrder: isFromViewByOrder,
              );
            },
          );
  }
}

class _SummarySearchBar extends StatelessWidget {
  final bool isEnable;
  final bool isFromViewByOrder;
  final String searchKey;
  const _SummarySearchBar({
    Key? key,
    required this.isEnable,
    required this.isFromViewByOrder,
    required this.searchKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
        initialValue: searchKey,
        enabled: isEnable,
        onSearchChanged: (value) => _search(
          context: context,
          searchKey: value,
        ),
        onSearchSubmitted: (value) => _search(
          context: context,
          searchKey: value,
        ),
        customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        onClear: () => _search(
          context: context,
          searchKey: '',
          onClear: true,
        ),
      ),
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
    bool onClear = false,
  }) {
    trackMixpanelEvent(
      MixpanelEvents.orderDetailSearched,
      props: {
        MixpanelProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          isFromViewByOrder
              ? const ViewByOrdersPageRoute().path
              : const ViewByItemsPageRoute().path,
        ),
        MixpanelProps.keyword: searchKey,
      },
    );
    isFromViewByOrder
        ? context.read<ViewByOrderBloc>().add(
              ViewByOrderEvent.fetch(
                filter: context.read<ViewByOrderBloc>().state.appliedFilter,
                searchKey: onClear
                    ? SearchKey.searchFilter(searchKey)
                    : SearchKey.search(searchKey),
                    isDetailsPage: false,
              ),
            )
        : context.read<ViewByItemsBloc>().add(
              ViewByItemsEvent.fetch(
                viewByItemFilter:
                    context.read<ViewByItemsBloc>().state.appliedFilter,
                searchKey: onClear
                    ? SearchKey.searchFilter(searchKey)
                    : SearchKey.search(searchKey),
              ),
            );
  }
}
