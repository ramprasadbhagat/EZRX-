part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSuggestionSection extends StatelessWidget {
  final String parentRoute;
  const _ProductSuggestionSection({
    Key? key,
    required this.parentRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductSearchBloc, ProductSearchState>(
      listenWhen: (previous, current) =>
          previous.isSearching != current.isSearching &&
          !current.isSearching &&
          previous.suggestedProductList.isEmpty,
      listener: (context, state) {
        trackMixpanelEvent(
          MixpanelEvents.productSearch,
          props: {
            MixpanelProps.searchKeyword: state.searchKey.getOrDefaultValue(''),
            MixpanelProps.searchFrom:
                RouterUtils.buildRouteTrackingName(parentRoute),
            MixpanelProps.searchMethod: 'user typed',
            MixpanelProps.searchResults: state.suggestedProductList.isEmpty
                ? ['no result']
                : state.suggestedProductList
                    .take(5)
                    .map((e) => e.name)
                    .toList(),
          },
        );
      },
      buildWhen: (previous, current) =>
          previous.suggestedProductList != current.suggestedProductList ||
          previous.isSearching != current.isSearching,
      builder: (context, state) => ScrollList<MaterialInfo>(
        key: WidgetKeys.productSearchSuggestion,
        controller: ScrollController(),
        onRefresh: () => context.read<ProductSearchBloc>().add(
              const ProductSearchEvent.clearSearch(),
            ),
        onLoadingMore: () => context.read<ProductSearchBloc>().add(
              const ProductSearchEvent.loadMoreProductList(),
            ),
        isLoading: state.isSearching,
        itemBuilder: (_, __, item) => _SuggestedProductTile(
          product: item,
          parentRoute: parentRoute,
        ),
        items: state.suggestedProductList,
        noRecordFoundWidget:
            const NoRecordFound(title: 'That didn’t match anything'),
      ),
    );
  }
}
