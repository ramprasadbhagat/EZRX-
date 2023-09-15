part of 'package:ezrxmobile/presentation/products/product_suggestion/product_suggestion_page.dart';

class _ProductSuggestionSection extends StatelessWidget {
  const _ProductSuggestionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductSearchBloc, ProductSearchState>(
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
        itemBuilder: (_, __, item) => _SuggestedProductTile(product: item),
        items: state.suggestedProductList,
        noRecordFoundWidget:
            const NoRecordFound(title: 'That didn’t match anything'),
      ),
    );
  }
}
