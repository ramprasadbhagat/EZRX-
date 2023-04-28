import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  const TileCard({Key? key, required this.homePageTile}) : super(key: key);
  final HomePageTile homePageTile;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;

    return GestureDetector(
      key: ValueKey(homePageTile.routeName),
      onTap: () {
        switch (homePageTile.routeName) {
          case 'orders/saved_order_list':
            trackMixpanelEvent(
              MixpanelEvents.savedOrder,
            );
            break;
          case 'orders/order_template_list':
            trackMixpanelEvent(
              MixpanelEvents.createOrderFromTemplate,
            );
            break;
        }
        context.router.pushNamed(homePageTile.routeName);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              homePageTile.icon,
              size: 30.0,
              color: textStyle!.color,
            ),
            FittedBox(
              child: Text(
                homePageTile.title,
                style: textStyle,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }
}
