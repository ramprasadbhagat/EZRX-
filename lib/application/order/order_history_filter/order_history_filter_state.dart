part of 'order_history_filter_bloc.dart';

@freezed
class OrderHistoryFilterState with _$OrderHistoryFilterState {
  const OrderHistoryFilterState._();

  const factory OrderHistoryFilterState({
    required OrderHistoryFilter orderHistoryFilterList,
    required bool isSubmitting, 
    required bool showErrorMessages,
    required bool isAppliedFilter,
   
  }) = _OrderHistoryFilterState;

  factory OrderHistoryFilterState.initial() => OrderHistoryFilterState(
        isSubmitting: false,   
        orderHistoryFilterList: OrderHistoryFilter.empty(),
        showErrorMessages: false,
        isAppliedFilter: false,
        
      
      );
}
