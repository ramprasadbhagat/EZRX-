part of 'product_search_bloc.dart';

@freezed
class ProductSearchState with _$ProductSearchState {
  const factory ProductSearchState({
    required bool isSearching,
    required List<MaterialInfo> suggestedProductList,
    required bool canLoadMore,
    required ProductSuggestionHistory productSuggestionHistory,
    required Option<Either<ApiFailure, dynamic>> apiFailureOrSuccessOption,
    required SearchKey searchKey,
  }) = _ProductSearchState;

  factory ProductSearchState.initial() => ProductSearchState(
        apiFailureOrSuccessOption: none(),
        isSearching: false,
        canLoadMore: false,
        productSuggestionHistory: ProductSuggestionHistory.empty(),
        suggestedProductList: <MaterialInfo>[],
        searchKey: SearchKey(''),
      );
}
