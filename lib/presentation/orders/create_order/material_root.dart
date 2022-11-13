import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/add_to_cart/add_to_cart_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/role.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/price.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/tab_view.dart';
import 'package:ezrxmobile/presentation/orders/create_order/add_to_cart.dart';
import 'package:ezrxmobile/presentation/orders/create_order/covid_material_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_bundle_list.dart';
import 'package:ezrxmobile/presentation/orders/create_order/material_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialRoot extends StatelessWidget {
  const MaterialRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      buildWhen: (previous, current) =>
          previous.disableBundles != current.disableBundles ||
          previous.salesOrg != current.salesOrg,
      builder: (context, state) {
        final disableBundles = state.configs.disableBundles;
        final enableCovidMaterial = _canOrderCovidMaterial(
          customerCodeInfo:
              context.read<CustomerCodeBloc>().state.customerCodeInfo,
          salesOrganisation:
              context.read<SalesOrgBloc>().state.salesOrganisation,
          role: context.read<UserBloc>().state.user.role,
        );
        final length = (disableBundles ? 1 : 2) + (enableCovidMaterial ? 1 : 0);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: AppBar(
              title: const Text('Create Order').tr(),
              actions: const [CartButton()],
            ),
          ),
          body: length == 1
              ? MaterialListPage(addToCart: _showBottomSheet)
              : TabViewPage(
                  length: length,
                  tabHeaderText: [
                    'Material',
                    if (!disableBundles) 'Bundles',
                    if (enableCovidMaterial) 'COVID-19',
                  ],
                  tabWidgets: [
                    MaterialListPage(addToCart: _showBottomSheet),
                    if (!disableBundles) const MaterialBundleListPage(),
                    if (enableCovidMaterial)
                      CovidMaterialListPage(addToCart: _showBottomSheet),
                  ],
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

    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (_) {
        context.read<AddToCartBloc>().add(
              AddToCartEvent.setCartItem(
                PriceAggregate(
                  price: itemPrice ?? Price.empty(),
                  materialInfo: materialInfo,
                  salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
                  quantity: 1,
                  zmgMaterialCountOnCart:
                      context.read<CartBloc>().state.zmgMaterialCount,
                ),
              ),
            );

        return const AddToCart();
      },
    );
  }
}

// TODO: will revisit and make this better
bool _canOrderCovidMaterial({
  required CustomerCodeInfo customerCodeInfo,
  required SalesOrganisation salesOrganisation,
  required Role role,
}) {
  // 1. SG Covid tab
  // 2. Sample item
  // 3. PH Covid tab
  return (customerCodeInfo.customerAttr7.isZEV &&
          role.type.isClient &&
          salesOrganisation.salesOrg.isSg) ||
      customerCodeInfo.customerGrp4.canOrderCovidMaterial ||
      (role.type.isSalesRep && salesOrganisation.salesOrg.isPH);
}
