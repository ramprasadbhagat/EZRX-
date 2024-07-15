part of 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';

class _OrdersTabSearchBar extends StatelessWidget {
  final bool isFromViewByOrder;

  const _OrdersTabSearchBar({
    super.key,
    required this.isFromViewByOrder,
  });

  @override
  Widget build(BuildContext context) {
    return isFromViewByOrder
        ? _SummarySearchBar(
            isFromViewByOrder: isFromViewByOrder,
            searchKey: context
                .read<ViewByOrderBloc>()
                .state
                .searchKey
                .searchValueOrEmpty,
          )
        : _SummarySearchBar(
            searchKey: context
                .read<ViewByItemsBloc>()
                .state
                .searchKey
                .searchValueOrEmpty,
            isFromViewByOrder: isFromViewByOrder,
          );
  }
}

class _SummarySearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  final String searchKey;

  const _SummarySearchBar({
    required this.isFromViewByOrder,
    required this.searchKey,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomSearchBar(
        key: WidgetKeys.genericKey(key: searchKey),
        initialValue: searchKey,
        enabled: true,
        onSearchChanged: (value) => _search(
          context: context,
          searchKey: value,
        ),
        onSearchSubmitted: (value) => _search(
          context: context,
          searchKey: value,
        ),
        customValidator: (value) => SearchKey.search(value).isValid(),
        onClear: () => _search(
          context: context,
          searchKey: '',
        ),
      ),
    );
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    trackMixpanelEvent(
      TrackingEvents.orderDetailSearched,
      props: {
        TrackingProps.subTabFrom: RouterUtils.buildRouteTrackingName(
          isFromViewByOrder
              ? const ViewByOrdersPageRoute().routeName
              : const ViewByItemsPageRoute().routeName,
        ),
        TrackingProps.keyword: searchKey,
      },
    );
    isFromViewByOrder
        ? context.read<ViewByOrderBloc>().add(
              ViewByOrderEvent.fetch(
                filter: context.read<ViewByOrderBloc>().state.appliedFilter,
                searchKey: SearchKey.search(searchKey),
                isDetailsPage: false,
              ),
            )
        : context.read<ViewByItemsBloc>().add(
              ViewByItemsEvent.fetch(
                viewByItemFilter:
                    context.read<ViewByItemsBloc>().state.appliedFilter,
                searchKey: SearchKey.search(searchKey),
              ),
            );
  }
}
