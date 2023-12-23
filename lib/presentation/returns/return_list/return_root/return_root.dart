import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/return_list_by_item_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_item/view_by_item_filter/view_by_item_return_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/return_list_by_request_bloc.dart';
import 'package:ezrxmobile/application/returns/return_list/view_by_request/view_by_request_filter/view_by_request_return_filter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/entities/return_filter.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/domain/utils/string_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/filter_return_by_request.dart';
part 'widgets/filter_return_by_item.dart';
part 'widgets/list_by_item_search_bar.dart';
part 'widgets/list_by_request_search_bar.dart';
part 'widgets/export_return_by_item.dart';
part 'widgets/export_return_by_request.dart';

class ReturnRoot extends StatefulWidget {
  const ReturnRoot({Key? key}) : super(key: key);

  @override
  State<ReturnRoot> createState() => _ReturnRootState();
}

class _ReturnRootState extends State<ReturnRoot> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() {
    context.read<ReturnListByItemBloc>().add(
          ReturnListByItemEvent.fetch(
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey(''),
          ),
        );
    context.read<ReturnListByRequestBloc>().add(
          ReturnListByRequestEvent.fetch(
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey(''),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.returnRootPage,
      appBar: AppBar(
        title: Text(
          context.tr('Returns'),
        ),
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
                  TabBar(
                    controller: tabController,
                    tabs: [
                      'View by items',
                      'View by return requests',
                    ]
                        .map(
                          (e) => Tab(
                            key: Key(
                              StringUtils.changeToCamelCase(sentence: e),
                            ),
                            text: context.tr(e),
                          ),
                        )
                        .toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      12.0,
                      12.0,
                      12.0,
                      0.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: context.tabsRouter.current.name ==
                                  ReturnByItemPageRoute.name
                              ? const _ListByItemSearchBar(
                                  key: WidgetKeys.returnByItemsSearchBar,
                                )
                              : const _ListByRequestSearchBar(
                                  key: WidgetKeys.returnByRequestSearchBar,
                                ),
                        ),
                        context.tabsRouter.current.name ==
                                ReturnByItemPageRoute.name
                            ? const _ExportReturnByItem(
                                key: WidgetKeys.exportReturnByItem,
                              )
                            : const _ExportReturnByRequest(
                                key: WidgetKeys.exportReturnByRequest,
                              ),
                        context.tabsRouter.current.name ==
                                ReturnByItemPageRoute.name
                            ? const _FilterReturnByItem(
                                key: WidgetKeys.returnByItemsFilterButton,
                              )
                            : const _FilterReturnByRequest(
                                key: WidgetKeys.returnByRequestFilterButton,
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
