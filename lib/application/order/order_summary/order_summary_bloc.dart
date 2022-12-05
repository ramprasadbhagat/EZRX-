import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:ezrxmobile/presentation/orders/create_order/order_summary_page.dart';
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
          maxSteps: value.maxSteps,
          step: value.step,
          additionalDetailsStep: value.additionalDetailsStep,
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
      submitOrder: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isSubmitting: true,
            isSubmitSuccess: false,
          ),
        );
        final failureOrSuccess = await repository.submitOrder(
          shipToInfo: e.shipToInfo,
          user: e.user,
          cartItems: e.cartItems,
          grandTotal: e.grandTotal,
          customerCodeInfo: e.customerCodeInfo,
          salesOrganisation: e.salesOrganisation,
          data: e.data,
          orderType: e.orderType,
          configs: e.config,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
                isSubmitSuccess: false,
              ),
            );
          },
          (submitOrderResponse) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isSubmitting: false,
                isSubmitSuccess: true,
                submitOrderResponse: submitOrderResponse,
              ),
            );
          },
        );
      },
    );
  }
}
