import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_expansion_tile.dart'
    as custom;
import 'package:ezrxmobile/presentation/home/expansion_tiles/tile_card.dart';
import 'package:ezrxmobile/presentation/home/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersExpansionTile extends StatelessWidget {
  const OrdersExpansionTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.user != current.user ||
          previous.userCanCreateOrder != current.userCanCreateOrder,
      builder: (context, state) {
        final homePageTiles = _getHomePageTiles(state.userCanCreateOrder);

        return !state.userCanCreateOrder
            ? const SizedBox.shrink()
            : custom.ExpansionTile(
                key: const Key('orderExpansionTile'),
                initiallyExpanded: true,
                title: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Orders'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                children: <Widget>[
                  MultiBlocListener(
                    listeners: [
                      BlocListener<MaterialListBloc, MaterialListState>(
                        listenWhen: (previous, current) =>
                            previous.nextPageIndex != current.nextPageIndex,
                        listener: (context, state) {
                          if (state.materialList.isNotEmpty) {
                            context.read<MaterialPriceBloc>().add(
                                  MaterialPriceEvent.fetch(
                                    salesOrganisation: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .salesOrganisation,
                                    salesConfigs: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    customerCodeInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
                                    shipToInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .shipToInfo,
                                    comboDealEligible: context
                                        .read<EligibilityBloc>()
                                        .state
                                        .comboDealEligible,
                                    materials: state.materialList,
                                  ),
                                );
                          }
                        },
                      ),
                      BlocListener<CovidMaterialListBloc,
                          CovidMaterialListState>(
                        listenWhen: (previous, current) =>
                            previous.nextPageIndex != current.nextPageIndex,
                        listener: (context, state) {
                          if (state.materialList.isNotEmpty) {
                            context.read<MaterialPriceBloc>().add(
                                  MaterialPriceEvent.fetch(
                                    salesOrganisation: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .salesOrganisation,
                                    salesConfigs: context
                                        .read<SalesOrgBloc>()
                                        .state
                                        .configs,
                                    customerCodeInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
                                    shipToInfo: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .shipToInfo,
                                    comboDealEligible: context
                                        .read<EligibilityBloc>()
                                        .state
                                        .comboDealEligible,
                                    materials: state.materialList,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(8.0),
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: (1 / .6),
                      children: homePageTiles
                          .mapIndexed(
                            (index, e) => TileCard(
                              // key: const Key('HomeTileCard'),
                              homePageTile: homePageTiles[index],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              );
      },
    );
  }

  List<HomePageTile> _getHomePageTiles(bool userCanCreateOrder) {
    return <HomePageTile>[
      if (userCanCreateOrder)
        HomePageTile(
          title: 'Create Order'.tr(),
          icon: Icons.add_box_outlined,
          routeName: 'material_root',
        ),
      HomePageTile(
        title: 'Saved Orders'.tr(),
        icon: Icons.bookmark_border_outlined,
        routeName: 'orders/saved_order_list',
      ),
      HomePageTile(
        title: 'Order Template'.tr(),
        icon: Icons.featured_play_list_outlined,
        routeName: 'orders/order_template_list',
      ),
    ];
  }
}
