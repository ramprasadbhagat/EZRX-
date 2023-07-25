import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({Key? key}) : super(key: key);

  List<MoreDetailsTile> get moreSettingTiles => [
        MoreDetailsTile.profile(),
        MoreDetailsTile.security(),
        MoreDetailsTile.notifications(),
        MoreDetailsTile.privacy(),
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
        childAspectRatio: 1.45,
        padding: const EdgeInsets.only(
          top: 18.0,
        ),
        shrinkWrap: true,
        children: moreSettingTiles.map((item) {
          return InkWell(
            onTap: item.onTap,
            child: Column(
              children: [
                item.icon,
                const SizedBox(height: 8),
                Text(
                  item.label.tr(),
                  style: item.onTap == null
                      ? Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ZPColors.lightGray)
                      : Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
