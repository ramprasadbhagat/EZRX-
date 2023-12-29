part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSearchSection extends StatefulWidget {
  final String parentRoute;

  const _ProductSearchSection({
    Key? key,
    required this.parentRoute,
  }) : super(key: key);

  @override
  State<_ProductSearchSection> createState() => _ProductSearchSectionState();
}

class _ProductSearchSectionState extends State<_ProductSearchSection> {
  late ProductSearchBloc _productSearchBloc;
  @override
  void initState() {
    super.initState();
    _productSearchBloc = context.read<ProductSearchBloc>();
  }

  @override
  void dispose() {
    _productSearchBloc.add(
      const ProductSearchEvent.clearSearch(),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          onSearchChanged: (value) {
            _trackSearchEvent(value);
            context.read<ProductSearchBloc>().add(
                  ProductSearchEvent.searchProduct(
                    searchKey: SearchKey.search(value),
                    materialFilter:
                        context.read<MaterialFilterBloc>().state.materialFilter,
                  ),
                );
          },
          onSearchSubmitted: (value) {
            _trackSearchEvent(value);
            context.read<ProductSearchBloc>().add(
                  ProductSearchEvent.searchProduct(
                    searchKey: SearchKey.search(value),
                    materialFilter:
                        context.read<MaterialFilterBloc>().state.materialFilter,
                  ),
                );
          },
          //customValidator : we are not taking the value from the state, as there is auto-search.
          //It take time for 1 sec to emit the state, so we have used from local.
          customValidator: (value) => SearchKey.search(value).isValid(),
          onClear: () => context.read<ProductSearchBloc>().add(
                const ProductSearchEvent.clearSearch(),
              ),
          searchSuffixIcon: IconButton(
            splashRadius: 1,
            key: WidgetKeys.productScanCameraKey,
            icon: const Icon(
              Icons.camera_alt_outlined,
            ),
            onPressed: () => {
              trackMixpanelEvent(MixpanelEvents.scanClicked),
              context.router.pushNamed('orders/scan_material_info'),
              context.read<ScanMaterialInfoBloc>().add(
                    ScanMaterialInfoEvent.scanMaterialNumberFromCamera(
                      materialFilter: context
                          .read<MaterialFilterBloc>()
                          .state
                          .materialFilter,
                    ),
                  ),
            },
          ),
        ),
      ),
    );
  }

  void _trackSearchEvent(String keyword) {
    trackMixpanelEvent(
      MixpanelEvents.productSearch,
      props: {
        MixpanelProps.searchKeyword: keyword,
        MixpanelProps.searchFrom:
            RouterUtils.buildRouteTrackingName(widget.parentRoute),
      },
    );
  }
}
