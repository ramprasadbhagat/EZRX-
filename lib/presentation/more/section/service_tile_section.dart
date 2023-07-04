import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({Key? key}) : super(key: key);

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
        children: _getServiceTabs(context).map((item) {
          return InkWell(
            onTap: item.onTap,
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

  List<MoreDetailsTile> _getServiceTabs(BuildContext context) {
    return context.read<UserBloc>().state.user.userCanAccessOrderHistory
        ? [
            MoreDetailsTile.orderTab(context),
            MoreDetailsTile.returnsTab(context),
            MoreDetailsTile.paymentsTab(context),
            MoreDetailsTile.loyaltyTab(),
            MoreDetailsTile.webLoginTab(),
          ]
        : [
            MoreDetailsTile.returnsTab(context),
            MoreDetailsTile.paymentsTab(context),
            MoreDetailsTile.loyaltyTab(),
            MoreDetailsTile.webLoginTab(),
          ];
  }
}
