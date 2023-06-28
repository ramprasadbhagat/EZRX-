part of 'return_list_by_item_bloc.dart';

@freezed
class ReturnListByItemEvent with _$ReturnListByItemEvent {
  const factory ReturnListByItemEvent.initialized() = _Initialized;

  const factory ReturnListByItemEvent.fetch({
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
    required User user,
  }) = _Fetch;
  const factory ReturnListByItemEvent.loadMore({
    required User user,
    required SalesOrg salesOrg,
    required ShipToInfo shipInfo,
    required CustomerCodeInfo customerCodeInfo,
  }) = _LoadMore;
}
