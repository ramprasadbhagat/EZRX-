part of 'saved_order_bloc.dart';

@freezed
class SavedOrderListEvent with _$SavedOrderListEvent {
  const factory SavedOrderListEvent.initialized() = _Initialized;
  const factory SavedOrderListEvent.fetch() = _Fetch;
  const factory SavedOrderListEvent.loadMore() = _LoadMore;
}
