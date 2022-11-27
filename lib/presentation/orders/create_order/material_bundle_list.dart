import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/material_bundle_list/material_bundle_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price_detail/material_price_detail_bloc.dart';
import 'package:ezrxmobile/domain/core/aggregate/bundle_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/material_query_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialBundleListPage extends StatelessWidget {
  const MaterialBundleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MaterialBundleListBloc, MaterialBundleListState>(
      key: const Key('materialBundleListPage'),
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
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        return Column(
          children: [
            _BodyContent(
              state: state,
            ),
          ],
        );
      },
    );
  }
}

class _BodyContent extends StatelessWidget {
  final MaterialBundleListState state;
  const _BodyContent({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: state.isFetching && state.bundleList.isEmpty
          ? LoadingShimmer.withChild(
              child: Image.asset(
                'assets/images/ezrxlogo.png',
                key: const Key('loaderImage'),
                width: 80,
                height: 80,
              ),
            )
          : ScrollList<BundleAggregate>(
              emptyMessage: 'No bundle found',
              onRefresh: () {
                context
                    .read<MaterialPriceDetailBloc>()
                    .add(const MaterialPriceDetailEvent.initialized());
                context.read<MaterialBundleListBloc>().add(
                      MaterialBundleListEvent.fetch(
                        user: context.read<UserBloc>().state.user,
                        customerCode: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        shipToCode:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                      ),
                    );
              },
              onLoadingMore: () => context.read<MaterialBundleListBloc>().add(
                    MaterialBundleListEvent.fetch(
                      user: context.read<UserBloc>().state.user,
                      customerCode: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      shipToCode:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                    ),
                  ),
              isLoading: state.isFetching,
              itemBuilder: (context, index, item) =>
                  _ListContent(bundleAggregate: item),
              items: state.bundleList,
            ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final BundleAggregate bundleAggregate;
  const _ListContent({Key? key, required this.bundleAggregate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key(
          'materialBundleOption${bundleAggregate.bundle.bundleCode}',
        ),
        onTap: () {
          final materialQueryInfo = bundleAggregate.materialInfos
              .map(
                (item) => MaterialQueryInfo.fromBundles(
                  materialInfo: item,
                ),
              )
              .toList();
          context.read<MaterialPriceDetailBloc>().add(
                MaterialPriceDetailEvent.fetch(
                  user: context.read<UserBloc>().state.user,
                  customerCode:
                      context.read<CustomerCodeBloc>().state.customerCodeInfo,
                  salesOrganisation:
                      context.read<SalesOrgBloc>().state.salesOrganisation,
                  salesOrganisationConfigs:
                      context.read<SalesOrgBloc>().state.configs,
                  shipToCode: context.read<ShipToCodeBloc>().state.shipToInfo,
                  materialInfoList: materialQueryInfo,
                  pickAndPack:
                      context.read<EligibilityBloc>().state.getPNPValueMaterial,
                  skipFOCCheck: true,
                ),
              );
          context.router.push(
            BundleItemDetailPageRoute(
              bundleAggregate: bundleAggregate,
            ),
          );
        },
        // leading: ClipRRect(
        //   borderRadius: const BorderRadius.all(
        //     Radius.circular(8),
        //   ),
        //   child: SvgPicture.asset(
        //     _getImage(),
        //     fit: BoxFit.fill,
        //   ),
        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bundleAggregate.bundle.bundleCode.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              bundleAggregate.bundle.bundleName.name.toUpperCase(),
              style: Theme.of(context).textTheme.bodyText2,
            ),
            ...bundleAggregate.bundle
                .bundleInfoMessage()
                .map(
                  (e) => Text(
                    e,
                    style: Theme.of(context).textTheme.subtitle2?.apply(
                          color: ZPColors.lightGray,
                        ),
                  ),
                )
                .toList(),
            // ...bundle.bundleInformation
            //     .map(
            //       (e) => Text(
            //         _getOfferText(
            //           currency:
            //               context.read<SalesOrgBloc>().state.currency.code,
            //           quantity: e.quantity.toString(),
            //           rate: e.rate,
            //           type: e.type,
            //         ),
            //         style: Theme.of(context).textTheme.bodySmall,
            //       ),
            //     )
            //     .toList(),
          ],
        ),
      ),
    );
  }

  // String _getOfferText({
  //   final type,
  //   final quantity,
  //   final rate,
  //   final currency,
  // }) {
  //   final offer = type == '%'
  //       ? (quantity ?? 'NA') +
  //           ' ' +
  //           'or more' +
  //           ' ' +
  //           (rate.abs().toString()) +
  //           '%'
  //       : (quantity ?? 'NA') +
  //           ' ' +
  //           'or more' +
  //           ' ' +
  //           currency +
  //           (rate.toString());

  //   return 'Buy $offer';
  // }

  // String _getImage() {
  //   final imageList = [
  //     'p1_promo.svg',
  //     'p2_promo.svg',
  //     'p3_promo.svg',
  //     'p4_promo.svg',
  //   ];
  //   final random = Random();
  //   final imagePath =
  //       'assets/svg/${imageList[random.nextInt(imageList.length)]}';

  //   return imagePath;
  // }
}
