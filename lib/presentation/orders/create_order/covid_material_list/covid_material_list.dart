import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/combo_deal.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/stock_info.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/infrastructure/core/common/mixpanel_helper.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_events.dart';
import 'package:ezrxmobile/infrastructure/core/mixpanel/mixpanel_properties.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/core/custom_small_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/covid_material_list/covid_material_list_search_bar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidMaterialListPage extends StatelessWidget {
  final Function addToCart;

  const CovidMaterialListPage({
    Key? key,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    trackMixpanelEvent(
      MixpanelEvents.pageViewVisited,
      props: {
        MixpanelProps.pageViewName: runtimeType.toString(),
      },
    );

    return Scaffold(
      key: const Key('covidmaterialListPage'),
      body: BlocConsumer<CovidMaterialListBloc, CovidMaterialListState>(
        listenWhen: (previous, current) =>
            previous.apiFailureOrSuccessOption !=
            current.apiFailureOrSuccessOption,
        listener: (context, state) {
          state.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) {
                ErrorUtils.handleApiFailure(context, failure);
              },
              (_) {},
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.materialList != current.materialList,
        builder: (context, state) {
          return Column(
            children: [
              const CovidMaterialListSearchBar(),
              _BodyContent(
                covidMaterialListState: state,
                addToCart: addToCart,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final CovidMaterialListState covidMaterialListState;
  final Function addToCart;
  const _BodyContent({
    Key? key,
    required this.covidMaterialListState,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: covidMaterialListState.isFetching &&
              covidMaterialListState.materialList.isEmpty
          ? LoadingShimmer.logo(key: const Key('loaderImage'))
          : ScrollList<MaterialInfo>(
              emptyMessage: 'There are no vaccine in this customer code'.tr(),
              onRefresh: () {
                context.read<CovidMaterialListBloc>().add(
                      const CovidMaterialListEvent.updateSearchKey(
                        searchKey: '',
                      ),
                    );
                context.read<CovidMaterialListBloc>().add(
                      CovidMaterialListEvent.fetch(
                        user: context.read<UserBloc>().state.user,
                        salesOrganisation: context
                            .read<SalesOrgBloc>()
                            .state
                            .salesOrganisation,
                        configs: context.read<SalesOrgBloc>().state.configs,
                        customerCodeInfo: context
                            .read<CustomerCodeBloc>()
                            .state
                            .customerCodeInfo,
                        shipToInfo:
                            context.read<ShipToCodeBloc>().state.shipToInfo,
                        pickAndPack: context
                            .read<EligibilityBloc>()
                            .state
                            .getPNPValueCovidMaterial,
                      ),
                    );
              },
              onLoadingMore: () => context.read<CovidMaterialListBloc>().add(
                    CovidMaterialListEvent.loadMore(
                      user: context.read<UserBloc>().state.user,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<ShipToCodeBloc>().state.shipToInfo,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueCovidMaterial,
                    ),
                  ),
              isLoading: covidMaterialListState.isFetching,
              itemBuilder: (context, index, item) {
                final salesOrgConfigs =
                    context.read<SalesOrgBloc>().state.configs;

                return _ListContent(
                  materialInfo: item,
                  addToCart: addToCart,
                  salesOrgConfigs: salesOrgConfigs,
                );
              },
              items: covidMaterialListState.materialList,
            ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final Function addToCart;
  final SalesOrganisationConfigs salesOrgConfigs;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.addToCart,
    required this.salesOrgConfigs,
  }) : super(key: key);

  void _showMaterialDetail(BuildContext context) {
    final materialPrice = context
        .read<MaterialPriceBloc>()
        .state
        .materialPrice[materialInfo.materialNumber];
    if (materialPrice == null) {
      showSnackBar(
        context: context,
        message: 'Product Not Available'.tr(),
      );
    } else {
      addToCart(
        context: context,
        priceAggregate: PriceAggregate(
          price: materialPrice,
          materialInfo: materialInfo,
          salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
          quantity: 1,
          bundle: Bundle.empty(),
          addedBonusList: [],
          stockInfo: StockInfo.empty().copyWith(
            materialNumber: materialInfo.materialNumber,
          ),
          tenderContract: TenderContract.empty(),
          comboDeal: ComboDeal.empty(),
        ),
        isCovid19Tab: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key(
          'covidMaterialOption${materialInfo.materialNumber.getOrCrash()}',
        ),
        onTap: () => _showMaterialDetail(context),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materialInfo.materialDescription,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              materialInfo.materialNumber.displayMatNo,
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            (salesOrgConfigs.enableDefaultMD &&
                    materialInfo.defaultMaterialDescription.isNotEmpty)
                ? Text(
                    materialInfo.defaultMaterialDescription,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  )
                : const SizedBox.shrink(),
            (salesOrgConfigs.enableIRN &&
                    materialInfo.itemRegistrationNumber.isNotEmpty)
                ? Text(
                    materialInfo.itemRegistrationNumber,
                    style: Theme.of(context).textTheme.titleSmall?.apply(
                          color: ZPColors.lightGray,
                        ),
                  )
                : const SizedBox.shrink(),
            Text(
              materialInfo.principalData.principalName.getOrDefaultValue(''),
              style: Theme.of(context).textTheme.titleSmall?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            _GovermentMaterialCode(materialInfo: materialInfo),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PriceLabel(materialInfo: materialInfo),
                Row(
                  children: [
                    FavoriteButton(materialInfo: materialInfo),
                    CustomSmallButton(
                      onPressed: () => _showMaterialDetail(context),
                      text: 'Add'.tr(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GovermentMaterialCode extends StatelessWidget {
  final MaterialInfo materialInfo;

  const _GovermentMaterialCode({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesOrgBloc, SalesOrgState>(
      builder: (context, state) {
        return state.configs.enableGMC &&
                materialInfo.governmentMaterialCode.isNotEmpty
            ? Text(
                '${'Government Material Code:'.tr()} ${materialInfo.governmentMaterialCode}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.lightGray,
                    ),
                overflow: TextOverflow.ellipsis,
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _PriceLabel extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _PriceLabel({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialPriceBloc, MaterialPriceState>(
      buildWhen: (previous, current) =>
          previous.isFetching != current.isFetching,
      builder: (context, state) {
        final itemPrice = state.materialPrice[materialInfo.materialNumber];
        if (itemPrice != null) {
          final priceAggregate = PriceAggregate(
            price: itemPrice,
            materialInfo: materialInfo,
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            quantity: 1,
            discountedMaterialCount:
                context.read<CartBloc>().state.zmgMaterialCount(
                      itemMaterialGroup: materialInfo.materialGroup2,
                    ),
            bundle: Bundle.empty(),
            addedBonusList: [],
            stockInfo: StockInfo.empty().copyWith(
              materialNumber: materialInfo.materialNumber,
            ),
            tenderContract: TenderContract.empty(),
            comboDeal: ComboDeal.empty(),
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.read<SalesOrgBloc>().state.configs.enableVat
                  ? Text(
                      '${'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '.tr()}${priceAggregate.display(PriceType.finalPrice)}',
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableListPrice
                  ? Text(
                      '${'List Price:'.tr()}${priceAggregate.display(PriceType.listPrice)}',
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                '${'Unit Price: '.tr()}${priceAggregate.display(PriceType.unitPrice)}',
                style: Theme.of(context).textTheme.titleSmall?.apply(
                      color: ZPColors.black,
                    ),
              ),
            ],
          );
        }
        if (state.isFetching) {
          return SizedBox(
            key: const Key('price-loading'),
            width: 40,
            child: LoadingShimmer.tile(),
          );
        }

        return Text(
          '${'Unit Price: '.tr()}NA',
          style: Theme.of(context).textTheme.titleSmall?.apply(
                color: ZPColors.black,
              ),
        );
      },
    );
  }
}
