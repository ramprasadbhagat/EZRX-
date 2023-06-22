import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_filter_by_status_event.dart';
part 'order_history_filter_by_status_state.dart';
part 'order_history_filter_by_status_bloc.freezed.dart';

class OrderHistoryFilterByStatusBloc extends Bloc<
    OrderHistoryFilterByStatusEvent, OrderHistoryFilterByStatusState> {
  OrderHistoryFilterByStatusBloc()
      : super(OrderHistoryFilterByStatusState.initial()) {
    on<OrderHistoryFilterByStatusEvent>(_onEvent);
  }
  Future<void> _onEvent(
    OrderHistoryFilterByStatusEvent event,
    Emitter<OrderHistoryFilterByStatusState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(
        OrderHistoryFilterByStatusState.initial(),
      ),
      checkedStatusFilter: (e) {
        if (e.isChecked) {
          emit(state.copyWith(
            filterByStatusName: [...state.filterByStatusName, e.statusName],
          ));
        } else {
          emit(
            state.copyWith(
              filterByStatusName: [...state.filterByStatusName]..remove(
                  e.statusName,
                ),
            ),
          );
        }
      },
    );
  }
}
