import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';

class HomeNavigationTabbar extends StatelessWidget {
  const HomeNavigationTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AupTcBloc, AupTcState>(
      buildWhen: (previous, current) =>
          previous.showTermsAndConditon != current.showTermsAndConditon,
      builder: (context, state) {
        return state.showTermsAndConditon
            ? const AupTCDialog(
                key: ValueKey('auptcscreen'),
              )
            : WillPopScope(
                onWillPop: () async => false,
                child: Stack(
                  children: [
                    SizerUtil.deviceType == DeviceType.mobile
                        ? AutoTabsScaffold(
                            routes:
                                _routesItems.map((item) => item.route).toList(),
                            bottomNavigationBuilder: (_, tabsRouter) {
                              return BottomNavigationBar(
                                key: const Key('homeTabbar'),
                                currentIndex: tabsRouter.activeIndex,
                                onTap: tabsRouter.setActiveIndex,
                                items: _routesItems
                                    .map(
                                      (item) => BottomNavigationBarItem(
                                        icon: item.icon,
                                        label: item.label.tr(),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          )
                        : AutoTabsRouter(
                            routes:
                                _routesItems.map((item) => item.route).toList(),
                            builder: (context, child, animation) {
                              var activeIndex = _routesItems.indexWhere(
                                (d) => context.tabsRouter
                                    .isRouteActive(d.route.routeName),
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
                                            label: Text(item.label).tr(),
                                          ),
                                        )
                                        .toList(),
                                    selectedIndex: activeIndex,
                                    onDestinationSelected: (index) {
                                      context.navigateTo(
                                        _routesItems[index].route,
                                      );
                                    },
                                    labelType: NavigationRailLabelType.selected,
                                  ),
                                  Expanded(child: child),
                                ],
                              );
                            },
                          ),
                    const AnnouncementWidget(),
                  ],
                ),
              );
      },
    );
  }
}

final _routesItems = [
  RouteItem(
    route: const HomeTabRoute(),
    icon: const Icon(Icons.home_outlined, key: Key('homeTab')),
    label: 'Home',
  ),

  RouteItem(
    route: const HistoryTabRoute(),
    icon: const Icon(Icons.shopping_basket_outlined, key: Key('historyTab')),
    label: 'History',
  ),
  RouteItem(
    route: const FavouritesTabRoute(),
    icon: const Icon(Icons.favorite_border_outlined, key: Key('favoritesTab')),
    label: 'Favourites',
  ),
  // RouteItem(
  //   route: const ProductsTabRoute(),
  //   icon: const Icon(Icons.storefront_outlined, key: Key('productsTab')),
  //   label: 'Products',
  // ),
  // RouteItem(
  //   route: const OrdersTabRoute(),
  //   icon: const Icon(Icons.shopping_basket_outlined, key: Key('ordersTab')),
  //   label: 'Orders',
  // ),
  // RouteItem(
  //   route: const NotificationsTabRoute(),
  //   icon: const Icon(
  //     Icons.notifications_outlined,
  //     key: Key('notificationsTabbar'),
  //   ),
  //   label: 'Notifications',
  // ),
  RouteItem(
    route: const AccountTabRoute(),
    icon: const Icon(Icons.person_outline, key: Key('accountTabbar')),
    label: 'Account',
  ),
];

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
