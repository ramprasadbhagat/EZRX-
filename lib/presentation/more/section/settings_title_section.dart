import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(padding12),
      minVerticalPadding: 0,
      key: WidgetKeys.settingTile,
      title: Text(
        context.tr('Settings'),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: padding12),
        child: Column(
          children: _moreSettingTiles(context).map((item) {
            return ListTile(
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.zero,
              dense: true,
              key: item.key,
              onTap: item.onTap,
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: ZPColors.black,
                size: padding24,
              ),
              title: Text(
                item.label.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  List<MoreDetailsTile> _moreSettingTiles(BuildContext context) => [
        MoreDetailsTile.profile(context),
        MoreDetailsTile.security(context),
        if (context.read<EligibilityBloc>().state.isNotificationSettingsEnable)
          MoreDetailsTile.notifications(context),

        // MoreDetailsTile.privacy(), //  implement yet
      ];
}
