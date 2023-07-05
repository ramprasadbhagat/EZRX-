import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationTabbar extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeNavigationTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.showTermsAndCondition != current.showTermsAndCondition,
      builder: (context, state) {
        return state.showTermsAndCondition
            ? const AupTCDialog(
                key: WidgetKeys.aupTcScreen,
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return Material(
                      color: Colors.white,
                      child: AutoTabsRouter.tabBar(
                        routes: _getTabs(context)
                            .map((item) => item.route)
                            .toList(),
                        builder: (context, child, tabController) => Column(
                          children: [
                            Expanded(child: child),
                            SafeArea(
                              bottom: true,
                              top: false,
                              child: TabBar(
                                key: WidgetKeys.homeTabBar,
                                indicator: TopIndicator(),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                ),
                                controller: tabController,
                                labelPadding: EdgeInsets.zero,
                                tabs: _getTabs(context)
                                    .map(
                                      (item) => Tab(
                                        icon: item.icon,
                                        text: item.label.tr(),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}

class TopIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorBox();
  }
}

class _TopIndicatorBox extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final paint = Paint()
      ..color = ZPColors.primary
      ..isAntiAlias = true;

    final xPos = offset.dx + cfg.size!.width / 2;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(
          xPos - cfg.size!.width / 2,
          -6,
          xPos + cfg.size!.width / 2,
          2,
        ),
        bottomLeft: const Radius.circular(8.0),
        bottomRight: const Radius.circular(8.0),
      ),
      paint,
    );

    canvas.drawLine(
      Offset(offset.dx + 3, offset.dy),
      Offset(cfg.size!.width + offset.dx - 3, 0),
      paint,
    );
  }
}

List<RouteItem> _getTabs(BuildContext context) {
  if (!context.read<UserBloc>().state.user.userCanCreateOrder) {
    return context.read<UserBloc>().state.user.userCanAccessOrderHistory
        ? [
            homeTabRouteItem,
            ordersTabRouteItem,
            notificationTabRouteItem,
            moreTabRouteItem,
          ]
        : [
            homeTabRouteItem,
            notificationTabRouteItem,
            moreTabRouteItem,
          ];
  }

  return [
    homeTabRouteItem,
    productTabRouteItem,
    ordersTabRouteItem,
    notificationTabRouteItem,
    moreTabRouteItem,
  ];
}

const RouteItem homeTabRouteItem = RouteItem(
  route: HomeTabRoute(),
  icon: Icon(
    Icons.home_outlined,
    key: WidgetKeys.homeTab,
  ),
  label: 'Home',
);

RouteItem productTabRouteItem = const RouteItem(
  route: ProductsTabRoute(),
  icon: Icon(
    Icons.storefront_outlined,
    key: WidgetKeys.productsTab,
  ),
  label: 'Products',
);

RouteItem ordersTabRouteItem = RouteItem(
  route: OrdersTabRoute(),
  icon: const Icon(
    Icons.article_outlined,
    key: WidgetKeys.ordersTab,
  ),
  label: 'Orders',
);

const RouteItem notificationTabRouteItem = RouteItem(
  route: NotificationTabRoute(),
  icon: Icon(
    Icons.notifications_none_outlined,
    key: WidgetKeys.notificationTab,
  ),
  label: 'Notifications',
);

RouteItem moreTabRouteItem = const RouteItem(
  route: MoreTabRoute(),
  icon: Icon(
    Icons.reorder_outlined,
    key: WidgetKeys.moreTab,
  ),
  label: 'More',
);

class RouteItem {
  final PageRouteInfo<dynamic> route;
  final Icon icon;
  final String label;

  const RouteItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}
