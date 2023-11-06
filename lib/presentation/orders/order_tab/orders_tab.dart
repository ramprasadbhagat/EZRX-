import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_item/view_by_item_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_bloc.dart';
import 'package:ezrxmobile/application/order/view_by_order/view_by_order_filter/view_by_order_filter_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_item_filter.dart';
import 'package:ezrxmobile/domain/order/entities/view_by_order_filter.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/custom_search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/filter/view_by_order_filter.dart';
import 'package:ezrxmobile/presentation/orders/order_tab/section/view_by_item_filter/view_by_item_filter_sheet.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/utils/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/widgets/orders_tab_filter.dart';
part 'package:ezrxmobile/presentation/orders/order_tab/widgets/orders_tab_search_bar.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: WidgetKeys.ordersTab,
        title: Text(
          context.tr('Orders'),
          style: Theme.of(context).textTheme.labelLarge,
        ),
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
        children: [
          AnnouncementWidget(
            currentPath: context.router.currentPath,
          ),
          BlocBuilder<EligibilityBloc, EligibilityState>(
            buildWhen: (previous, current) =>
                previous.salesOrg != current.salesOrg,
            builder: (context, state) {
              final routes = [
                if (!state.salesOrg.isID) const ViewByItemsPageRoute(),
                const ViewByOrdersPageRoute(),
              ];
              final tabs = [
                if (!state.salesOrg.isID) 'View by items',
                'View by orders',
              ];

              return Expanded(
                child: AutoTabsRouter.tabBar(
                  routes: routes,
                  builder: (context, child, tabController) => Column(
                    children: [
                      if (routes.length > 1)
                        TabBar(
                          controller: tabController,
                          tabs: tabs
                              .map(
                                (e) => Tab(
                                  key: Key(e.toLowerCase()),
                                  text: context.tr(e),
                                ),
                              )
                              .toList(),
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        child: Row(
                          children: [
                            _OrdersTabSearchBar(
                              key: WidgetKeys.ordersTabSearchBarKey,
                              isFromViewByOrder:
                                  context.tabsRouter.current.name ==
                                      ViewByOrdersPageRoute.name,
                            ),
                            _OrdersTabFilter(
                              key: WidgetKeys.ordersTabFilterButtonKey,
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
              );
            },
          ),
        ],
      ),
    );
  }
}
