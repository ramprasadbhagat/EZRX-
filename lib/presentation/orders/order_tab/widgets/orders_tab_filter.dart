part of 'package:ezrxmobile/presentation/orders/order_tab/orders_tab.dart';

class _OrdersTabFilter extends StatelessWidget {
  const _OrdersTabFilter({Key? key, required this.viewByItem})
      : super(key: key);
  final bool viewByItem;

  @override
  Widget build(BuildContext context) {
    return viewByItem
        ? BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterElement(
                isNotFetching:
                    !context.read<ViewByItemsBloc>().state.isFetching,
                viewByItem: viewByItem,
                appliedFilterCount: context
                    .read<ViewByItemsBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          )
        : BlocBuilder<ViewByOrderBloc, ViewByOrderState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterElement(
                isNotFetching:
                    !context.read<ViewByOrderBloc>().state.isFetching,
                viewByItem: viewByItem,
                appliedFilterCount: context
                    .read<ViewByOrderBloc>()
                    .state
                    .appliedFilter
                    .appliedFilterCount,
              );
            },
          );
  }
}

class _FilterElement extends StatelessWidget {
  const _FilterElement({
    Key? key,
    required this.isNotFetching,
    required this.viewByItem,
    required this.appliedFilterCount,
  }) : super(key: key);
  final bool isNotFetching;
  final bool viewByItem;
  final int appliedFilterCount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => isNotFetching
              ? _showFilterPage(
                  context: context,
                  viewByItem: viewByItem,
                )
              : null,
          icon: const Icon(
            Icons.tune,
          ),
        ),
        Positioned(
          right: 4,
          top: 4,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ZPColors.orange,
            ),
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: Text(
              appliedFilterCount.toString(),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 10,
                    color: ZPColors.white,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  void _showFilterPage({
    required BuildContext context,
    required bool viewByItem,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (_) {
        return viewByItem
            ? const ViewByItemFilterSheet()
            : const ViewByOrderFilterBottomSheet();
      },
    ).then(
      (value) {
        if (value == null) return;
        viewByItem
            ? _doFetchViewByItem(
                context: context,
                filter: value as ViewByItemFilter,
              )
            : _doFetchViewByOrder(
                context: context,
                filter: value as ViewByOrdersFilter,
              );
      },
    );
  }

  void _doFetchViewByItem({
    required BuildContext context,
    required ViewByItemFilter filter,
  }) {
    if (context.read<ViewByItemsBloc>().state.appliedFilter != filter) {
      context.read<ViewByItemsBloc>().add(
            ViewByItemsEvent.fetch(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              viewByItemFilter: filter,
              searchKey: context.read<ViewByItemsBloc>().state.searchKey,
              salesOrganisation:
                  context.read<EligibilityBloc>().state.salesOrganisation,
            ),
          );
    }
  }

  void _doFetchViewByOrder({
    required BuildContext context,
    required ViewByOrdersFilter filter,
  }) {
    if (context.read<ViewByOrderBloc>().state.appliedFilter != filter) {
      context.read<ViewByOrderBloc>().add(
            ViewByOrderEvent.fetch(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              sortDirection: 'desc',
              filter: filter,
              searchKey: context.read<ViewByOrderBloc>().state.searchKey,
            ),
          );
    }
  }
}
