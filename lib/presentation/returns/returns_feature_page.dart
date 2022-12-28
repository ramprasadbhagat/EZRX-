import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReturnsPage extends StatelessWidget {
  ReturnsPage({Key? key}) : super(key: key);

  final List<ReturnsPageTile> returnsPageTiles = <ReturnsPageTile>[
     const ReturnsPageTile(
      title: 'Overview',
      icon: Icons.add_box_outlined,
      routeName: 'returns_overview',
    ),
    const ReturnsPageTile(
      title: 'Request return',
      icon: Icons.add_box_outlined,
      routeName: 'request_return',
    ),
    const ReturnsPageTile(
      title: 'Approver actions',
      icon: Icons.add_box_outlined,
      routeName: 'approver_actions',
    ),
    const ReturnsPageTile(
      title: 'Return Summary',
      icon: Icons.add_box_outlined,
      routeName: 'return_summary',
    ),
  ];

  final List<ReturnsPageTile> adminTiles = <ReturnsPageTile>[
    const ReturnsPageTile(
      title: 'User Restriction',
      icon: Icons.add_box_outlined,
      routeName: 'user_restriction',
    ),
    const ReturnsPageTile(
      title: 'Policy Configuration',
      icon: Icons.add_box_outlined,
      routeName: 'policy_configuration',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('returns_screen');

    return Scaffold(
      appBar: AppBar(title: const Text('Returns').tr()),
      body: BlocBuilder<UserBloc, UserState>(
        buildWhen: (previous, current) => previous.user != current.user,
        builder: (context, state) {
          if (state.userHasReturnsAdminAccess) {
            returnsPageTiles.addAll(adminTiles);
          }

          return GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: (1 / .6),
            padding: const EdgeInsets.all(8.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              returnsPageTiles.length,
              (index) {
                return Center(
                  child: _TileCard(
                    key: const Key('ReturnsTileCard'),
                    returnsPageTile: returnsPageTiles[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ReturnsPageTile {
  const ReturnsPageTile({
    required this.title,
    required this.icon,
    required this.routeName,
  });

  final String title;
  final IconData icon;
  final String routeName;
}

class _TileCard extends StatelessWidget {
  const _TileCard({Key? key, required this.returnsPageTile}) : super(key: key);
  final ReturnsPageTile returnsPageTile;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle2;

    return GestureDetector(
      onTap: () => context.router.pushNamed(returnsPageTile.routeName),
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(
                  returnsPageTile.icon,
                  size: 30.0,
                  color: textStyle!.color,
                ),
              ),
              FittedBox(
                child: Text(
                  returnsPageTile.title,
                  style: textStyle,
                ).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
