part of 'order_history_list_bloc.dart';

@freezed
class OrderHistoryListEvent with _$OrderHistoryListEvent {
  const factory OrderHistoryListEvent.initialized() = _Initialized;
  const factory OrderHistoryListEvent.fetch() = _Fetch;
  const factory OrderHistoryListEvent.loadMore() = _LoadMore;
}
