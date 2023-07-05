import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_item_filter_page.dart';
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
                          child: SearchBar(
                            onSearchChanged: (String value) {},
                            clearIconKey: WidgetKeys.clearIconKey,
                            controller: TextEditingController(),
                            onClear: () {},
                          ),
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
        : _FilterTuneIcon(viewByItem: viewByItem);
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
        : 0;
    final isNotFetching = viewByItem
        ? !context.read<ReturnListByItemBloc>().state.isFetching
        : true;

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
        : null;
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
        return viewByItem ? const ReturnByItemFilterPage() : Container();
      },
    ).then((value) {
      if (value != null) {
        if (viewByItem) {
          final appliedFilter =
              context.read<ReturnListByItemBloc>().state.appliedFilter;
          if (appliedFilter != value) {
            context.read<ReturnListByItemBloc>().add(
                  ReturnListByItemEvent.fetch(
                    salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                    user: context.read<UserBloc>().state.user,
                    appliedFilter: value,
                  ),
                );
          }
        }
      }
    });
  }
}
