part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeEvent with _$CustomerCodeEvent {
  const factory CustomerCodeEvent.initialized() = _Initialized;
  const factory CustomerCodeEvent.selected({
    required CustomerCodeInfo customerCodeInfo,
  }) = _Selected;

  const factory CustomerCodeEvent.fetch({
    @Default('') String searchText,
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _Fetch;

  const factory CustomerCodeEvent.search({
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
    required String searchValue,
  }) = _Search;

  const factory CustomerCodeEvent.loadMore({
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _LoadMore;

  const factory CustomerCodeEvent.loadStoredCustomerCode({
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _LoadStoredCustomerCode;

  const factory CustomerCodeEvent.autoSearch({
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
    required String searchValue,
  }) = _AutoSearch;
}
