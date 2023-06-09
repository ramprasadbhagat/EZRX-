import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/more/more_tile_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsTile extends StatelessWidget {
  SettingsTile({Key? key}) : super(key: key);

  final List<MoreDetailsTile> moreSettingTiles = [
    const MoreDetailsTile(
      icon: Icon(
        Icons.perm_identity_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Account',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.https_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Security',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.notifications_none_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Notifications',
      route: NotificationSettingsPageRoute(),
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.security_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Privacy',
      route: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Settings'.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        padding: const EdgeInsets.only(
          top: 18.0,
        ),
        shrinkWrap: true,
        children: moreSettingTiles.map((item) {
          return InkWell(
            onTap: () {
              //TODO : will remove this condition when all the routes are created
              if (item.route != null) {
                context.navigateTo(item.route!);
              }
            },
            child: Column(
              children: [
                item.icon,
                const SizedBox(height: 8),
                Text(
                  item.label,
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
