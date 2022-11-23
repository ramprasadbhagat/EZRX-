import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/application/order/cart/cart_bloc.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/order_document_type/order_document_type_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:ezrxmobile/presentation/orders/create_order/bonus_discount_label.dart';
import 'package:ezrxmobile/presentation/orders/create_order/favorite_button.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_type_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialListPage extends StatelessWidget {
  final Function addToCart;

  const MaterialListPage({Key? key, required this.addToCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('materialListPage'),
      body: BlocConsumer<MaterialListBloc, MaterialListState>(
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
            previous.isFetching != current.isFetching ||
            previous.materialList != current.materialList,
        builder: (context, state) {
          return BlocListener<OrderDocumentTypeBloc, OrderDocumentTypeState>(
            listenWhen: (previous, current) =>
                previous.selectedOrderType != current.selectedOrderType ||
                previous.isSubmitting != current.isSubmitting,
            listener: (context, orderDocumentTypeState) {
              orderDocumentTypeState.orderDocumentTypeListFailureOrSuccessOption
                  .fold(
                () {},
                (either) => either.fold(
                  (failure) {
                    showSnackBar(
                      context: context,
                      message: 'Unable to fetch Order Type',
                    );
                  },
                  (_) {
                    context.read<MaterialListBloc>().add(
                          MaterialListEvent.fetch(
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
                            orderDocumentType: context
                                .read<OrderDocumentTypeBloc>()
                                .state
                                .selectedOrderType,
                            pickAndPack: context
                                .read<EligibilityBloc>()
                                .state
                                .getPNPValueMaterial,
                          ),
                        );
                  },
                ),
              );
            },
            child: Column(
              children: [
                const _SearchBar(),
                if (context.read<EligibilityBloc>().state.isOrderTypeEnable)
                  const OrderTypeSelector(hideReasonField: true),
                const _MaterialFilters(),
                _BodyContent(
                  materialListState: state,
                  addToCart: addToCart,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BodyContent extends StatelessWidget {
  final MaterialListState materialListState;
  final Function addToCart;

  const _BodyContent({
    Key? key,
    required this.materialListState,
    required this.addToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: materialListState.isFetching &&
              materialListState.materialList.isEmpty
          ? LoadingShimmer.withChild(
              child: Image.asset(
                'assets/images/ezrxlogo.png',
                key: const Key('loaderImage'),
                width: 80,
                height: 80,
              ),
            )
          : ScrollList<MaterialInfo>(
              emptyMessage: 'No material found',
              onRefresh: () {
                context.read<MaterialPriceBloc>().add(
                      const MaterialPriceEvent.initialized(),
                    );

                context
                    .read<MaterialFilterBloc>()
                    .add(const MaterialFilterEvent.clearSelected());

                context.read<MaterialListBloc>().add(
                      const MaterialListEvent.updateSearchKey(searchKey: ''),
                    );
                context.read<MaterialListBloc>().add(
                      MaterialListEvent.fetch(
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
                            .getEmptyMaterialFilter(),
                        orderDocumentType: context
                            .read<OrderDocumentTypeBloc>()
                            .state
                            .selectedOrderType,
                        pickAndPack: context
                            .read<EligibilityBloc>()
                            .state
                            .getPNPValueMaterial,
                      ),
                    );
              },
              onLoadingMore: () => context.read<MaterialListBloc>().add(
                    MaterialListEvent.loadMore(
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
                      selectedMaterialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .selectedMaterialFilter,
                      orderDocumentType: context
                          .read<OrderDocumentTypeBloc>()
                          .state
                          .selectedOrderType,
                      pickAndPack: context
                          .read<EligibilityBloc>()
                          .state
                          .getPNPValueMaterial,
                    ),
                  ),
              isLoading: materialListState.isFetching,
              itemBuilder: (context, index, item) {
                final enableDefaultMD =
                    context.read<SalesOrgBloc>().state.configs.enableDefaultMD;

                return _ListContent(
                  enableDefaultMD: enableDefaultMD,
                  materialInfo: item,
                  addToCart: addToCart,
                );
              },
              items: materialListState.materialList,
            ),
    );
  }
}

class _ListContent extends StatelessWidget {
  final MaterialInfo materialInfo;
  final Function addToCart;
  final bool enableDefaultMD;

  const _ListContent({
    Key? key,
    required this.materialInfo,
    required this.addToCart,
    required this.enableDefaultMD,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        key: Key('materialOption${materialInfo.materialNumber.getOrCrash()}'),
        onTap: () {
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
                discountedMaterialCount:
                    context.read<CartBloc>().state.zmgMaterialCount,
                isOverride: false,
                bundle: Bundle.empty(),
                addedBonusList: [],
              ),
            );
          }
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  materialInfo.materialNumber.displayMatNo,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.kPrimaryColor,
                      ),
                ),
                BonusDiscountLabel(materialInfo: materialInfo),
              ],
            ),
            Text(
              materialInfo.materialDescription,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            (enableDefaultMD &&
                    materialInfo.defaultMaterialDescription.isNotEmpty)
                ? Text(
                    materialInfo.defaultMaterialDescription,
                    style: Theme.of(context).textTheme.subtitle2?.apply(
                          color: ZPColors.lightGray,
                        ),
                  )
                : const SizedBox.shrink(),
            Text(
              materialInfo.principalData.principalName,
              style: Theme.of(context).textTheme.subtitle2?.apply(
                    color: ZPColors.lightGray,
                  ),
            ),
            _GovermentMaterialCode(
              materialInfo: materialInfo,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _PriceLabel(materialInfo: materialInfo),
                FavoriteButton(materialInfo: materialInfo),
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
          final priceAggregate = PriceAggregate(
            price: itemPrice,
            materialInfo: materialInfo,
            salesOrgConfig: context.read<SalesOrgBloc>().state.configs,
            quantity: 1,
            // TODO: will revisit and enhance this
            discountedMaterialCount: itemPrice.zmgDiscount
                ? context.watch<CartBloc>().state.zmgMaterialCount
                : context.read<CartBloc>().state.zmgMaterialCount,
            isOverride: false,
            bundle: Bundle.empty(),
            addedBonusList: [],
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              context.read<SalesOrgBloc>().state.configs.enableVat
                  ? Text(
                      '${'Price before ${context.read<SalesOrgBloc>().state.salesOrg.taxCode}: '.tr()}${priceAggregate.display(PriceType.unitPriceBeforeGst)}',
                      style: Theme.of(context).textTheme.bodyText1?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              context.read<SalesOrgBloc>().state.configs.enableListPrice
                  ? Text(
                      '${'List Price: '.tr()}${priceAggregate.display(PriceType.listPrice)}',
                      style: Theme.of(context).textTheme.bodyText1?.apply(
                            color: ZPColors.lightGray,
                          ),
                    )
                  : const SizedBox.shrink(),
              Text(
                '${'Unit Price: '.tr()}${priceAggregate.display(PriceType.unitPrice)}',
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
    final searchText = context.read<MaterialListBloc>().state.searchKey;
    if (searchText.isValid()) {
      _searchController.value = TextEditingValue(
        text: searchText.getOrCrash(),
        selection: TextSelection.collapsed(
          offset: searchText.getOrCrash().length,
        ),
      );
      context.read<MaterialListBloc>().add(
            MaterialListEvent.searchMaterialList(
              user: context.read<UserBloc>().state.user,
              salesOrganisation:
                  context.read<SalesOrgBloc>().state.salesOrganisation,
              configs: context.read<SalesOrgBloc>().state.configs,
              customerCodeInfo:
                  context.read<CustomerCodeBloc>().state.customerCodeInfo,
              shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
              selectedMaterialFilter: context
                  .read<MaterialFilterBloc>()
                  .state
                  .selectedMaterialFilter,
              pickAndPack:
                  context.read<EligibilityBloc>().state.getPNPValueMaterial,
            ),
          );
    }
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      height: 50,
      color: ZPColors.white,
      child: BlocConsumer<MaterialListBloc, MaterialListState>(
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
                context.read<MaterialListBloc>().add(
                      MaterialListEvent.updateSearchKey(searchKey: value),
                    );
              },
              onFieldSubmitted: (value) {
                if (state.searchKey.isValid()) {
                  // search code goes here
                  context.read<MaterialListBloc>().add(
                        MaterialListEvent.searchMaterialList(
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
                          pickAndPack: context
                              .read<EligibilityBloc>()
                              .state
                              .getPNPValueMaterial,
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
                contentPadding: const EdgeInsets.all(0),
                isDense: true,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    context.read<MaterialListBloc>().add(
                          const MaterialListEvent.updateSearchKey(
                            searchKey: '',
                          ),
                        );
                    // fetch code goes here
                    context
                        .read<MaterialListBloc>()
                        .add(MaterialListEvent.fetch(
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
                              .getEmptyMaterialFilter(),
                          orderDocumentType: context
                              .read<OrderDocumentTypeBloc>()
                              .state
                              .selectedOrderType,
                          pickAndPack: context
                              .read<EligibilityBloc>()
                              .state
                              .getPNPValueMaterial,
                        ));
                  },
                ),
                hintText: 'Search...',
                // border: InputBorder.none,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MaterialFilters extends StatelessWidget {
  const _MaterialFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      builder: (context, state) {
        return ColoredBox(
          color: ZPColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSelector(
                title: 'Principal',
                child: Text(
                  state.getFilterLabel(MaterialFilterType.principal),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.principal,
                    ),
                  );
                },
              ),
              CustomSelector(
                title: 'Theraputic',
                child: Text(
                  state.getFilterLabel(MaterialFilterType.therapeutic),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.therapeutic,
                    ),
                  );
                },
              ),
              CustomSelector(
                title: 'Brand',
                child: Text(
                  state.getFilterLabel(MaterialFilterType.brand),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.subtitle2?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.brand,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
