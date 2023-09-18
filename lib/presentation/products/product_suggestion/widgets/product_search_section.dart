part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSearchSection extends StatelessWidget {
  const _ProductSearchSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductSearchBloc>().add(
          const ProductSearchEvent.clearSearch(),
        );

    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
      buildWhen: (previous, current) =>
          previous.isSearching != current.isSearching ||
          previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(right: 20),
        child: CustomSearchBar(
          key: WidgetKeys.genericKey(key: state.searchKey.searchValueOrEmpty),
          autofocus: true,
          initialValue: state.searchKey.searchValueOrEmpty,
          enabled: !state.isSearching,
          onSearchChanged: (value) => context.read<ProductSearchBloc>().add(
                ProductSearchEvent.searchProduct(
                  searchKey: SearchKey.search(value),
                ),
              ),
          onSearchSubmitted: (value) => context.read<ProductSearchBloc>().add(
                ProductSearchEvent.searchProduct(
                  searchKey: SearchKey.search(value),
                ),
              ),
          //customValidator : we are not taking the value from the state, as there is auto-search.
          //It take time for 1 sec to emit the state, so we have used from local.
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => context.read<ProductSearchBloc>().add(
                const ProductSearchEvent.clearSearch(),
              ),
          clearIconKey: WidgetKeys.productSearchClearKey,
          searchSuffixIcon: IconButton(
            splashRadius: 1,
            key: WidgetKeys.productScanCameraKey,
            icon: const Icon(
              Icons.camera_alt_outlined,
            ),
            onPressed: () => {
              trackMixpanelEvent(
                MixpanelEvents.scannerClicked,
              ),
              context.router.pushNamed('orders/scan_material_info'),
              context.read<ScanMaterialInfoBloc>().add(
                    ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                      customerCodeInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrganisation: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation,
                      shipToInfo:
                          context.read<EligibilityBloc>().state.shipToInfo,
                      user: context.read<EligibilityBloc>().state.user,
                      salesOrgConfigs:
                          context.read<EligibilityBloc>().state.salesOrgConfigs,
                    ),
                  ),
            },
          ),
        ),
      ),
    );
  }
}
