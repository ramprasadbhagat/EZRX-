import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationTabbar extends StatelessWidget {
  HomeNavigationTabbar({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
            : BlocBuilder<IntroBloc, IntroState>(
                buildWhen: (previous, current) =>
                    previous.isAppFirstLaunch != current.isAppFirstLaunch,
                builder: (context, state) {
                  return state.isAppFirstLaunch
                      ? const IntroPage()
                      : WillPopScope(
                          onWillPop: () async => false,
                          child: BlocBuilder<EligibilityBloc, EligibilityState>(
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              return _CustomTabBar(
                                routes: _getTabs(context),
                              );
                            },
                          ),
                        );
                },
              );
      },
    );
  }
}

class _CustomTabBar extends StatefulWidget {
  final List<RouteItem> routes;

  const _CustomTabBar({
    Key? key,
    required this.routes,
  }) : super(key: key);

  @override
  State<_CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<_CustomTabBar>
    with TickerProviderStateMixin {
  TabController? tabController;

  List<PageRouteInfo> _getRouteList(List<RouteItem> routes) =>
      routes.map((e) => e.route).toList();

  @override
  Widget build(BuildContext context) {
    final routerList = _getRouteList(widget.routes);
    tabController = TabController(
      length: widget.routes.length,
      vsync: this,
    );

    return Material(
      color: ZPColors.white,
      child: AutoTabsRouter.pageView(
        routes: routerList,
        builder: (context, child, _) {
          final tabsRouter = AutoTabsRouter.of(context);
          tabController?.animateTo(tabsRouter.activeIndex);

          return Column(
            children: [
              Expanded(child: child),
              SafeArea(
                bottom: true,
                top: false,
                child: TabBar(
                  controller: tabController,
                  key: WidgetKeys.homeTabBar,
                  indicator: _TopIndicator(),
                  onTap: (index) {
                    tabsRouter.setActiveIndex(index);
                    trackMixpanelEvent(
                      MixpanelEvents.bottomNavBarClicked,
                      props: {
                        MixpanelProps.navTab: widget.routes[index].label,
                      },
                    );
                  },
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
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
          );
        },
      ),
    );
  }
}

class _TopIndicator extends Decoration {
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
  return [
    homeTabRouteItem,
    if (context.read<EligibilityBloc>().state.user.userCanAccessProducts)
      productTabRouteItem,
    if (context.read<EligibilityBloc>().state.user.userCanAccessOrderHistory)
      ordersTabRouteItem,
    notificationTabRouteItem,
    moreTabRouteItem,
  ];
}

RouteItem homeTabRouteItem = const RouteItem(
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

RouteItem ordersTabRouteItem = const RouteItem(
  route: OrdersTabRoute(),
  icon: Icon(
    Icons.receipt_long_outlined,
    key: WidgetKeys.ordersTab,
  ),
  label: 'Orders',
);

RouteItem notificationTabRouteItem = const RouteItem(
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
    Icons.menu_outlined,
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
