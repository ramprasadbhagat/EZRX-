import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/order_history.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';

part 'order_history_filter_event.dart';
part 'order_history_filter_state.dart';
part 'order_history_filter_bloc.freezed.dart';

class OrderHistoryFilterBloc
    extends Bloc<OrderHistoryFilterEvent, OrderHistoryFilterState> {
  OrderHistoryFilterBloc() : super(OrderHistoryFilterState.initial()) {
    on<OrderHistoryFilterEvent>(_onEvent);
  }
  Future<void> _onEvent(
    OrderHistoryFilterEvent event,
    Emitter<OrderHistoryFilterState> emit,
  ) async {
    event.map(
      initialized: (_) async => emit(OrderHistoryFilterState.initial()),
      filterOrderHistory: (_) async => emit(state.copyWith(isSubmitting: true)),
      setfromDate: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            fromDate: e.fromDate,
          ),
          isSubmitting: false,
        ),
      ),
      setToDate: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            toDate: e.toDate,
          ),
          isSubmitting: false,
        ),
      ),
      orderIdChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            orderId: e.orderId,
          ),
          isSubmitting: false,
        ),
      ),
      poNumberChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            poNumber: e.poNumber,
          ),
          isSubmitting: false,
        ),
      ),
      principalSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            principalSearch: e.principalSearch,
          ),
          isSubmitting: false,
        ),
      ),
      materialSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            materialSearch: e.materialSearch,
          ),
          isSubmitting: false,
        ),
      ),
    );
  }
}
