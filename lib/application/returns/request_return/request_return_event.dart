part of 'request_return_bloc.dart';

@freezed
class RequestReturnEvent with _$RequestReturnEvent {
  const factory RequestReturnEvent.initialized() = _Initialized;

  const factory RequestReturnEvent.fetch({
    required SalesOrganisation salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required RequestReturnFilter requestReturnFilter,
  }) = _Fetch;

  const factory RequestReturnEvent.loadMore({
    required SalesOrganisation salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required RequestReturnFilter requestReturnFilter,
  }) = _LoadMore;

  const factory RequestReturnEvent.sortByDate({
    required String sortDirection,
  }) = _SortByDate;
}
