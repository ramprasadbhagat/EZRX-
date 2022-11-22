import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_summary_event.dart';
part 'order_summary_state.dart';
part 'order_summary_bloc.freezed.dart';

class OrderSummaryBloc extends Bloc<OrderSummaryEvent, OrderSummaryState> {
  final IOrderRepository repository;
  OrderSummaryBloc({
    required this.repository,
  }) : super(OrderSummaryState.initial()) {
    on<OrderSummaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderSummaryEvent event,
    Emitter<OrderSummaryState> emit,
  ) async {
    await event.map(
      initialized: (value) {
        emit(state.copyWith(
          maxSteps: 4,
          step: 0,
        ));
      },
      stepContinue: (value) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          step: state.step < state.maxSteps ? state.step + 1 : 0,
        ));
      },
      stepCancel: (value) {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          step: state.step - 1 >= 0 ? state.step - 1 : 0,
        ));
      },
      stepTapped: (value) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          step: value.step,
        ));
      },
    );
  }
}
