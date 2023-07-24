import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
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
      initialized: (value) {
        emit(OrderSummaryState.initial());
      },
      submitOrder: (value) async {
        if (state.isSubmitting) return;
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isSubmitting: true,
          ),
        );
        final failureOrSuccess = await repository.submitOrder(
          shipToInfo: value.shipToInfo,
          user: value.user,
          cartProducts: value.cartProducts,
          grandTotal: value.grandTotal,
          orderValue: value.orderValue,
          customerCodeInfo: value.customerCodeInfo,
          salesOrganisation: value.salesOrganisation,
          data: value.data,
          orderDocumentType: value.orderDocumentType,
          configs: value.config,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isSubmitting: false,
              ),
            );
          },
          (submitOrderResponse) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isSubmitting: false,
                submitOrderResponse: submitOrderResponse,
              ),
            );
          },
        );
      },
    );
  }
}
