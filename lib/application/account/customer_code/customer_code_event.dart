part of 'customer_code_bloc.dart';

@freezed
class CustomerCodeEvent with _$CustomerCodeEvent {
  const factory CustomerCodeEvent.initialized() = _Initialized;
  const factory CustomerCodeEvent.selected({
    required CustomerCodeInfo customerCodeInfo,
  }) = _Selected;

  const factory CustomerCodeEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required List<SalesOrgCustomerInfo> salesOrgCustomerInfo,
    required int pageIndex,
    required bool hidecustomer,
    required String userRoleType,
    required String userName,
  }) = _Fetch;
}
