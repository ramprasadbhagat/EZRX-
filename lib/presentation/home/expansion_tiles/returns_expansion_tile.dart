import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/presentation/home/expansion_tiles/tile_card.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class ReturnsExpansionTile extends StatelessWidget {
  ReturnsExpansionTile({Key? key}) : super(key: key);

  final List<HomePageTile> _returnsPageTiles = <HomePageTile>[
    const HomePageTile(
      title: 'Overview',
      icon: Icons.space_dashboard_outlined,
      routeName: 'returns_overview',
    ),
    const HomePageTile(
      title: 'Request return',
      icon: Icons.pending_actions_outlined,
      routeName: 'request_return',
    ),
    const HomePageTile(
      title: 'Approver actions',
      icon: Icons.rule_outlined,
      routeName: 'approver_actions',
    ),
    const HomePageTile(
      title: 'Return Summary',
      icon: Icons.summarize_outlined,
      routeName: 'return_summary',
    ),
  ];

  final List<HomePageTile> _adminTiles = <HomePageTile>[
    const HomePageTile(
      title: 'User Restriction',
      icon: Icons.admin_panel_settings_outlined,
      routeName: 'user_restriction',
    ),
    const HomePageTile(
      title: 'Policy Configuration',
      icon: Icons.policy_outlined,
      routeName: 'policy_configuration',
    ),
  ];

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

        final tiles = context.read<UserBloc>().state.userHasReturnsAdminAccess
            ? [..._returnsPageTiles, ..._adminTiles]
            : _returnsPageTiles;

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
}
