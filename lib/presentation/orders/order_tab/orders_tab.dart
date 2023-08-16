import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_filter/view_by_item_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_history_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_history_filter.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/filter/order_filter_page.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: WidgetKeys.ordersTab,
        title: const Text('Orders').tr(),
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.headset_mic_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: [
                const ViewByItemsPageRoute(),
                ViewByOrdersPageRoute(
                  orderHistoryItem: OrderHistoryItem.empty(),
                ),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      'View by items',
                      'View by orders',
                    ]
                        .map(
                          (e) => Tab(
                            key: Key(e.toLowerCase()),
                            text: e.tr(),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      20.0,
                      20.0,
                      20.0,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        _SearchBar(
                          isFromViewByOrder: context.tabsRouter.current.name ==
                              ViewByOrdersPageRoute.name,
                        ),
                        _Filter(
                          viewByItem: context.tabsRouter.current.name ==
                              ViewByItemsPageRoute.name,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterTuneIcon extends StatelessWidget {
  const _FilterTuneIcon({Key? key, required this.viewByItem}) : super(key: key);
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
            ? const OrderFilterPage()
            : const ViewByOrderFilterBottomSheet();
      },
    ).then(
      (value) {
        if (value == null) return;
        viewByItem
            ? _doFetchViewByItem(
                context: context,
                filter: value as ViewByItemHistoryFilter,
              )
            : _doFetchViewByOrder(
                context: context,
                filter: value as ViewByOrderHistoryFilter,
              );
      },
    );
  }

  void _doFetchViewByItem({
    required BuildContext context,
    required ViewByItemHistoryFilter filter,
  }) {
    if (context.read<ViewByItemsBloc>().state.appliedFilter != filter) {
      context.read<ViewByItemsBloc>().add(
            ViewByItemsEvent.fetch(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              viewByItemHistoryFilter: filter,
              searchKey: context.read<ViewByItemsBloc>().state.searchKey,
            ),
          );
    }
  }

  void _doFetchViewByOrder({
    required BuildContext context,
    required ViewByOrderHistoryFilter filter,
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

class _Filter extends StatelessWidget {
  const _Filter({Key? key, required this.viewByItem}) : super(key: key);
  final bool viewByItem;

  @override
  Widget build(BuildContext context) {
    return viewByItem
        ? BlocBuilder<ViewByItemFilterBloc, ViewByItemFilterState>(
            buildWhen: (previous, current) =>
                previous.filter.appliedFilterCount !=
                current.filter.appliedFilterCount,
            builder: (context, state) {
              return _FilterTuneIcon(viewByItem: viewByItem);
            },
          )
        : BlocBuilder<ViewByOrderFilterBloc, ViewByOrderFilterState>(
            buildWhen: (previous, current) =>
                previous.filter.appliedFilterCount !=
                current.filter.appliedFilterCount,
            builder: (context, state) {
              return _FilterTuneIcon(viewByItem: viewByItem);
            },
          );
  }
}

class _SearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  const _SearchBar({Key? key, required this.isFromViewByOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isFromViewByOrder
        ? BlocBuilder<ViewByOrderBloc, ViewByOrderState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _OrderSearchBar(
                isFromViewByOrder: isFromViewByOrder,
                isFetching: state.isFetching,
                searchText: state.searchKey.getOrDefaultValue(''),
              );
            },
          )
        : BlocBuilder<ViewByItemsBloc, ViewByItemsState>(
            buildWhen: (previous, current) =>
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _OrderSearchBar(
                isFromViewByOrder: isFromViewByOrder,
                isFetching: state.isFetching,
                searchText: state.searchKey.getOrDefaultValue(''),
              );
            },
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
    return Expanded(
      child: CustomSearchBar(
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
        clearIconKey: WidgetKeys.clearIconKey,
        //customValidator: we are not taking the value from the state, as there is autosearch.
        //It take time for 3 sec to emit the state, so we have used from local.
        customValidator: (value) => SearchKey.searchFilter(value).isValid(),
        onClear: () => _onClear(context),
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

  void _onSearch(BuildContext context, String value) =>
      isFromViewByOrder
          ? _doViewByOrderFetch(
              context: context,
              searchKey: value,
            )
          : _doFetchViewByItemFetch(
              context: context,
              searchKey: value,
            );

  void _onClear(BuildContext context) {
    isFromViewByOrder
        ? _doViewByOrderFetch(
            context: context,
            onClear: true,
          )
        : _doFetchViewByItemFetch(
            context: context,
            onClear: true,
          );
  }

  void _doFetchViewByItemFetch({
    required BuildContext context,
    String searchKey = '',
    bool onClear = false,
  }) {
    if (!onClear && searchKey.isEmpty) return;
    context.read<ViewByItemsBloc>().add(
          ViewByItemsEvent.fetch(
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
            shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            viewByItemHistoryFilter:
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
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
            shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            sortDirection: 'desc',
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
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              viewByItemHistoryFilter:
                  context.read<ViewByItemsBloc>().state.appliedFilter,
              searchKey: SearchKey.searchFilter(searchKey),
            ),
          );

  void _doViewByOrderAutoSearch({
    required BuildContext context,
    String searchKey = '',
  }) =>
      context.read<ViewByOrderBloc>().add(
            ViewByOrderEvent.autoSearchProduct(
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
              shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              sortDirection: 'desc',
              searchKey: SearchKey.searchFilter(searchKey),
              filter: context.read<ViewByOrderFilterBloc>().state.filter,
            ),
          );
}
