import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/home/expansion_tiles/tile_card.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentsExpansionTile extends StatelessWidget {
  const PaymentsExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.salesOrgConfigs != current.salesOrgConfigs ||
          previous.user != current.user,
      builder: (context, state) {
        final tiles = [
          allInvoicesTile,
          allCreditsTile,
          paymentSummaryTile,
        ];

        return !state.user.role.type.isPaymentsAccessible
            ? const SizedBox.shrink()
            : custom.ExpansionTile(
                key: const Key('paymentsExpansionTile'),
                initiallyExpanded: true,
                title: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Payments'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                children: <Widget>[
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: (1 / .6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: tiles
                        .mapIndexed(
                          (index, e) => TileCard(
                            key: tiles[index].key,
                            homePageTile: tiles[index],
                          ),
                        )
                        .toList(),
                  ),
                ],
              );
      },
    );
  }
}

final allInvoicesTile = HomePageTile(
  key: const Key('allInvoicesTile'),
  title: 'All Invoices'.tr(),
  icon: Icons.description_outlined,
  routeName: 'payments/request_payment',
);
final allCreditsTile = HomePageTile(
  key: const Key('allCreditsTile'),
  title: 'All Credits'.tr(),
  icon: Icons.monetization_on_outlined,
  routeName: 'payments/approver_actions',
);
final paymentSummaryTile = HomePageTile(
  key: const Key('paymentSummaryTile'),
  title: 'Payment Summary'.tr(),
  icon: Icons.summarize_outlined,
  routeName: 'payments/payment_summary',
);
