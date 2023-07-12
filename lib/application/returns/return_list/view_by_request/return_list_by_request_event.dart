part of 'return_list_by_request_bloc.dart';

@freezed
class ReturnListByRequestEvent with _$ReturnListByRequestEvent {
  const factory ReturnListByRequestEvent.initialized() = _Initialized;

  const factory ReturnListByRequestEvent.fetch({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
    required ReturnFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ReturnListByRequestEvent.loadMore({
    required User user,
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
