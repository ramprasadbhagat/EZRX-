part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeEvent with _$CustomerCodeEvent {
  const factory CustomerCodeEvent.initialized({
    required bool hideCustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _Initialized;

  const factory CustomerCodeEvent.fetch({
    @Default('') String searchText,
  }) = _Fetch;

  const factory CustomerCodeEvent.search({
    required SearchKey searchValue,
  }) = _Search;

  const factory CustomerCodeEvent.loadMore() = _LoadMore;

  const factory CustomerCodeEvent.deletedSearch({
    @Default('') String searchText,
  }) = _DeletedSearch;

  const factory CustomerCodeEvent.fetchCustomerCodeConfig({
    required CustomerCodeInfo customerCodeInfo,
  }) = _FetchCustomerCodeConfig;
}
