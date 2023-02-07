import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
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
        String countlyTile;
        switch (homePageTile.routeName) {
          case 'material_list_page':
            countlyTile = 'Create Order';
            break;
          case 'saved_order_list':
            countlyTile = 'Saved Orders';
            break;
          case 'order_template_list_page':
            countlyTile = 'Order Template';
            break;
          case 'returns_overview':
            countlyTile = 'returns_overview';
            break;
          case 'request_return':
            countlyTile = 'request_return';
            break;
          case 'approver_actions':
            countlyTile = 'approver_actions';
            break;
          case 'return_summary':
            countlyTile = 'return_summary';
            break;
          case 'user_restriction':
            countlyTile = 'user_restriction';
            break;
          case 'policy_configuration':
            countlyTile = 'policy_configuration';
            break;
          default:
            countlyTile = '';
        }
        locator<CountlyService>().addCountlyEvent(countlyTile);
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
