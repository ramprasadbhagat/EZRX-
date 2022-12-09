import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_filter.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';

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
      filterOrderHistory: (_) async {
        emit(state.copyWith(
          isSubmitting: false,
        ));
        if (state.orderHistoryFilterList.orderId.isValid() &&
            state.orderHistoryFilterList.poNumber.isValid() &&
            state.orderHistoryFilterList.principalSearch.isValid() &&
            state.orderHistoryFilterList.materialSearch.isValid()) {
          emit(state.copyWith(
            isSubmitting: true,
            isAppliedFilter: true,
          ));
        } else {
          emit(state.copyWith(
            showErrorMessages: true,
            isSubmitting: false,
            isAppliedFilter: false,
          ));
        }
      },
      setfromDate: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            fromDate: e.fromDate,
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      setToDate: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            toDate: e.toDate,
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      orderIdChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            orderId: SearchKey.orderHistoryFilter(e.orderId),
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      poNumberChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            poNumber: SearchKey.orderHistoryFilter(e.poNumber),
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      principalSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            principalSearch: SearchKey.orderHistoryFilter(e.principalSearch),
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      materialSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilterList: state.orderHistoryFilterList.copyWith(
            materialSearch: SearchKey.orderHistoryFilter(e.materialSearch),
          ),
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
        ),
      ),
      sortByDate: (event) => emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessages: false,
          isAppliedFilter: false,
          sortDirection: event.sortDirection,
        ),
      ),
    );
  }
}
