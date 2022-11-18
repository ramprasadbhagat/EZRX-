part of 'order_history_filter_by_status_bloc.dart';

@freezed
class OrderHistoryFilterByStatusEvent with _$OrderHistoryFilterByStatusEvent {
  const factory OrderHistoryFilterByStatusEvent.initialized() = _Initialized;
  const factory OrderHistoryFilterByStatusEvent.checkedStatusFilter(
    {required String statusName,
    required bool isChecked,}
  ) = _CheckedStatusFilter;
  
}
