part of 'product_search_bloc.dart';

@freezed
class ProductSearchEvent with _$ProductSearchEvent {
  
  const factory ProductSearchEvent.autoSearchProduct({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String searchKey,
  }) = _AutoSearchProduct;

  const factory ProductSearchEvent.searchProduct({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
    required String searchKey,
  }) = _SearchProduct;

  const factory ProductSearchEvent.loadMoreProductList({
    required SalesOrganisation salesOrganization,
    required SalesOrganisationConfigs configs,
    required CustomerCodeInfo customerCodeInfo,
    required ShipToInfo shipToInfo,
  }) = _LoadMoreProductList;

  const factory ProductSearchEvent.clearSearch() = _ClearSearch;
}
