part of 'product_search_bloc.dart';

@freezed
class ProductSearchEvent with _$ProductSearchEvent {
  const factory ProductSearchEvent.autoSearchProduct({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SearchKey searchKey,
  }) = _AutoSearchProduct;

  const factory ProductSearchEvent.searchProduct({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required SearchKey searchKey,
  }) = _SearchProduct;

  const factory ProductSearchEvent.loadMoreProductList({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _LoadMoreProductList;

  const factory ProductSearchEvent.clearSearch() = _ClearSearch;

  const factory ProductSearchEvent.fetchProductSearchSuggestionHistory() =
      _FetchProductSearchSuggestionHistory;

  const factory ProductSearchEvent.clearProductSearchSuggestionHistory() =
      _ClearProductSearchSuggestionHistory;
}
