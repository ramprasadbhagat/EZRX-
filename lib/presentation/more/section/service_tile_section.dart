import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
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
        childAspectRatio: 1.45,
        padding: const EdgeInsets.only(
          top: 18.0,
        ),
        shrinkWrap: true,
        children: _getServiceTabs(context).map((item) {
          return InkWell(
            key: item.key,
            onTap: item.onTap,
            child: Column(
              children: [
                item.icon,
                const SizedBox(height: 8),
                Text(
                  item.label.tr(),
                  style: item.onTap == null
                      ? item.labelStyle ??
                          Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ZPColors.lightGray)
                      : item.labelStyle ??
                          Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  List<MoreDetailsTile> _getServiceTabs(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return <MoreDetailsTile>[
      if (eligibilityState.user.userCanAccessOrderHistory)
        MoreDetailsTile.orderTab(context),
      if (eligibilityState.isReturnsEnable) MoreDetailsTile.returnsTab(context),
      if (!eligibilityState.salesOrgConfigs.disablePayment)
        MoreDetailsTile.paymentsTab(context),
      MoreDetailsTile.loyaltyTab(),
      MoreDetailsTile.webLoginTab(),
      MoreDetailsTile.announcementAndArticleTab(context),
    ];
  }
}
