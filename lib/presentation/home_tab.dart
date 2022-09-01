import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeNavigationTabbar extends StatelessWidget {
  HomeNavigationTabbar({Key? key}) : super(key: key);

  final _routesItems = [
    RouteItem(
      route: const HomeTabRoute(),
      icon: const Icon(Icons.home_outlined, key: Key('homeTab')),
      label: 'Home'.tr(),
    ),
    RouteItem(
      route: const ProductsTabRoute(),
      icon: const Icon(Icons.storefront_outlined, key: Key('productsTab')),
      label: 'Products'.tr(),
    ),
    RouteItem(
      route: const OrdersTabRoute(),
      icon: const Icon(Icons.shopping_basket_outlined, key: Key('ordersTab')),
      label: 'Orders'.tr(),
    ),
    RouteItem(
      route: const NotificationsTabRoute(),
      icon: const Icon(
        Icons.notifications_outlined,
        key: Key('notificationsTabbar'),
      ),
      label: 'Notifications'.tr(),
    ),
    RouteItem(
      route: const AccountTabRoute(),
      icon: const Icon(Icons.person_outline, key: Key('accountTabbar')),
      label: 'Account'.tr(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizerUtil.deviceType == DeviceType.mobile
          ? AutoTabsScaffold(
              routes: _routesItems.map((item) => item.route).toList(),
              bottomNavigationBuilder: (_, tabsRouter) {
                return BottomNavigationBar(
                  key: const Key('homeTabbar'),
                  currentIndex: tabsRouter.activeIndex,
                  onTap: tabsRouter.setActiveIndex,
                  items: _routesItems
                      .map(
                        (item) => BottomNavigationBarItem(
                          icon: item.icon,
                          label: item.label,
                        ),
                      )
                      .toList(),
                );
              },
            )
          : AutoTabsRouter(
              routes: _routesItems.map((item) => item.route).toList(),
              builder: (context, child, animation) {
                var activeIndex = _routesItems.indexWhere(
                  (d) => context.tabsRouter.isRouteActive(d.route.routeName),
                );
                if (activeIndex == -1) {
                  activeIndex = 0;
                }
                return Row(
                  children: [
                    NavigationRail(
                      key: const Key('homeTabbar'),
                      destinations: _routesItems
                          .map(
                            (item) => NavigationRailDestination(
                              icon: item.icon,
                              label: Text(item.label),
                            ),
                          )
                          .toList(),
                      selectedIndex: activeIndex,
                      onDestinationSelected: (index) {
                        context.navigateTo(_routesItems[index].route);
                      },
                      labelType: NavigationRailLabelType.selected,
                    ),
                    Expanded(child: child),
                  ],
                );
              },
            ),
    );
  }
}

class RouteItem {
  final PageRouteInfo<dynamic> route;
  final Icon icon;
  final String label;

  RouteItem({
    required this.route,
    required this.icon,
    required this.label,
  });
}
