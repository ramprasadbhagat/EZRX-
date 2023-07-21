import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/order/material_price/material_price_bloc.dart';
import 'package:ezrxmobile/application/order/product_detail/details/product_detail_bloc.dart';
import 'package:ezrxmobile/presentation/products/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/products/clear_product_search_suggestion_history.dart';

class ProductSuggestionPage extends StatelessWidget {
  const ProductSuggestionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: WidgetKeys.productSearchPage,
      appBar: AppBar(
        title: const _ProductSearchSection(),
        elevation: 0,
        titleSpacing: 0,
      ),
      body: const _BodyContent(),
    );
  }
}

class _BodyContent extends StatelessWidget {
  const _BodyContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) => previous.searchKey != current.searchKey,
      builder: (context, state) {
        return state.searchKey.validFilterSearchKey
            ? const _ProductSuggestionSection()
            : const _ProductSearchHistorySuggestionSection();
      },
    );
  }
}

class _ProductSearchSection extends StatefulWidget {
  const _ProductSearchSection({Key? key}) : super(key: key);

  @override
  State<_ProductSearchSection> createState() => _ProductSearchSectionState();
}

class _ProductSearchSectionState extends State<_ProductSearchSection> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.value = TextEditingValue(
      text: context
          .read<ProductSearchBloc>()
          .state
          .searchKey
          .getOrDefaultValue(''),
      selection: TextSelection.collapsed(
        offset: _searchController.selection.base.offset,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.searchKey != current.searchKey ||
          previous.isSearching != current.isSearching,
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption ||
          previous.searchKey != current.searchKey,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
        final searchText = state.searchKey.getOrDefaultValue('');
        _searchController.value = TextEditingValue(
          text: searchText,
          selection: TextSelection.collapsed(
            offset: _searchController.selection.base.offset,
          ),
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ProductSearchBar(
            autofocus: true,
            controller: _searchController,
            enabled: !state.isSearching,
            onSearchChanged: (value) {
              context.read<ProductSearchBloc>().add(
                    ProductSearchEvent.autoSearchProduct(
                      salesOrganization:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      searchKey: value,
                    ),
                  );
            },
            onSearchSubmitted: (value) {
              context.read<ProductSearchBloc>().add(
                    ProductSearchEvent.searchProduct(
                      salesOrganization:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo: context
                          .read<CustomerCodeBloc>()
                          .state
                          .customerCodeInfo,
                      shipToInfo:
                          context.read<CustomerCodeBloc>().state.shipToInfo,
                      searchKey: value,
                    ),
                  );
            },
            customValidator: () =>
                SearchKey.search(_searchController.text).isValid(),
            onClear: () {
              context.read<ProductSearchBloc>().add(
                    const ProductSearchEvent.clearSearch(),
                  );
            },
            border: InputBorder.none,
          ),
        );
      },
    );
  }
}

class _ProductSuggestionSection extends StatelessWidget {
  const _ProductSuggestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.suggestedProductList != current.suggestedProductList ||
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        return ScrollList<MaterialInfo>(
          key: WidgetKeys.productSearchSuggestion,
          controller: ScrollController(),
          onRefresh: () {
            context.read<ProductSearchBloc>().add(
                  const ProductSearchEvent.clearSearch(),
                );
          },
          onLoadingMore: () {
            context.read<ProductSearchBloc>().add(
                  ProductSearchEvent.loadMoreProductList(
                    salesOrganization:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                  ),
                );
          },
          isLoading: state.isSearching,
          itemBuilder: (_, __, item) => _SuggestedProductTile(product: item),
          items: state.suggestedProductList,
          noRecordFoundWidget:
              const NoRecordFound(title: 'That didn’t match anything'),
        );
      },
    );
  }
}

class _SuggestedProductTile extends StatelessWidget {
  final MaterialInfo product;
  const _SuggestedProductTile({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => _onTap(context, product),
          horizontalTitleGap: 0,
          leading: const Icon(
            Icons.search,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            product.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: ZPColors.accentColor,
        ),
      ],
    );
  }

  void _onTap(BuildContext context, MaterialInfo product) {
    final eligibilityBlocState = context.read<EligibilityBloc>().state;
    context.read<ProductDetailBloc>().add(
          ProductDetailEvent.fetch(
            materialNumber: product.materialNumber,
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            locale: context.locale,
            type: product.type,
          ),
        );
    context.router.pushNamed('orders/material_details');
    context.read<MaterialPriceBloc>().add(
          MaterialPriceEvent.fetch(
            salesOrganisation: eligibilityBlocState.salesOrganisation,
            salesConfigs: eligibilityBlocState.salesOrgConfigs,
            customerCodeInfo: eligibilityBlocState.customerCodeInfo,
            shipToInfo: eligibilityBlocState.shipToInfo,
            comboDealEligible: eligibilityBlocState.comboDealEligible,
            materials: [product],
          ),
        );
  }
}

class _ProductSearchHistorySuggestionSection extends StatelessWidget {
  const _ProductSearchHistorySuggestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.productSuggestionHistory != current.productSuggestionHistory,
      builder: (context, state) {
        return state.productSuggestionHistory.searchKeyList.isNotEmpty
            ? Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Search History',
                          style:
                              Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color: ZPColors.extraLightGrey4,
                                  ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete_outlined,
                            color: ZPColors.extraLightGrey4,
                          ),
                          onPressed: () => {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              builder: (_) {
                                return const ClearProductSearchSuggestionHistory();
                              },
                            ),
                          },
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: context
                        .read<ProductSearchBloc>()
                        .state
                        .productSuggestionHistory
                        .searchKeyList
                        .reversed
                        .map((e) => _HistoryTile(
                              productSearchObject: e,
                            ))
                        .toList(),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}

class _HistoryTile extends StatelessWidget {
  final SearchKey productSearchObject;
  const _HistoryTile({Key? key, required this.productSearchObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 0,
          onTap: () {
            context.read<ProductSearchBloc>().add(
                  ProductSearchEvent.searchProduct(
                    salesOrganization:
                        context.read<SalesOrgBloc>().state.salesOrganisation,
                    configs: context.read<SalesOrgBloc>().state.configs,
                    customerCodeInfo:
                        context.read<CustomerCodeBloc>().state.customerCodeInfo,
                    shipToInfo:
                        context.read<CustomerCodeBloc>().state.shipToInfo,
                    searchKey: productSearchObject.getOrDefaultValue(''),
                  ),
                );
          },
          leading: const Icon(
            Icons.history,
            color: ZPColors.unselectedLabelColor,
          ),
          title: Text(
            productSearchObject.getOrDefaultValue(''),
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(
          indent: 15,
          endIndent: 15,
          color: ZPColors.accentColor,
        ),
      ],
    );
  }
}
