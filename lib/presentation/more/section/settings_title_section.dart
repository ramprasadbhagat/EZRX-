import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: WidgetKeys.settingTile,
      title: Text(
        'Settings'.tr(),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Column(
        children: _moreSettingTiles(context).map((item) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            key: item.key,
            onTap: item.onTap,
            trailing: Icon(
              Icons.chevron_right_rounded,
              color: item.onTap == null ? ZPColors.lightGray : ZPColors.black,
            ),
            title: Text(
              item.label.tr(),
              style: item.onTap == null
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: ZPColors.lightGray)
                  : Theme.of(context).textTheme.bodySmall,
            ),
          );
        }).toList(),
      ),
    );
  }

  List<MoreDetailsTile> _moreSettingTiles(BuildContext context) => [
        MoreDetailsTile.profile(context),
        MoreDetailsTile.security(context),
        MoreDetailsTile.notifications(context),
        MoreDetailsTile.privacy(),
      ];
}
