import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/more/more_tab.dart';
import 'package:ezrxmobile/presentation/orders/orders_tab.dart';
import 'package:ezrxmobile/presentation/payments/payments_tab.dart';
import 'package:ezrxmobile/presentation/products/products_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeNavigationTabbar extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  HomeNavigationTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.showTermsAndCondition != current.showTermsAndCondition,
      builder: (context, state) {
        final orientation = MediaQuery.of(context).orientation;

        return state.showTermsAndCondition
            ? const AupTCDialog(
                key: WidgetKeys.aupTcScreen,
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: SizerUtil.deviceType != DeviceType.mobile &&
                        orientation == Orientation.landscape
                    ? BlocBuilder<UserBloc, UserState>(
                        buildWhen: (previous, current) => previous != current,
                        builder: (context, state) {
                          return AutoTabsRouter(
                            lazyLoad: false,
                            routes: _getTabs(context)
                                .map((item) => item.route)
                                .toList(),
                            builder: (context, child, animation) {
                              var activeIndex = _getTabs(context).indexWhere(
                                (d) => context.tabsRouter
                                    .isRouteActive(d.route.routeName),
                              );
                              if (activeIndex == -1) {
                                activeIndex = 0;
                              }

                              return Row(
                                children: [
                                  NavigationRail(
                                    key: WidgetKeys.homeTabBar,
                                    destinations: _getTabs(context)
                                        .map(
                                          (item) => NavigationRailDestination(
                                            icon: item.icon,
                                            label: Text(item.label).tr(),
                                          ),
                                        )
                                        .toList(),
                                    selectedIndex: activeIndex,
                                    onDestinationSelected: (index) {
                                      context.navigateTo(
                                        _getTabs(context)[index].route,
                                      );
                                    },
                                  ),
                                  Expanded(child: child),
                                ],
                              );
                            },
                          );
                        },
                      )
                    : BlocBuilder<UserBloc, UserState>(
                        buildWhen: (previous, current) => previous != current,
                        builder: (context, state) {
                          return Material(
                            color: Colors.white,
                            child: AutoTabsRouter.tabBar(
                              routes: _getTabs(context)
                                  .map((item) => item.route)
                                  .toList(),
                              builder: (context, child, tabController) =>
                                  Column(
                                children: [
                                  Expanded(
                                    child: TabBarView(
                                      controller: tabController,
                                      children: _getTabs(context)
                                          .map((item) => item.page)
                                          .toList(),
                                    ),
                                  ),
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
      Offset(offset.dx, offset.dy),
      Offset(cfg.size!.width + offset.dx, 0),
      paint,
    );
  }
}

List<RouteItem> _getTabs(BuildContext context) {
  // TODO : userCanCreateOrder is not ready yet
  // if (!context.read<UserBloc>().state.userCanCreateOrder) {
  //   return [
  //     homeTabRouteItem,
  //     productTabRouteItem,
  //     paymentsTabRouteItem,
  //     moreTabRouteItem,
  //   ];
  // }

  return [
    homeTabRouteItem,
    productTabRouteItem,
    ordersTabRouteItem,
    paymentsTabRouteItem,
    moreTabRouteItem,
  ];
}

const RouteItem homeTabRouteItem = RouteItem(
  route: HomeTabRoute(),
  page: HomeTab(),
  icon: Icon(
    Icons.home_outlined,
    key: WidgetKeys.homeTab,
  ),
  label: 'Home',
);

RouteItem productTabRouteItem = const RouteItem(
  route: ProductsTabRoute(),
  page: ProductsTab(),
  icon: Icon(
    Icons.storefront_outlined,
    key: WidgetKeys.productsTab,
  ),
  label: 'Products',
);

const RouteItem ordersTabRouteItem = RouteItem(
  route: OrdersTabRoute(),
  page: OrdersTab(),
  icon: Icon(
    Icons.article_outlined,
    key: WidgetKeys.ordersTab,
  ),
  label: 'Orders',
);

const RouteItem paymentsTabRouteItem = RouteItem(
  route: PaymentsTabRoute(),
  page: PaymentsTab(),
  icon: Icon(
    Icons.payments_outlined,
    key: WidgetKeys.paymentsTab,
  ),
  label: 'Payments',
);

const RouteItem moreTabRouteItem = RouteItem(
  route: MoreTabRoute(),
  page: MoreTab(),
  icon: Icon(
    Icons.reorder_outlined,
    key: WidgetKeys.moreTab,
  ),
  label: 'More',
);

class RouteItem {
  final PageRouteInfo<dynamic> route;
  final Widget page;
  final Icon icon;
  final String label;

  const RouteItem({
    required this.route,
    required this.page,
    required this.icon,
    required this.label,
  });
}
