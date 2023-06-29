import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/order_history_filter/order_history_filter_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              routes: const [
                ViewByItemsPageRoute(),
                ViewByOrdersPageRoute(),
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
                        Expanded(
                          child: SearchBar(
                            onSearchChanged: (String value) {},
                            clearIconKey: WidgetKeys.clearIconKey,
                            controller: TextEditingController(),
                            onClear: () {},
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            if (context.tabsRouter.current.name ==
                                    ViewByOrdersPageRoute.name &&
                                !context
                                    .read<ViewByOrderBloc>()
                                    .state
                                    .isFetching) {
                              _showFilter(context);
                            }
                          },
                          icon: const Icon(
                            Icons.tune,
                          ),
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

  void _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
      builder: (_) {
        return const ViewByOrderFilterBottomSheet();
      },
    ).then((value) {
      if (value != null &&
          context.read<ViewByOrderBloc>().state.appliedFilter != value) {
        context.read<ViewByOrderBloc>().add(
              ViewByOrderEvent.fetch(
                customerCodeInfo:
                    context.read<CustomerCodeBloc>().state.customerCodeInfo,
                salesOrgConfigs: context.read<SalesOrgBloc>().state.configs,
                shipToInfo: context.read<CustomerCodeBloc>().state.shipToInfo,
                user: context.read<UserBloc>().state.user,
                sortDirection:
                    context.read<OrderHistoryFilterBloc>().state.sortDirection,
                filter: value,
              ),
            );
      }
    });
  }
}
