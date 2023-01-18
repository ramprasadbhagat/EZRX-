import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/orders/cart/add_to_cart/cart_bottom_sheet.dart';
import 'package:ezrxmobile/presentation/orders/cart/cart_button.dart';
import 'package:ezrxmobile/presentation/core/tab_view.dart';
import 'package:ezrxmobile/presentation/orders/create_order/covid_material_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_bundle_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRoot extends StatelessWidget {
  const MaterialRoot({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EligibilityBloc, EligibilityState>(
      buildWhen: (previous, current) =>
          previous.isBundleMaterialEnable != current.isBundleMaterialEnable ||
          previous.isCovidMaterialEnable != current.isCovidMaterialEnable,
      builder: (context, state) {
        final isBundleMaterialEnable = state.isBundleMaterialEnable;
        final isCovidMaterialEnable = state.isCovidMaterialEnable;
        final length = 1 +
            (isBundleMaterialEnable ? 1 : 0) +
            (isCovidMaterialEnable ? 1 : 0);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: AppBar(
              title: const Text('Create Order').tr(),
              actions: const [CartButton()],
            ),
          ),
          body: length == 1
              ? const MaterialListPage(
                  addToCart: CartBottomSheet.showAddToCartBottomSheet,
                )
              : TabViewPage(
                  length: length,
                  tabHeaderText: [
                    'Material'.tr(),
                    if (isBundleMaterialEnable) 'Bundles'.tr(),
                    if (isCovidMaterialEnable) 'COVID-19'.tr(),
                  ],
                  tabWidgets: [
                    const MaterialListPage(
                      addToCart: CartBottomSheet.showAddToCartBottomSheet,
                    ),
                    if (isBundleMaterialEnable) const MaterialBundleListPage(),
                    if (isCovidMaterialEnable)
                      const CovidMaterialListPage(
                        addToCart: CartBottomSheet.showAddToCartBottomSheet,
                      ),
                  ],
                ),
        );
      },
    );
  }
}
