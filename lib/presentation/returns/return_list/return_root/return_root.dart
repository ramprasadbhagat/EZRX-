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
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_item_filter_page.dart';
import 'package:ezrxmobile/presentation/returns/return_list/return_filter/return_by_request_filter_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'widgets/filter_return_by_request.dart';
part 'widgets/filter_return_by_item.dart';
part 'widgets/list_by_item_search_bar.dart';
part 'widgets/list_by_request_search_bar.dart';

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
    final salesOrg =
        context.read<SalesOrgBloc>().state.salesOrganisation.salesOrg;
    final shipToInfo = context.read<CustomerCodeBloc>().state.shipToInfo;
    final customerCodeInfo =
        context.read<CustomerCodeBloc>().state.customerCodeInfo;
    final user = context.read<UserBloc>().state.user;
    context.read<ReturnListByItemBloc>().add(
          ReturnListByItemEvent.fetch(
            salesOrg: salesOrg,
            shipInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
            user: user,
            appliedFilter: ReturnFilter.empty(),
            searchKey: SearchKey(''),
          ),
        );
    context.read<ReturnListByRequestBloc>().add(
          ReturnListByRequestEvent.fetch(
            salesOrg: salesOrg,
            shipInfo: shipToInfo,
            customerCodeInfo: customerCodeInfo,
            user: user,
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
        title: const Text('Returns').tr(),
        centerTitle: false,
        actions: [
          IconButton(
            key: WidgetKeys.headsetMicOutlined,
            onPressed: () {},
            icon: const Icon(
              Icons.headset_mic_outlined,
              color: ZPColors.primary,
            ),
          ),
        ],
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
                        context.tabsRouter.current.name ==
                                ReturnByItemPageRoute.name
                            ? const _FilterReturnByItem()
                            : const _FilterReturnByRequest(),
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
