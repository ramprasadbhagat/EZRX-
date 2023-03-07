part of 'order_history_filter_bloc.dart';

@freezed
class OrderHistoryFilterEvent with _$OrderHistoryFilterEvent {
  const factory OrderHistoryFilterEvent.initialized() = _Initialized;

  const factory OrderHistoryFilterEvent.applyFilters() = _ApplyFilters;

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

  const factory OrderHistoryFilterEvent.sortByDate(String sortDirection) =
      _SortByDate;
  const factory OrderHistoryFilterEvent.setOrderDate({
    required DateTimeRange orderDateRange,
  }) = _SetOrderDate;
}
