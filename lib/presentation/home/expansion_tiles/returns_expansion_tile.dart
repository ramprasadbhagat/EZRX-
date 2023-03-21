import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/returns/approver_actions/filter/return_approver_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/return_summary_filter/return_summary_filter_bloc.dart';
import 'package:ezrxmobile/application/returns/returns_overview/returns_overview_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/returns/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/home/expansion_tiles/tile_card.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnsExpansionTile extends StatelessWidget {
  const ReturnsExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.salesOrgConfigs != current.salesOrgConfigs ||
          previous.user != current.user,
      builder: (context, state) {
        if (!state.isReturnsEnable || state == EligibilityState.initial()) {
          return const SizedBox.shrink();
        }

        final tiles = loadReturnsPageTiles(
          context.read<UserBloc>().state.user.role.type,
        );

        return custom.ExpansionTile(
          initiallyExpanded: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Returns'.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          children: <Widget>[
            const _ReturnsOverviewQuantities(),
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: (1 / .6),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: tiles
                  .mapIndexed(
                    (index, e) => TileCard(
                      key: tiles[index].key,
                      // key: const Key('ReturnsTileCard'),
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

  List<HomePageTile> loadReturnsPageTiles(RoleType roleType) {
    if (roleType.isRootAdmin || roleType.isReturnAdmin) {
      return [
        requestReturnTile,
        approverActionsTile,
        returnSummaryTile,
        userRestrictionTile,
        policyConfigurationTile,
      ];
    } else if (roleType.isZPAdmin) {
      return [
        requestReturnTile,
        returnSummaryTile,
        userRestrictionTile,
        policyConfigurationTile,
      ];
    } else if (roleType.isClientAdmin || roleType.isZpAdminAttachments) {
      return [
        requestReturnTile,
        returnSummaryTile,
      ];
    } else if (roleType.isClientUser ||
        roleType.isSalesRep ||
        roleType.isReturnRequestor) {
      return [
        requestReturnTile,
        returnSummaryTile,
      ];
    } else if (roleType.isReturnApprover) {
      return [
        requestReturnTile,
        approverActionsTile,
        returnSummaryTile,
      ];
    }

    return [];
  }
}

class _ReturnsOverviewQuantities extends StatelessWidget {
  const _ReturnsOverviewQuantities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roleType = context.read<UserBloc>().state.user.role.type;

    return (roleType.isReturnsOverviewAccessible)
        ? BlocBuilder<ReturnsOverviewBloc, ReturnsOverviewState>(
            buildWhen: (previous, current) =>
                previous.returnRequestsOverview !=
                current.returnRequestsOverview,
            builder: (context, state) {
              return Card(
                margin: const EdgeInsets.fromLTRB(12, 4, 12, 0),
                child: Row(
                  children: [
                    _RequestQuantity(
                      quantity: state.returnRequestsOverview.requestSubmitted,
                      text: 'Submitted Requests',
                      onTap: () {
                        context.read<ReturnSummaryFilterBloc>().add(
                              ReturnSummaryFilterEvent.sortByChanged(
                                sortBy: ReturnSummaryStatus('Active'),
                              ),
                            );
                        context.router.push(
                          ReturnSummaryRoute(),
                        );
                      },
                      isPendingApproval: false,
                    ),
                    _RequestQuantity(
                      quantity: state.returnRequestsOverview.requestRejected,
                      text: 'Completed Requests',
                      onTap: () {
                        context.read<ReturnSummaryFilterBloc>().add(
                              ReturnSummaryFilterEvent.sortByChanged(
                                sortBy: ReturnSummaryStatus('Completed'),
                              ),
                            );
                        context.router.push(
                          ReturnSummaryRoute(),
                        );
                      },
                      isPendingApproval: false,
                    ),
                    _RequestQuantity(
                      quantity:
                          state.returnRequestsOverview.requestPendingApproval,
                      text: 'Active Requests',
                      onTap: () {
                        context.read<ReturnSummaryFilterBloc>().add(
                              ReturnSummaryFilterEvent.sortByChanged(
                                sortBy: ReturnSummaryStatus('Active'),
                              ),
                            );
                        context.router.push(
                          ReturnSummaryRoute(),
                        );
                      },
                      isPendingApproval: false,
                    ),
                    _RequestQuantity(
                      quantity: state.returnRequestsOverview.requestForApproval,
                      text: 'Pending Approvals',
                      onTap: () {
                        context.read<ReturnApproverFilterBloc>().add(
                              ReturnApproverFilterEvent.sortByChanged(
                                FilterStatus('PENDING'),
                              ),
                            );
                        context.router.push(
                          ApproverActionsRoute(),
                        );
                      },
                      isPendingApproval: true,
                    ),
                  ],
                ),
              );
            },
          )
        : const SizedBox.shrink();
  }
}

class _RequestQuantity extends StatelessWidget {
  final int quantity;
  final String text;
  final bool isPendingApproval;
  final VoidCallback onTap;
  const _RequestQuantity({
    Key? key,
    required this.quantity,
    required this.text,
    required this.isPendingApproval,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isPendingApproval
                      ? ZPColors.lightRed
                      : ZPColors.secondaryBGColor,
                ),
                alignment: Alignment.center,
                child: Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Text(
              text.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}

const requestReturnTile = HomePageTile(
  key: Key('requestReturnTile'),
  title: 'Request return',
  icon: Icons.pending_actions_outlined,
  routeName: 'request_return',
);
const approverActionsTile = HomePageTile(
  key: Key('approverActionsTile'),
  title: 'Approver actions',
  icon: Icons.rule_outlined,
  routeName: 'approver_actions',
);
const returnSummaryTile = HomePageTile(
  key: Key('returnSummaryTile'),
  title: 'Return Summary',
  icon: Icons.summarize_outlined,
  routeName: 'return_summary',
);
const userRestrictionTile = HomePageTile(
  key: Key('userRestrictionTile'),
  title: 'User Restriction',
  icon: Icons.admin_panel_settings_outlined,
  routeName: 'user_restriction',
);
const policyConfigurationTile = HomePageTile(
  key: Key('policyConfigurationTile'),
  title: 'Policy Configuration',
  icon: Icons.policy_outlined,
  routeName: 'policy_configuration',
);
