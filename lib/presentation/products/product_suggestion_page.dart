import 'package:easy_localization/easy_localization.dart';
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

import 'package:ezrxmobile/application/account/ship_to_code/ship_to_code_bloc.dart';

import 'package:ezrxmobile/presentation/core/scroll_list.dart';

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
      body: const _ProductSuggestionSection(),
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
            controller: _searchController,
            enabled: !state.isSearching,
            onSearchChanged: (value) {
              context.read<ProductSearchBloc>().add(
                    ProductSearchEvent.autoSearchProduct(
                      salesOrganization:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      configs: context.read<SalesOrgBloc>().state.configs,
                      customerCodeInfo:
                          context.read<CustomerCodeBloc>().state.customerCodeInfo,
                      shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
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
                      customerCodeInfo:
                          context.read<CustomerCodeBloc>().state.customerCodeInfo,
                      shipToInfo: context.read<ShipToCodeBloc>().state.shipToInfo,
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

//TODO: Empty suggestion UI to be implemented in next ticket

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
                    customerCodeInfo: context
                        .read<CustomerCodeBloc>()
                        .state
                        .customerCodeInfo,
                    shipToInfo:
                        context.read<ShipToCodeBloc>().state.shipToInfo,
                  ),
                );
          },
          isLoading: state.isSearching,
          itemBuilder: (_, __, item) => _SuggestedProductTile(product: item),
          items: state.suggestedProductList,
          emptyMessage: 'That didn’t match anything'.tr(),
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
}
