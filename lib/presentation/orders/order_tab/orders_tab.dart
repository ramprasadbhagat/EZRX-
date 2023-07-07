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
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/filter/order_filter_page.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/domain/core/value/value_objects.dart';

class OrdersTab extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                ViewByOrdersPageRoute(orderHistoryItem: OrderHistoryItem.empty()),
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
        if (value != null) {
          if (viewByItem) {
            if (context
                .read<ViewByItemsBloc>()
                .state
                .appliedFilter
                .isNotEqual(newFilter: value)) {
              context.read<ViewByItemsBloc>().add(
                    ViewByItemsEvent.fetch(
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrgConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      user: context.read<UserBloc>().state.user,
                      viewByItemHistoryFilter: value,
                    ),
                  );
            }
          } else {
            if (context.read<ViewByOrderBloc>().state.appliedFilter != value) {
              context.read<ViewByOrderBloc>().add(
                    ViewByOrderEvent.fetch(
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrgConfigs:
                          context.read<SalesOrgBloc>().state.configs,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      user: context.read<UserBloc>().state.user,
                      sortDirection: 'desc',
                      filter: value,
                    ),
                  );
            }
          }
        }
      },
    );
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

class _SearchBar extends StatefulWidget {
  final bool isFromViewByOrder;
  const _SearchBar({Key? key, required this.isFromViewByOrder})
      : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  final TextEditingController _itemSearchController = TextEditingController();

  @override
  void dispose() {
    _itemSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isFromViewByOrder) {
      _itemSearchController.text =
          context.read<ViewByOrderBloc>().state.searchKey.getOrDefaultValue('');

      return BlocConsumer<ViewByOrderBloc, ViewByOrderState>(
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching,
        listenWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          final searchText = state.searchKey.getValue();
          _itemSearchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(
              offset: _itemSearchController.selection.base.offset,
            ),
          );
        },
        builder: (context, state) {
          return _OrderSearchBar(
            isFromViewByOrder: widget.isFromViewByOrder,
            isFetching: state.isFetching,
            controller: _itemSearchController,
          );
        },
      );
    } else {
      _itemSearchController.text = '';

      return _OrderSearchBar(
        isFromViewByOrder: widget.isFromViewByOrder,
        isFetching: false,
        controller: _itemSearchController,
      );
    }
  }
}

class _OrderSearchBar extends StatelessWidget {
  final bool isFromViewByOrder;
  final bool isFetching;
  final TextEditingController controller;
  const _OrderSearchBar({
    Key? key,
    required this.isFromViewByOrder,
    required this.isFetching,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchBar(
        controller: controller,
        enabled: !isFetching,
        onSearchChanged: (value) {},
        isAutoSearch: false,
        onSearchSubmitted: (value) {
          if (isFromViewByOrder) {
            context.read<ViewByOrderBloc>().add(
                  ViewByOrderEvent.searchByOrder(
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    sortDirection: 'desc',
                    searchKey: value,
                    filter: context.read<ViewByOrderFilterBloc>().state.filter,
                  ),
                );
          }
        },
        clearIconKey: WidgetKeys.clearIconKey,
        customValidator: () => SearchKey.search(controller.text).isValid(),
        onClear: () {
          if (controller.text.isEmpty) return;
          controller.clear();
          if (isFromViewByOrder) {
            context.read<ViewByOrderBloc>().add(
                  ViewByOrderEvent.searchByOrder(
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    sortDirection: 'desc',
                    searchKey: '',
                    filter: context.read<ViewByOrderFilterBloc>().state.filter,
                  ),
                );
          }
        },
        border: InputBorder.none,
      ),
    );
  }
}
