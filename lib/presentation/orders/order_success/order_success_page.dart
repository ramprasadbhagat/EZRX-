import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: const Key('orderSuccessKey'),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Order Confirmation').tr(),
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
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Your order has been received successfully',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: ZPColors.darkGray),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            key: const Key('createNewOrder'),
            onPressed: () {
              context.router.pushAndPopUntil(
                const MaterialRootRoute(),
                predicate: (route) =>
                    route.settings.name == 'HomeNavigationTabbarRoute',
              );
            },
            child: const Text(
              'Create New Order',
            ),
          ),
          ElevatedButton(
            key: const Key('goToOrderHistory'),
            onPressed: () {
              context.router.pushAndPopUntil(
                HomeNavigationTabbarRoute(
                  children: [
                    HistoryTabRoute(),
                  ],
                ),
                predicate: (route) =>
                    route.settings.name == 'HomeNavigationTabbarRoute',
              );
            },
            child: const Text(
              'Go To Order History',
            ),
          ),
        ],
      ),
    );
  }
}
