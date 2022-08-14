import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:flutter/material.dart';

class HomeNavigationTabbar extends StatelessWidget {
  const HomeNavigationTabbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AutoTabsScaffold(
        routes: const [
          HomeTabRoute(),
          ProductsTabRoute(),
          OrdersTabRoute(),
          NotificationsTabRoute(),
          AccountTabRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            key: const Key('homeTabbar'),
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home_outlined,
                  key: Key('homeTab'),
                ),
                label: 'Home'.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.storefront_outlined,
                  key: Key('productsTab'),
                ),
                label: 'Products'.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.shopping_basket_outlined,
                  key: Key('ordersTab'),
                ),
                label: 'Orders'.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.notifications_outlined,
                  key: Key('notificationsTabbar'),
                ),
                label: 'Notifications'.tr(),
              ),
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person_outline,
                  key: Key('accountTabbar'),
                ),
                label: 'Account'.tr(),
              ),
            ],
          );
        },
      ),
    );
  }
}
