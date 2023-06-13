import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/more/more_tile_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class HelpAndSupportTile extends StatelessWidget {
  HelpAndSupportTile({Key? key}) : super(key: key);

  final List<MoreDetailsTile> moreHelpAndSupportTiles = [
    const MoreDetailsTile(
      icon: Icon(
        Icons.contact_support_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'FAQ',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.menu_book_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'User guide',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.error_outline_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'About us',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.support_agent_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Chart support',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.feed_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'Terms of use',
      route: AupTCDialogRoute(),
    ),
    MoreDetailsTile(
      icon: const Icon(
        Icons.policy_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'Privacy policy',
      route: WebViewPageRoute(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Help & Support'.tr(),
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
        children: moreHelpAndSupportTiles.map((item) {
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
