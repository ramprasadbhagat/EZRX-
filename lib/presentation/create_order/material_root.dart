import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/tab_view.dart';
import 'package:ezrxmobile/presentation/create_order/add_to_cart.dart';
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
          previous.disableBundles != current.disableBundles,
      builder: (context, state) {
        final disableBundles =
            context.read<SalesOrgBloc>().state.disableBundles;
        final length = disableBundles ? 1 : 2;
        final headerText =
            disableBundles ? ['Add Material'] : ['Add Material', 'Add Bundle'];
        final widgetList = disableBundles
            ? [
                MaterialListPage(
                  addToCart: _showBottomSheet,
                ),
              ]
            : [
                MaterialListPage(
                  addToCart: _showBottomSheet,
                ),
                const MaterialBundleListPage(),
              ];

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: AppBar(
              title: const Text('Create Order').tr(),
              actions: const [CartButton()],
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

  void _showBottomSheet({
    required BuildContext context,
    required MaterialInfo materialInfo,
  }) {
    final itemPrice = context
        .read<MaterialPriceBloc>()
        .state
        .materialPrice[materialInfo.materialNumber];
    final unitPrice = itemPrice != null
        ? itemPrice.finalPrice.displayWithCurrency(
            currency: context.read<SalesOrgBloc>().state.configs.currency,
            hidePrice: materialInfo.hidePrice,
          )
        : 'NA';
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (builderContext) {
        return AddToCart(
          materialInfo: materialInfo,
          unitPrice: unitPrice,
        );
      },
    );
  }
}
