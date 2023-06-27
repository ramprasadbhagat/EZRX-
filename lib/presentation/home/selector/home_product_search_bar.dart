import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/order/product_search/product_search_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/products/product_search_bar.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductSearchBar extends StatefulWidget {
  const HomeProductSearchBar({Key? key}) : super(key: key);

  @override
  State<HomeProductSearchBar> createState() => HomeProductSearchBarState();
}

class HomeProductSearchBarState extends State<HomeProductSearchBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: WidgetKeys.homeProductSearchBar,
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: kToolbarHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const Expanded(
                child: ColoredBox(
                  color: ZPColors.primary,
                ),
              ),
              Expanded(
                child: Container(
                  color: ZPColors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: BlocConsumer<ProductSearchBloc, ProductSearchState>(
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
              return ProductSearchBar(
                hintText: 'Search by product name or code'.tr(),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                enabled: true,
                onClear: () => context.read<ProductSearchBloc>().add(
                      const ProductSearchEvent.clearSearch(),
                    ),
                border: const OutlineInputBorder(),
                customValidator: () => true,
                onSearchChanged: (value) {
                  context.read<ProductSearchBloc>().add(
                        ProductSearchEvent.autoSearchProduct(
                          salesOrganization: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
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
                          salesOrganization: context
                              .read<SalesOrgBloc>()
                              .state
                              .salesOrganisation,
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
                controller: _searchController,
              );
            },
          ),
        ),
      ],
    );
  }
}
