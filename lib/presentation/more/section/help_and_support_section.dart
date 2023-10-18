import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HelpAndSupportTile extends StatelessWidget {
  const HelpAndSupportTile({Key? key}) : super(key: key);
  List<MoreDetailsTile> moreHelpAndSupportTiles(BuildContext context) =>
      <MoreDetailsTile>[
        MoreDetailsTile.faq(context),
        MoreDetailsTile.announcementAndArticleTab(context),
        MoreDetailsTile.userGuide(),
        MoreDetailsTile.aboutUs(context),
        MoreDetailsTile.chatSupport(context),
        MoreDetailsTile.termsOfUse(context),
        MoreDetailsTile.privacyPolicy(context),
        MoreDetailsTile.contactUs(context),
      ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        context.tr('Help & Support'),
        style: Theme.of(context).textTheme.labelMedium,
      ),
      subtitle: Column(
        children: moreHelpAndSupportTiles(context).map((item) {
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
              context.tr(item.label),
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
}
