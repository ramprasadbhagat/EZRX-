part of 'return_list_bloc.dart';

@freezed
class ReturnListEvent with _$ReturnListEvent {
  const factory ReturnListEvent.initialized() = _Initialized;

  const factory ReturnListEvent.fetchByItems({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _FetchByItems;
  const factory ReturnListEvent.loadMoreFetchByItems({
    required User user,
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMoreFetchByItems;
}
