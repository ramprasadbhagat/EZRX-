import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnRoot extends StatelessWidget {
  const ReturnRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.returnRootPage,
      appBar: AppBar(
        title: const Text('Returns').tr(),
        centerTitle: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnnouncementWidget(currentPath: context.router.currentPath),
          Expanded(
            child: AutoTabsRouter.tabBar(
              routes: const [
                ReturnByItemPageRoute(),
                ReturnByRequestPageRoute(),
              ],
              builder: (context, child, tabController) => Column(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      border: const Border(
                        bottom: BorderSide(
                          color: ZPColors.unselectedTabColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: TabBar(
                      controller: tabController,
                      tabs: [
                        'View by items',
                        'View by return request',
                      ]
                          .map(
                            (e) => Tab(
                              key: Key(
                                StringUtils.changeToCamelCase(sentence: e),
                              ),
                              text: e.tr(),
                            ),
                          )
                          .toList(),
                    ),
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
                        Expanded(
                          child: context.tabsRouter.current.name ==
                                  ReturnByItemPageRoute.name
                              ? const _ListByItemSearchBar()
                              : const _ListByRequestSearchBar(),
                        ),
                        _Filter(
                          viewByItem: context.tabsRouter.current.name ==
                              ReturnByItemPageRoute.name,
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

class _Filter extends StatelessWidget {
  const _Filter({Key? key, required this.viewByItem}) : super(key: key);
  final bool viewByItem;

  @override
  Widget build(BuildContext context) {
    return viewByItem
        ? BlocBuilder<ReturnListByItemBloc, ReturnListByItemState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterTuneIcon(viewByItem: viewByItem);
            },
          )
        : BlocBuilder<ReturnListByRequestBloc, ReturnListByRequestState>(
            buildWhen: (previous, current) =>
                previous.appliedFilter.appliedFilterCount !=
                    current.appliedFilter.appliedFilterCount ||
                previous.isFetching != current.isFetching,
            builder: (context, state) {
              return _FilterTuneIcon(viewByItem: viewByItem);
            },
          );
  }
}

class _FilterTuneIcon extends StatelessWidget {
  const _FilterTuneIcon({Key? key, required this.viewByItem}) : super(key: key);
  final bool viewByItem;

  @override
  Widget build(BuildContext context) {
    final appliedFilterCount = viewByItem
        ? context
            .read<ReturnListByItemBloc>()
            .state
            .appliedFilter
            .appliedFilterCount
        : context
            .read<ReturnListByRequestBloc>()
            .state
            .appliedFilter
            .appliedFilterCount;
    final isNotFetching = viewByItem
        ? !context.read<ReturnListByItemBloc>().state.isFetching
        : !context.read<ReturnListByRequestBloc>().state.isFetching;

    return CustomBadge(
      Icons.tune,
      count: appliedFilterCount,
      badgeColor: ZPColors.orange,
      onPressed: () => isNotFetching
          ? _showFilterPage(
              context: context,
              viewByItem: viewByItem,
            )
          : null,
    );
  }

  void _showFilterPage({
    required BuildContext context,
    required bool viewByItem,
  }) {
    viewByItem
        ? context.read<ViewByItemReturnFilterBloc>().add(
              ViewByItemReturnFilterEvent.updateFilterToLastApplied(
                lastAppliedFilter:
                    context.read<ReturnListByItemBloc>().state.appliedFilter,
              ),
            )
        : context.read<ViewByRequestReturnFilterBloc>().add(
              ViewByRequestReturnFilterEvent.updateFilterToLastApplied(
                lastAppliedFilter:
                    context.read<ReturnListByRequestBloc>().state.appliedFilter,
              ),
            );
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
            ? const ReturnByItemFilterPage()
            : const ReturnByRequestFilterPage();
      },
    ).then(
      (value) {
        if (value == null) return;
        viewByItem
            ? _doFetchReturnListByItem(
                context: context,
                filter: value as ReturnFilter,
              )
            : _doFetchReturnListByRequest(
                context: context,
                filter: value as ReturnFilter,
              );
      },
    );
  }

  void _doFetchReturnListByItem({
    required BuildContext context,
    required ReturnFilter filter,
  }) {
    final appliedFilter =
        context.read<ReturnListByItemBloc>().state.appliedFilter;
    if (appliedFilter != filter) {
      context.read<ReturnListByItemBloc>().add(
            ReturnListByItemEvent.fetch(
              salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              appliedFilter: filter,
              searchKey: context.read<ReturnListByItemBloc>().state.searchKey,
            ),
          );
    }
  }

  void _doFetchReturnListByRequest({
    required BuildContext context,
    required ReturnFilter filter,
  }) {
    final appliedFilter =
        context.read<ReturnListByRequestBloc>().state.appliedFilter;
    if (appliedFilter != filter) {
      context.read<ReturnListByRequestBloc>().add(
            ReturnListByRequestEvent.fetch(
              salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
              user: context.read<UserBloc>().state.user,
              appliedFilter: filter,
              searchKey: SearchKey(''),
            ),
          );
    }
  }
}

class _ListByItemSearchBar extends StatefulWidget {
  const _ListByItemSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_ListByItemSearchBar> createState() => _ListByItemSearchBarState();
}

class _ListByItemSearchBarState extends State<_ListByItemSearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    final searchFilter = context.read<ReturnListByItemBloc>().state.searchKey;
    if (searchFilter == SearchKey(searchKey)) return;

    context.read<ReturnListByItemBloc>().add(
          ReturnListByItemEvent.fetch(
            salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            appliedFilter:
                context.read<ReturnListByItemBloc>().state.appliedFilter,
            searchKey: SearchKey(searchKey),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    controller.text = context
        .read<ReturnListByItemBloc>()
        .state
        .searchKey
        .getOrDefaultValue('');

    return BlocConsumer<ReturnListByItemBloc, ReturnListByItemState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listenWhen: (previous, current) =>
          previous.searchKey != current.searchKey,
      listener: (context, state) {
        final searchText = state.searchKey.getValue();
        controller.value = TextEditingValue(
          text: searchText,
          selection: TextSelection.collapsed(
            offset: controller.selection.base.offset,
          ),
        );
      },
      builder: (context, state) {
        return SearchBar(
          controller: controller,
          enabled: !state.isFetching,
          onSearchChanged: (value) {},
          isAutoSearch: false,
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          clearIconKey: WidgetKeys.clearIconKey,
          customValidator: () => SearchKey.search(controller.text).isValid(),
          onClear: () {
            if (controller.text.isEmpty) return;
            controller.clear();
            _search(
              context: context,
              searchKey: controller.text,
            );
          },
          border: InputBorder.none,
        );
      },
    );
  }
}

class _ListByRequestSearchBar extends StatefulWidget {
  const _ListByRequestSearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<_ListByRequestSearchBar> createState() =>
      _ListByRequestSearchBarState();
}

class _ListByRequestSearchBarState extends State<_ListByRequestSearchBar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _search({
    required BuildContext context,
    required String searchKey,
  }) {
    final searchFilter =
        context.read<ReturnListByRequestBloc>().state.searchKey;
    final key = SearchKey(searchKey);
    if (searchFilter == key) return;

    context.read<ReturnListByRequestBloc>().add(
          ReturnListByRequestEvent.fetch(
            salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
            customerCodeInfo:
                context.read<CustomerCodeBloc>().state.customerCodeInfo,
            shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
            user: context.read<UserBloc>().state.user,
            appliedFilter:
                context.read<ReturnListByRequestBloc>().state.appliedFilter,
            searchKey: key,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    controller.text = context
        .read<ReturnListByRequestBloc>()
        .state
        .searchKey
        .getOrDefaultValue('');

    return BlocConsumer<ReturnListByRequestBloc, ReturnListByRequestState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      listenWhen: (previous, current) =>
          previous.searchKey != current.searchKey,
      listener: (context, state) {
        final searchText = state.searchKey.getValue();
        controller.value = TextEditingValue(
          text: searchText,
          selection: TextSelection.collapsed(
            offset: controller.selection.base.offset,
          ),
        );
      },
      builder: (context, state) {
        return SearchBar(
          controller: controller,
          enabled: !state.isFetching,
          onSearchChanged: (value) {},
          isAutoSearch: false,
          onSearchSubmitted: (value) => _search(
            context: context,
            searchKey: value,
          ),
          clearIconKey: WidgetKeys.clearIconKey,
          customValidator: () => SearchKey.search(controller.text).isValid(),
          onClear: () {
            if (controller.text.isEmpty) return;
            controller.clear();
            _search(
              context: context,
              searchKey: controller.text,
            );
          },
          border: InputBorder.none,
        );
      },
    );
  }
}
