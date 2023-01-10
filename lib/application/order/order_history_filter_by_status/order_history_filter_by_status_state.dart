part of 'order_history_filter_by_status_bloc.dart';

@freezed
class OrderHistoryFilterByStatusState with _$OrderHistoryFilterByStatusState {
  const OrderHistoryFilterByStatusState._();

  const factory OrderHistoryFilterByStatusState({
    required List<StatusType> filterByStatusName,
  }) = _OrderHistoryFilterByStatusState;

  factory OrderHistoryFilterByStatusState.initial() =>
      const OrderHistoryFilterByStatusState(
        filterByStatusName: <StatusType>[],
      );

  List<String> get getAllStatusName => [
        'Cancelled',
        'Delivered',
        'Failed',
        'Pending',
        'Picking in-progress',
        'Order Created',
        'Out for delivery',
      ];

  bool isChecked(String status) {
    return filterByStatusName.contains(StatusType(status));
  }
}
