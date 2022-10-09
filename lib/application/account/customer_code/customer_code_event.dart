part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeEvent with _$CustomerCodeEvent {
  const factory CustomerCodeEvent.initialized() = _Initialized;
  const factory CustomerCodeEvent.selected({
    required CustomerCodeInfo customerCodeInfo,
  }) = _Selected;

  const factory CustomerCodeEvent.fetch({
    @Default(false) bool isRefresh,
    @Default('') String searchText,
    required bool hidecustomer,
    required User userInfo,
    required SalesOrganisation selectedSalesOrg,
  }) = _Fetch;
}
