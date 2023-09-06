part of 'return_items_bloc.dart';

@freezed
class ReturnItemsEvent with _$ReturnItemsEvent {
  const factory ReturnItemsEvent.initialized() = _initialized;

  const factory ReturnItemsEvent.fetch({
    required SalesOrganisation salesOrganisation,
    required ShipToInfo shipToInfo,
    required CustomerCodeInfo customerCodeInfo,
    required ReturnItemsFilter appliedFilter,
    required SearchKey searchKey,
  }) = _Fetch;
  const factory ReturnItemsEvent.loadMore({
    required ShipToInfo shipToInfo,
    required SalesOrganisation salesOrganisation,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
