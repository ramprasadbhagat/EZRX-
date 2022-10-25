import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/cart_button.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/home/selector/customer_code_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/sales_org_selector.dart';
import 'package:ezrxmobile/presentation/home/selector/shipping_address_selector.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _WelcomeUser(),
                CartButton(),
              ],
            ),
            Row(
              children: const [
                SalesOrgSelector(),
                CustomerCodeSelector(),
                ShipCodeSelector(),
              ],
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const HomeBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                physics:
                    const NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: (1 / .6),
                children: List.generate(
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
          ],
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
              Text(
                homePageTile.title,
                style: textStyle,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}

class _WelcomeUser extends StatelessWidget {
  const _WelcomeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) => previous.user != current.user,
      listener: (context, state) {
        state.userFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(context: context, message: failureMessage.tr());
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return state.isNotEmpty
            ? Text(
                state.userFullName.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.apply(color: ZPColors.darkGray),
              )
            : LoadingShimmer.tile(line: 3);
      },
    );
  }
}
