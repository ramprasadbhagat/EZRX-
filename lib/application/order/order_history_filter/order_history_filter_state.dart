part of 'order_history_filter_bloc.dart';

@freezed
class OrderHistoryFilterState with _$OrderHistoryFilterState {
  const OrderHistoryFilterState._();

  const factory OrderHistoryFilterState({
    required OrderHistoryFilter orderHistoryFilter,
    required bool isSubmitting,
    required bool showErrorMessages,
    required String sortDirection,
  }) = _OrderHistoryFilterState;

  factory OrderHistoryFilterState.initial() => OrderHistoryFilterState(
        isSubmitting: false,
        orderHistoryFilter: OrderHistoryFilter.empty(),
        showErrorMessages: false,
        sortDirection: 'desc',
      );
}
