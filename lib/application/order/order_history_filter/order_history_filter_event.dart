part of 'order_history_filter_bloc.dart';

@freezed
class OrderHistoryFilterEvent with _$OrderHistoryFilterEvent {
  const factory OrderHistoryFilterEvent.initialized() = _Initialized;

  const factory OrderHistoryFilterEvent.filterOrderHistory() =
      _FilterOrderHistory;

  const factory OrderHistoryFilterEvent.setfromDate({
    required DateTime fromDate,
  }) = _SetfromDate;

  const factory OrderHistoryFilterEvent.setToDate({
    required DateTime toDate,
  }) = _SetToDate;
  const factory OrderHistoryFilterEvent.orderIdChanged(String orderId) =
      _OrderIdChanged;
  const factory OrderHistoryFilterEvent.poNumberChanged(String poNumber) =
      _PoNumberChanged;
  const factory OrderHistoryFilterEvent.principalSearchChanged(
    String principalSearch,
  ) = _PrincipalSearchChanged;
  const factory OrderHistoryFilterEvent.materialSearchChanged(
    String materialSearch,
  ) = _MaterialSearchChanged;
}
