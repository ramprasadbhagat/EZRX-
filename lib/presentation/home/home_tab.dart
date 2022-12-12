import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/sales_org_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/shipping_address_selector.dart';
import 'package:ezrxmobile/presentation/orders/core/account_suspended_warning.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/ezrxlogo.png', height: 30),
        // SvgPicture.asset('assets/svg/ezrxlogo.svg', height: 30),
        automaticallyImplyLeading: false,
        actions: const [CartButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40.0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [
                SalesOrgSelector(key: ValueKey('HomeSalesOrgSelector')),
                CustomerCodeSelector(key: ValueKey('HomeCustomerCodeSelector')),
                ShipCodeSelector(key: ValueKey('HomeShipCodeSelector')),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<EligibilityBloc, EligibilityState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            final disableCreateOrder =
                context.read<UserBloc>().state.user.disableCreateOrder;

            return ListView(
              children: [
                const AccountSuspendedBanner(),
                const HomeBanner(
                  key: ValueKey('HomeBanner'),
                ),
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
                    BlocListener<CovidMaterialListBloc, CovidMaterialListState>(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      physics:
                          const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: (1 / .6),
                      children:
                          disableCreateOrder
                              ? []
                              : List.generate(
                                  homePageTiles.length,
                                  (index) {
                                    return Center(
                                      child: _TileCard(
                                        key: const Key('HomeTileCard'),
                                        homePageTile: homePageTiles[index],
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HomePageTile {
  const HomePageTile({
    required this.title,
    required this.icon,
    required this.routeName,
  });
  final String title;
  final IconData icon;
  final String routeName;
}

const List<HomePageTile> homePageTiles = <HomePageTile>[
  HomePageTile(
    title: 'Create Order',
    icon: Icons.add_box_outlined,
    routeName: 'material_list_page',
  ),
  HomePageTile(
    title: 'Saved Orders',
    icon: Icons.bookmark_border_outlined,
    routeName: 'saved_order_list',
  ),
  HomePageTile(
    title: 'Order Template',
    icon: Icons.featured_play_list_outlined,
    routeName: 'order_template_list_page',
  ),
];

class _TileCard extends StatelessWidget {
  const _TileCard({Key? key, required this.homePageTile}) : super(key: key);
  final HomePageTile homePageTile;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle2;

    return GestureDetector(
      onTap: () => context.router.pushNamed(homePageTile.routeName),
      child: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(
                  homePageTile.icon,
                  size: 30.0,
                  color: textStyle!.color,
                ),
              ),
              FittedBox(
                child: Text(
                  homePageTile.title,
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

// class _WelcomeUser extends StatelessWidget {
//   const _WelcomeUser({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<UserBloc, UserState>(
//       listenWhen: (previous, current) => previous.user != current.user,
//       listener: (context, state) {
//         state.userFailureOrSuccessOption.fold(
//           () {},
//           (either) => either.fold(
//             (failure) {
//               final failureMessage = failure.failureMessage;
//               showSnackBar(context: context, message: failureMessage.tr());
//               if (failureMessage == 'authentication failed') {
//                 context.read<AuthBloc>().add(const AuthEvent.logout());
//               }
//             },
//             (_) {},
//           ),
//         );
//       },
//       buildWhen: (previous, current) => previous.user != current.user,
//       builder: (context, state) {
//         return state.isNotEmpty
//             ? Text(
//                 state.userFullName.toString(),
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline6
//                     ?.apply(color: ZPColors.darkGray),
//               )
//             : LoadingShimmer.tile(line: 3);
//       },
//     );
//   }
// }
