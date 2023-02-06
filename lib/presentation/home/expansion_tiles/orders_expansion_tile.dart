import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
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
          previous.user.disableCreateOrder != current.user.disableCreateOrder,
      builder: (context, state) {
        final homePageTiles = _getHomePageTiles(state.userCanCreateOrder);

        return state.user.disableCreateOrder
            ? const SizedBox.shrink()
            : custom.ExpansionTile(
                initiallyExpanded: true,
                title: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Orders'.tr(),
                    style: Theme.of(context).textTheme.titleSmall,
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
                                    customerCode: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
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
                                    customerCode: context
                                        .read<CustomerCodeBloc>()
                                        .state
                                        .customerCodeInfo,
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
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: (1 / .6),
                      children: homePageTiles
                          .mapIndexed(
                            (index, e) => Center(
                              child: TileCard(
                                // key: const Key('HomeTileCard'),
                                homePageTile: homePageTiles[index],
                              ),
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
        const HomePageTile(
          title: 'Create Order',
          icon: Icons.add_box_outlined,
          routeName: 'material_list_page',
        ),
      const HomePageTile(
        title: 'Saved Orders',
        icon: Icons.bookmark_border_outlined,
        routeName: 'saved_order_list',
      ),
      const HomePageTile(
        title: 'Order Template',
        icon: Icons.featured_play_list_outlined,
        routeName: 'order_template_list_page',
      ),
    ];
  }
}
