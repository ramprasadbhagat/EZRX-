import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/home/expansion_tiles/tile_card.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
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
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          children: <Widget>[
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: (1 / .6),
              padding: const EdgeInsets.all(8.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: tiles
                  .mapIndexed(
                    (index, e) => Center(
                      child: TileCard(
                        key: tiles[index].key,
                        // key: const Key('ReturnsTileCard'),
                        homePageTile: tiles[index],
                      ),
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
    const overviewTile = HomePageTile(
      key: Key('overviewTile'),
      title: 'Overview',
      icon: Icons.space_dashboard_outlined,
      routeName: 'returns_overview',
    );
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

    if (roleType.isRootAdmin || roleType.isReturnAdmin) {
      return [
        overviewTile,
        requestReturnTile,
        approverActionsTile,
        returnSummaryTile,
        userRestrictionTile,
        policyConfigurationTile,
      ];
    } else if (roleType.isZPAdmin) {
      return [
        overviewTile,
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
        overviewTile,
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
