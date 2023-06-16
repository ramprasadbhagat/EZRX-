import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/more/more_tile_details.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class ServiceTile extends StatelessWidget {
  ServiceTile({Key? key}) : super(key: key);

  final List<MoreDetailsTile> moreServiceTiles = [
    MoreDetailsTile(
      icon: const Icon(
        Icons.receipt_long_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Orders',
      route: OrdersTabRoute(),
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons
            .assignment_return_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'Returns',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons.volunteer_activism_outlined,
        color: ZPColors.greenIconColor,
      ),
      label: 'Payments',
      route: PaymentsTabRoute(),
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons
            .discount_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'Loyalty',
      route: null,
    ),
    const MoreDetailsTile(
      icon: Icon(
        Icons
            .center_focus_weak_outlined, //TODO : will update it after Design Them update the Figma
        color: ZPColors.greenIconColor,
      ),
      label: 'Web Login',
      route: null,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Services'.tr(),
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
        children: moreServiceTiles.map((item) {
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
