import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/additional_details_data.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
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
      initialized: (value) async {
        emit(state.copyWith(
          isSubmitSuccess: false,
          maxSteps: value.maxSteps,
          step: value.step,
          additionalDetailsStep: value.additionalDetailsStep,
        ));
      },
      stepContinue: (value) async {
        emit(state.copyWith(
          apiFailureOrSuccessOption: none(),
          step: state.step < state.maxSteps ? state.step + 1 : state.step,
        ));
      },
      stepCancel: (value) async {
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
      submitOrder: (value) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isSubmitting: true,
          ),
        );
        final failureOrSuccess = await repository.submitOrder(
          shipToInfo: value.shipToInfo,
          user: value.user,
          cartItems: value.cartItems,
          grandTotal: value.grandTotal,
          customerCodeInfo: value.customerCodeInfo,
          salesOrganisation: value.salesOrganisation,
          data: value.data,
          orderType: value.orderType,
          configs: value.config,
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
