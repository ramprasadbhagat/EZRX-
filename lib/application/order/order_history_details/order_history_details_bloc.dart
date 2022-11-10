import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_item.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_history__details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_history_details_event.dart';
part 'order_history_details_state.dart';
part 'order_history_details_bloc.freezed.dart';

class OrderHistoryDetailsBloc extends Bloc<OrderHistoryDetailsEvent, OrderHistoryDetailsState> {
  final IOrderHistoryDetailsRepository orderHistoryDetailsRepository;
  OrderHistoryDetailsBloc({
    required this.orderHistoryDetailsRepository,
  }) : super(OrderHistoryDetailsState.initial()) {
    on<OrderHistoryDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    OrderHistoryDetailsEvent event,
    Emitter<OrderHistoryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (e) async => emit(OrderHistoryDetailsState.initial()),
      fetch: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
            showErrorMessage: false,
            failureOrSuccessOption: none(),
          ),
        );
       
        final failureOrSuccess = await orderHistoryDetailsRepository.getOrderHistoryDetails(
          user: e.user,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
                showErrorMessage: true,
              ),
            );
          },
          (orderHistoryDetails) {
            emit(
              state.copyWith(
                orderHistoryDetails: orderHistoryDetails,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
