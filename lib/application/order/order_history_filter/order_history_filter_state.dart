part of 'order_history_filter_bloc.dart';

@freezed
class OrderHistoryFilterState with _$OrderHistoryFilterState {
  const OrderHistoryFilterState._();

  const factory OrderHistoryFilterState({
    required OrderHistoryFilter orderHistoryFilterList,
    required bool isSubmitting,
    required bool errorMessage,
    required OrderHistory orderHistoryFilter,
    
  }) = _OrderHistoryFilterState;

  factory OrderHistoryFilterState.initial() => OrderHistoryFilterState(
        isSubmitting: false,
        errorMessage: false,
        orderHistoryFilter: OrderHistory.empty(),      
        orderHistoryFilterList: OrderHistoryFilter.empty(),
      );
}
