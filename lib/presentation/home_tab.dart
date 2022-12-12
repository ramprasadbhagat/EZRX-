import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:ezrxmobile/presentation/aup_tc/aup_tc.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
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
                        ? BlocBuilder<UserBloc, UserState>(
                            buildWhen: (previous, current) => previous != current,
                            builder: (context, state) {
                              return AutoTabsScaffold(
                                lazyLoad: false,
                                routes: _getTabs(context)
                                    .map((item) => item.route)
                                    .toList(),
                                bottomNavigationBuilder: (_, tabsRouter) {
                                  return BottomNavigationBar(
                                    key: const Key('homeTabbar'),
                                    currentIndex: tabsRouter.activeIndex,
                                    onTap: tabsRouter.setActiveIndex,
                                    items: _getTabs(context)
                                        .map(
                                          (item) => BottomNavigationBarItem(
                                            icon: item.icon,
                                            label: item.label.tr(),
                                          ),
                                        )
                                        .toList(),
                                  );
                                },
                              );
                            },
                          )
                        : BlocBuilder<UserBloc, UserState>(
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
                                        key: const Key('homeTabbar'),
                                        destinations: _getTabs(context)
                                            .map(
                                              (item) =>
                                                  NavigationRailDestination(
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
                                        labelType:
                                            NavigationRailLabelType.selected,
                                      ),
                                      Expanded(child: child),
                                    ],
                                  );
                                },
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

List<RouteItem> _getTabs(BuildContext context) {
  final isDisableCreateOrder =
      context.read<UserBloc>().state.user.disableCreateOrder;
  if (isDisableCreateOrder) {
    return _routesItems
        .where((element) => element.label != 'Favourites')
        .toList();
  }
  
  return _routesItems;
}

final _routesItems = [
  RouteItem(
    route: const HomeTabRoute(),
    icon: const Icon(Icons.home_outlined, key: Key('homeTab')),
    label: 'Home',
  ),

  RouteItem(
    route: HistoryTabRoute(),
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
