
part of 'order_history_details_bloc.dart';

@freezed
class OrderHistoryDetailsEvent with _$OrderHistoryDetailsEvent {
  const factory OrderHistoryDetailsEvent.initialized() = _Initialized;
  const factory OrderHistoryDetailsEvent.fetch({
    required User user,
    required OrderHistoryItem orderHistoryItem,
  }) = _Fetch;
}

