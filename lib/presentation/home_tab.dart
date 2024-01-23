import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/intro/intro_bloc.dart';
import 'package:ezrxmobile/application/notification/notification_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/intro/intro_page.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigationTabbar extends StatelessWidget {
  const HomeNavigationTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.showTermsAndConditionDialog !=
          current.showTermsAndConditionDialog,
      builder: (context, state) {
        return state.showTermsAndConditionDialog
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
                                previous.user != current.user,
                            builder: (context, state) {
                              return _CustomTabBar(
                                routes: _getTabs(state),
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
  late TabController tabController = TabController(
    length: widget.routes.length,
    vsync: this,
  );
  late List<PageRouteInfo> _currentRoutes = widget.routes.routeList;
  late PageRouteInfo _currentPage = _currentRoutes.first;

  @override
  void didUpdateWidget(covariant _CustomTabBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.routes.routeList, widget.routes.routeList)) {
      tabController.dispose();
      tabController = TabController(
        length: widget.routes.length,
        vsync: this,
      );
    }
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _updatePageViewStack(TabsRouter tabsRouter) {
    if (listEquals(_currentRoutes, widget.routes.routeList)) return;
    _currentRoutes = widget.routes.routeList;
    var newIndex = _currentRoutes.indexWhere((e) => e == _currentPage);
    if (newIndex == -1) {
      newIndex = 0;
    }
    _currentPage = _currentRoutes[newIndex];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      tabsRouter.navigate(_currentPage);
      tabController.animateTo(newIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ZPColors.white,
      child: AutoTabsRouter.pageView(
        key: ValueKey(widget.routes.length),
        routes: widget.routes.routeList,
        builder: (context, child, _) {
          final tabsRouter = AutoTabsRouter.of(context);
          tabController.animateTo(tabsRouter.activeIndex);
          _updatePageViewStack(tabsRouter);

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
                    _currentPage = widget.routes.routeList[index];
                    tabsRouter.setActiveIndex(index);
                    trackMixpanelEvent(
                      MixpanelEvents.bottomNavBarClicked,
                      props: {
                        MixpanelProps.navTab: widget.routes[index].label,
                      },
                    );
                  },
                  labelStyle: Theme.of(context).textTheme.bodySmall,
                  padding: const EdgeInsets.only(top: 8.0),
                  labelPadding: EdgeInsets.zero,
                  tabs: widget.routes
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

List<RouteItem> _getTabs(EligibilityState state) {
  return [
    homeTabRouteItem,
    if (state.user.userCanAccessProducts) productTabRouteItem,
    if (state.user.userCanAccessOrderHistory) ordersTabRouteItem,
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

RouteItem notificationTabRouteItem = RouteItem(
  route: const NotificationTabRoute(),
  icon: BlocBuilder<NotificationBloc, NotificationState>(
    buildWhen: (previous, current) =>
        previous.notificationList.hasUnreadNotification !=
        current.notificationList.hasUnreadNotification,
    builder: (context, state) {
      return Stack(
        children: [
          const Icon(
            Icons.notifications_none_outlined,
            key: WidgetKeys.notificationTab,
          ),
          if (state.notificationList.hasUnreadNotification)
            Positioned(
              right: 3,
              top: 3,
              key: WidgetKeys.notificationBadge,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: ZPColors.orange,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      );
    },
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
  final Widget icon;
  final String label;

  const RouteItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}

extension RouteItemListExtension on List<RouteItem> {
  List<PageRouteInfo> get routeList => map((e) => e.route).toList();
}
