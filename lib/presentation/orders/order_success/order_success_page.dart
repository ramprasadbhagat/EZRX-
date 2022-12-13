import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/infrastructure/core/countly/countly.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator<CountlyService>().recordCountlyView('Thank you screen');
    
    return Scaffold(
      key: const Key('orderSuccessKey'),
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              context.router.popUntilRouteWithName('MaterialRootRoute');
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text('Order Confirmation').tr(),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Thank You',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Your order has been received successfully',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  locator<CountlyService>()
                      .addCountlyEvent('thankyou_to_create');
                  context.router.popUntilRouteWithName('MaterialRootRoute');
                },
                child: Text(
                  'Create New Order',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  locator<CountlyService>()
                      .addCountlyEvent('order_history', segmentation: {
                    'pageSource': 'Successful Order Page',
                    'selectedSalesOrg': context
                        .read<SalesOrgBloc>()
                        .state
                        .salesOrganisation
                        .salesOrg
                        .getOrDefaultValue(''),
                    'selectedCustomerCode': context
                        .read<CustomerCodeBloc>()
                        .state
                        .customerCodeInfo
                        .customerCodeSoldTo,
                    'selectedShipToAddress': context
                        .read<ShipToCodeBloc>()
                        .state
                        .shipToInfo
                        .shipToCustomerCode,
                  });
                  context.router.pushAndPopUntil(
                    HomeNavigationTabbarRoute(
                      children: [
                        HistoryTabRoute(),
                      ],
                    ),
                    predicate: (route) =>
                        route.settings.name == 'HomeNavigationTabbarRoute',
                  );
                  locator<CountlyService>()
                      .addCountlyEvent('thankyou_to_history');
                },
                child: Text(
                  'Go To Order History',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ZPColors.white,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
