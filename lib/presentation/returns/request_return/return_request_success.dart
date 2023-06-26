import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class ReturnRequestSuccessPage extends StatelessWidget {
  const ReturnRequestSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Returns Confirmation').tr(),
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Thank You',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.apply(color: ZPColors.green),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Your request has been submitted successfully.You can check Returns Summary section for the status of requests',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: ZPColors.darkGray),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            key: const Key('gotToReturnsSummary'),
            onPressed: () {
              context.router.pushAndPopUntil(
                ReturnSummaryRoute(),
                predicate: (route) =>
                    route.settings.name == 'HomeNavigationTabbarRoute',
              );
            },
            child: const Text(
              'Go To Returns Summary',
            ),
          ),
        ],
      ),
    );
  }
}
