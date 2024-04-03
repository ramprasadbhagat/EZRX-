import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/more/more_details_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocBuilder<EligibilityBloc, EligibilityState>(
        buildWhen: (previous, current) =>
            previous.isReturnsEnable != current.isReturnsEnable ||
            previous.isPaymentEnabled != current.isPaymentEnabled,
        builder: (context, state) {
          final items = _getServiceTabs(context, state);

          return GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.6,
              crossAxisSpacing: 12,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final item = items[index];

              return InkWell(
                key: item.key,
                onTap: item.onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: item.icon),
                    const SizedBox(height: 4),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          context.tr(item.label),
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: items.length,
          );
        },
      ),
    );
  }

  List<MoreDetailsTile> _getServiceTabs(
    BuildContext context,
    EligibilityState state,
  ) {
    return <MoreDetailsTile>[
      if (state.user.userCanAccessOrderHistory)
        MoreDetailsTile.orderTab(context),
      if (state.isReturnsEnable) MoreDetailsTile.returnsTab(context),
      if (state.isPaymentEnabled) ...[
        MoreDetailsTile.paymentsTab(context),
        if (state.marketPlaceEligible)
          MoreDetailsTile.marketplacePaymentsTab(context),
      ],
      if (state.isIDMarket) MoreDetailsTile.eZPointTab(context),
    ];
  }
}
