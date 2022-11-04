import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/favourites/favourite_bloc.dart';
import 'package:ezrxmobile/application/order/covid_material_list/covid_material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/favourites/entities/favourite_item.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
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
                final failureMessage = failure.failureMessage;
                showSnackBar(
                  context: context,
                  message: failureMessage.tr(),
                );
                if (failureMessage == 'authentication failed') {
                  context.read<AuthBloc>().add(const AuthEvent.logout());
                }
              },
              (_) {
                context.read<AuthBloc>().add(const AuthEvent.authCheck());
              },
            ),
          );
        },
        buildWhen: (previous, current) =>
            previous.isFetching != current.isFetching ||
            previous.materialList != current.materialList,
        builder: (context, state) {
          return Column(
            children: [
              const _SearchBar(),
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
          ? LoadingShimmer.withChild(
              child: Image.asset(
                'assets/images/ezrxlogo.png',
                key: const Key('loaderImage'),
                width: 80,
                height: 80,
              ),
            )
          : ScrollList<MaterialInfo>(
              emptyMessage: 'There are no vaccine in this customer code',
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
                    ),
                  ),
              isLoading: covidMaterialListState.isFetching,
              itemBuilder: (context, index, item) =>
                  _ListContent(materialInfo: item, addToCart: addToCart),
              items: covidMaterialListState.materialList,
            ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final Function addToCart;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key(
          'covidMaterialOption${materialInfo.materialNumber.getOrCrash()}',
        ),
        onTap: () {
          addToCart(
            context: context,
            materialInfo: materialInfo,
          );
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materialInfo.materialNumber.displayMatNo,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.kPrimaryColor,
                  ),
            ),
            Text(
              materialInfo.materialDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              materialInfo.principalData.principalName,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            _GovermentMaterialCode(materialInfo: materialInfo),
            _PriceLabel(materialInfo: materialInfo),
          ],
        ),
        trailing: _FavoriteButton(materialInfo: materialInfo),
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
                style: Theme.of(context).textTheme.subtitle2?.apply(
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
          final currentCurrency =
              context.read<SalesOrgBloc>().state.configs.currency;
          final isHidePrice = materialInfo.hidePrice;
          final isVNUser = context.read<SalesOrgBloc>().state.salesOrg.isVN;
          final enabledVat =
              context.read<SalesOrgBloc>().state.configs.enableVat;
          final enableTaxClassification = context
              .read<SalesOrgBloc>()
              .state
              .configs
              .enableTaxClassification;
          final taxClassification = materialInfo.taxClassification;
          final taxes = materialInfo.taxes;
          final vatValue = context.read<SalesOrgBloc>().state.configs.vatValue;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${'List Price: '.tr()}${itemPrice.finalPrice.displayWithCurrency(
                  isFoc: itemPrice.isFOC,
                  currency: currentCurrency,
                  hidePrice: isHidePrice,
                )}',
                style: Theme.of(context).textTheme.bodyText1?.apply(
                      color: ZPColors.darkGray,
                    ),
              ),
              Text(
                '${'Unit Price: '.tr()}${itemPrice.finalPrice.displayUnitPrice(
                  isFoc: itemPrice.isFOC,
                  currency: currentCurrency,
                  hidePrice: isHidePrice,
                  isVNUser: isVNUser,
                  enableVat: enabledVat,
                  enableTaxClassification: enableTaxClassification,
                  vatValue: vatValue,
                  taxClassification: taxClassification,
                  taxes: taxes,
                )}',
                style: Theme.of(context).textTheme.bodyText1?.apply(
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
          style: Theme.of(context).textTheme.bodyText1?.apply(
                color: ZPColors.black,
              ),
        );
      },
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  final MaterialInfo materialInfo;
  const _FavoriteButton({Key? key, required this.materialInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteBloc, FavouriteState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {},
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        final favourite = state.favouriteItems.firstWhere(
          (e) => e.materialNumber == materialInfo.materialNumber,
          orElse: () => Favourite.empty(),
        );

        return favourite == Favourite.empty()
            ? InkWell(
                child: const SizedBox(
                  height: 15,
                  width: 15,
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: ZPColors.secondary,
                    // size: 20,
                  ),
                ),
                onTap: () => context.read<FavouriteBloc>().add(
                      FavouriteEvent.add(
                        item: Favourite(
                          id: '',
                          materialNumber: materialInfo.materialNumber,
                          isFOC: materialInfo.materialGroup4.isFOC,
                          isTenderContract: false,
                          materialDescription: materialInfo.materialDescription,
                        ),
                        isPackAndPick: false,
                        user: context.read<UserBloc>().state.user,
                      ),
                    ),
              )
            : InkWell(
                child: const SizedBox(
                  height: 15,
                  width: 15,
                  child: Icon(
                    Icons.favorite,
                    color: ZPColors.secondary,
                    // size: 20,
                  ),
                ),
                onTap: () => context.read<FavouriteBloc>().add(
                      FavouriteEvent.delete(
                        item: favourite,
                        user: context.read<UserBloc>().state.user,
                      ),
                    ),
              );
      },
    );
  }
}

class _SearchBar extends StatefulWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: ZPColors.white,
      child: BlocConsumer<CovidMaterialListBloc, CovidMaterialListState>(
        listenWhen: (previous, current) =>
            previous.searchKey != current.searchKey,
        listener: (context, state) {
          final searchText = state.searchKey.getValue();
          _searchController.value = TextEditingValue(
            text: searchText,
            selection: TextSelection.collapsed(offset: searchText.length),
          );
        },
        buildWhen: (previous, current) =>
            previous.searchKey != current.searchKey ||
            previous.isFetching != current.isFetching,
        builder: (context, state) {
          return Form(
            child: TextFormField(
              key: const Key('materialSearchField'),
              autocorrect: false,
              controller: _searchController,
              enabled: !state.isFetching,
              onChanged: (value) {
                context.read<CovidMaterialListBloc>().add(
                      CovidMaterialListEvent.updateSearchKey(searchKey: value),
                    );
              },
              onFieldSubmitted: (value) {
                if (state.searchKey.isValid()) {
                  // search code goes here
                  context.read<CovidMaterialListBloc>().add(
                        CovidMaterialListEvent.searchMaterialList(
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
                          selectedMaterialFilter: context
                              .read<MaterialFilterBloc>()
                              .state
                              .selectedMaterialFilter,
                        ),
                      );
                } else {
                  showSnackBar(
                    context: context,
                    message:
                        'Search input must be greater than 4 characters.'.tr(),
                  );
                }
              },
              validator: (_) => state.searchKey.value.fold(
                (f) => f.maybeMap(
                  subceedLength: (f) =>
                      'Search input must be greater than 4 characters.'.tr(),
                  orElse: () => null,
                ),
                (_) => null,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: ZPColors.primary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ZPColors.primary),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<CovidMaterialListBloc>().add(
                          const CovidMaterialListEvent.updateSearchKey(
                            searchKey: '',
                          ),
                        );
                    // fetch code goes here
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
                          ),
                        );
                  },
                ),
                hintText: 'Search...',
              ),
            ),
          );
        },
      ),
    );
  }
}
