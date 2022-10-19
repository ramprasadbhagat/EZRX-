import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/presentation/core/tab_view.dart';
import 'package:ezrxmobile/presentation/create_order/material_bundle_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRoot extends StatelessWidget {
  const MaterialRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      buildWhen: (previous, current) =>
          previous.configs.disableBundles != current.configs.disableBundles,
      builder: (context, state) {
        final disableBundles =
            context.read<SalesOrgBloc>().state.configs.disableBundles;
        final length = disableBundles ? 1 : 2;
        final headerText =
            disableBundles ? ['Add Material'] : ['Add Material', 'Add Bundle'];
        final widgetList = disableBundles
            ? [const MaterialListPage()]
            : [
                const MaterialListPage(),
                const MaterialBundleListPage(),
              ];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: AppBar(
              title: const Text('Create Order').tr(),
              actions: [
                IconButton(
                  key: const Key('CartButton'),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ),
              ],
            ),
          ),
          body: TabViewPage(
            length: length,
            tabHeaderText: headerText,
            tabWidgets: widgetList,
          ),
        );
      },
    );
  }
}
