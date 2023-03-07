import 'package:ezrxmobile/domain/core/value/value_transformers.dart';
import 'package:flutter/material.dart';
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
      applyFilters: (_) async {
        emit(state.copyWith(
          isSubmitting: false,
        ));
        if (state.orderHistoryFilter.areFiltersValid) {
          emit(state.copyWith(
            isSubmitting: true,
          ));
        } else {
          emit(state.copyWith(
            showErrorMessages: true,
          ));
        }
      },
      orderIdChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilter: state.orderHistoryFilter.copyWith(
            orderId: SearchKey.searchFilter(e.orderId),
          ),
          showErrorMessages: false,
        ),
      ),
      poNumberChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilter: state.orderHistoryFilter.copyWith(
            poNumber: SearchKey.searchFilter(e.poNumber),
          ),
          showErrorMessages: false,
        ),
      ),
      principalSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilter: state.orderHistoryFilter.copyWith(
            principalSearch: SearchKey.searchFilter(e.principalSearch),
          ),
          showErrorMessages: false,
        ),
      ),
      materialSearchChanged: (e) => emit(
        state.copyWith(
          orderHistoryFilter: state.orderHistoryFilter.copyWith(
            materialSearch: SearchKey.searchFilter(e.materialSearch),
          ),
          showErrorMessages: false,
        ),
      ),
      sortByDate: (event) => emit(
        state.copyWith(
          showErrorMessages: false,
          sortDirection: event.sortDirection,
        ),
      ),
      setOrderDate: (e) => emit(
        state.copyWith(
          orderHistoryFilter: state.orderHistoryFilter.copyWith(
            fromDate: DateTimeStringValue(
              getDateStringByDateTime(e.orderDateRange.start),
            ),
            toDate: DateTimeStringValue(
              getDateStringByDateTime(e.orderDateRange.end),
            ),
          ),
          showErrorMessages: false,
        ),
      ),
    );
  }
}
