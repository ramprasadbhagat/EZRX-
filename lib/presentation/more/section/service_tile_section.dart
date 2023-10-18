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
      dense: true,
      subtitle: BlocBuilder<EligibilityBloc, EligibilityState>(
        buildWhen: (previous, current) =>
            previous.isReturnsEnable != current.isReturnsEnable ||
            previous.isPaymentEnabled != current.isPaymentEnabled,
        builder: (context, state) {
          return GridView.count(
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
                      context.tr(item.label),
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
          );
        },
      ),
    );
  }

  List<MoreDetailsTile> _getServiceTabs(BuildContext context) {
    final eligibilityState = context.read<EligibilityBloc>().state;

    return <MoreDetailsTile>[
      if (eligibilityState.user.userCanAccessOrderHistory)
        MoreDetailsTile.orderTab(context),
      if (eligibilityState.isReturnsEnable) MoreDetailsTile.returnsTab(context),
      if (eligibilityState.isPaymentEnabled)
        MoreDetailsTile.paymentsTab(context),
      MoreDetailsTile.loyaltyTab(),
    ];
  }
}
