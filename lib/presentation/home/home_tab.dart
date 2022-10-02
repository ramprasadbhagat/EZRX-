import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/home/banners/banner.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            _SalesOrgSelector(),
            _CustomerCodeSelector(),
            _ShipCodeSelector(),
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
                      child: TileCard(homePageTile: homePageTiles[index]),
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
    icon: Icons.list,
    routeName: 'material_list_page',
  ),
  HomePageTile(
    title: 'Saved order',
    icon: Icons.list,
    routeName: 'saved_order_list',
  ),
];

class TileCard extends StatelessWidget {
  const TileCard({Key? key, required this.homePageTile}) : super(key: key);
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomSelector extends StatelessWidget {
  final String title;
  final Widget child;
  final Function()? onTap;
  const _CustomSelector({
    Key? key,
    required this.title,
    required this.child,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: key,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.apply(color: ZPColors.lightGray),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _SalesOrgSelector extends StatelessWidget {
  const _SalesOrgSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CustomSelector(
      key: const Key('salesOrgSelect'),
      title: 'Sales Org',
      child: BlocBuilder<SalesOrgBloc, SalesOrgState>(
        buildWhen: (previous, current) =>
            previous.salesOrganisation != current.salesOrganisation,
        builder: (context, state) {
          return state.salesOrganisation == SalesOrganisation.empty()
              ? LoadingShimmer.tile()
              : Text(
                  state.salesOrganisation.salesOrg.fullName,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                );
        },
      ),
      onTap: () => showPlatformDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => BlocBuilder<UserBloc, UserState>(
          buildWhen: (previous, current) =>
              previous.user.userSalesOrganisations !=
              current.user.userSalesOrganisations,
          builder: (context, state) {
            return PlatformAlertDialog(
              title: const Text('Please select a Sales Org').tr(),
              actions: state.user.userSalesOrganisations
                  .map(
                    (e) => PlatformDialogAction(
                      key: Key('salesOrgOption${e.salesOrg.getOrCrash()}'),
                      child: Text(e.salesOrg.fullName),
                      onPressed: () {
                        context.read<SalesOrgBloc>().add(
                              SalesOrgEvent.selected(salesOrganisation: e),
                            );
                        context.router.pop();
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}

class _CustomerCodeSelector extends StatelessWidget {
  const _CustomerCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CustomerCodeBloc, CustomerCodeState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(
                context: context,
                message: failureMessage.tr(),
              );
            },
            (_) {
              context.read<AuthBloc>().add(const AuthEvent.authCheck());
            },
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return _CustomSelector(
          key: const Key('customerCodeSelect'),
          title: 'Customer Code',
          onTap: state.isFetching
              ? null
              : () => context.router.pushNamed('customer_search_page'),
          child: state.isFetching
              ? LoadingShimmer.tile()
              : Text(
                  state.apiFailureOrSuccessOption.isNone()
                      ? state.customeCodeInfo.customerCodeSoldTo
                      : 'No Customer',
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                ).tr(),
        );
      },
    );
  }
}

class _ShipCodeSelector extends StatelessWidget {
  const _ShipCodeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerCodeBloc, CustomerCodeState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, customerCodeState) {
        return BlocBuilder<ShipToCodeBloc, ShipToCodeState>(
          buildWhen: (previous, current) =>
              previous.shipToInfo != current.shipToInfo,
          builder: (context, state) {
            return _CustomSelector(
              key: const Key('shipToCodeSelect'),
              title: 'Shipping Address',
              onTap: customerCodeState.isFetching
                  ? null
                  : () => showPlatformDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (_) => PlatformAlertDialog(
                          title: const Text('Please select a shipping address')
                              .tr(),
                          actions: customerCodeState.customeCodeInfo.shipToInfos
                              .map(
                                (shipToInfo) => PlatformDialogAction(
                                  key: Key(
                                    'shipToOption${shipToInfo.shipToCustomerCode}',
                                  ),
                                  child: Text(
                                    shipToInfo.shipToCustomerCode,
                                    style: TextStyle(
                                      fontWeight:
                                          shipToInfo.defaultShipToAddress
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                      color: shipToInfo.defaultShipToAddress
                                          ? ZPColors.secondary
                                          : Colors.blueAccent,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<ShipToCodeBloc>().add(
                                          ShipToCodeEvent.selected(
                                            shipToInfo: shipToInfo,
                                          ),
                                        );
                                    context.router.pop();
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
              child: customerCodeState.isFetching
                  ? LoadingShimmer.tile()
                  : Text(
                      customerCodeState.apiFailureOrSuccessOption.isNone()
                          ? state.shipToInfo.shipToCustomerCode
                          : 'No Shipping',
                      style: Theme.of(context).textTheme.subtitle2?.apply(
                            color: ZPColors.primary,
                          ),
                    ).tr(),
            );
          },
        );
      },
    );
  }
}
