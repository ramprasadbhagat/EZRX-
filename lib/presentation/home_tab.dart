import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/aup_tc/aup_tc_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
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
                            buildWhen: (previous, current) =>
                                previous != current,
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
                                    onTap: (index) {
                                      _trackEvents(
                                        context: context,
                                        index: index,
                                      );

                                      tabsRouter.setActiveIndex(index);
                                    },
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
                            buildWhen: (previous, current) =>
                                previous != current,
                            builder: (context, state) {
                              return AutoTabsRouter(
                                lazyLoad: false,
                                routes: _getTabs(context)
                                    .map((item) => item.route)
                                    .toList(),
                                builder: (context, child, animation) {
                                  var activeIndex =
                                      _getTabs(context).indexWhere(
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
                                          _trackEvents(
                                            context: context,
                                            index: index,
                                          );

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

  void _trackEvents({
    required BuildContext context,
    required int index,
  }) {
    if (context.read<UserBloc>().state.userCanCreateOrder) {
      switch (index) {
        case 0:
          trackMixpanelEvent(
            MixpanelEvents.pageViewVisited,
            props: {
              MixpanelProps.pageViewName: 'home-page',
            },
          );
          break;
        case 1:
          trackMixpanelEvent(
            MixpanelEvents.orderHistory,
          );
          break;
        case 2:
          trackMixpanelEvent(
            MixpanelEvents.pageViewVisited,
            props: {
              MixpanelProps.pageViewName: 'favourites-page',
            },
          );
          break;
        case 3:
          trackMixpanelEvent(
            MixpanelEvents.pageViewVisited,
            props: {
              MixpanelProps.pageViewName: 'account-page',
            },
          );
          break;
        default:
      }
    } else {
      trackMixpanelEvent(
        MixpanelEvents.pageViewVisited,
        props: {
          MixpanelProps.pageViewName: index == 0 ? 'home-page' : 'account-page',
        },
      );
    }
  }
}

List<RouteItem> _getTabs(BuildContext context) {
  if (!context.read<UserBloc>().state.userCanCreateOrder) {
    return [
      homeTabRouteItem,
      accountTabRouteItem,
    ];
  }

  return [
    homeTabRouteItem,
    historyTabRouteItem,
    favouritesTabRouteItem,
    accountTabRouteItem,
  ];
}

const RouteItem homeTabRouteItem = RouteItem(
  route: HomeTabRoute(),
  icon: Icon(
    Icons.home_outlined,
    key: Key('homeTab'),
  ),
  label: 'Home',
);

RouteItem historyTabRouteItem = RouteItem(
  route: HistoryTabRoute(),
  icon: const Icon(
    Icons.fact_check_outlined,
    key: Key('historyTab'),
  ),
  label: 'History',
);

const RouteItem favouritesTabRouteItem = RouteItem(
  route: FavouritesTabRoute(),
  icon: Icon(
    Icons.favorite_border_outlined,
    key: Key('favoritesTab'),
  ),
  label: 'Favourites',
);

const RouteItem accountTabRouteItem = RouteItem(
  route: AccountTabRoute(),
  icon: Icon(
    Icons.person_outline,
    key: Key('accountTabbar'),
  ),
  label: 'Account',
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
