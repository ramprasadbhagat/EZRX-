import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation_configs.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/aggregate/price_aggregate.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/order/entities/delivery_info_data.dart';
import 'package:ezrxmobile/domain/order/entities/order_document_type.dart';
import 'package:ezrxmobile/domain/order/entities/order_history_details.dart';
import 'package:ezrxmobile/domain/order/entities/submit_order_response.dart';
import 'package:ezrxmobile/domain/order/repository/i_order_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/order/entities/order_history_details_po_documents.dart';

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
        emit(
          OrderSummaryState.initial().copyWith(
            user: value.user,
            shipToInfo: value.shipToInfo,
            salesOrg: value.salesOrg,
            customerCodeInfo: value.customerCodeInfo,
            salesOrgConfig: value.salesOrgConfig,
            orderDocumentType: value.orderDocumentType,
            salesOrganisation: value.salesOrganisation,
          ),
        );
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
          shipToInfo: state.shipToInfo,
          user: state.user,
          cartProducts: value.cartProducts,
          grandTotal: value.grandTotal,
          orderValue: value.orderValue,
          smallOrderFee: value.smallOrderFee,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          data: value.data,
          orderDocumentType: state.orderDocumentType,
          configs: state.salesOrgConfig,
          totalTax: value.totalTax,
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
                isConfirming: true,
                submitOrderResponse: submitOrderResponse,
                orderHistoryDetails: OrderHistoryDetails.empty(),
              ),
            );
          },
        );
      },
      orderConfirmationDetail: (e) async {
        emit(
          state.copyWith(
            apiFailureOrSuccessOption: none(),
            isConfirming: true,
          ),
        );

        final failureOrSuccess = await repository.getOrderConfirmationDetail(
          orderResponse: state.submitOrderResponse,
          user: state.user,
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          cartProducts: e.priceAggregate,
          shipToInfo: state.shipToInfo,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isConfirming: false,
              ),
            );
          },
          (orderConfirmationDetail) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isConfirming: true,
                orderHistoryDetails: orderConfirmationDetail,
              ),
            );
            add(
              OrderSummaryEvent.confirmedOrderStockInfo(
                orderHistoryDetails: orderConfirmationDetail,
                priceAggregate: e.priceAggregate,
              ),
            );
          },
        );
      },
      confirmedOrderStockInfo: (e) async {
        final failureOrSuccess = await repository.getConfirmedOrderStockInfo(
          customerCodeInfo: state.customerCodeInfo,
          orderHistoryDetails: e.orderHistoryDetails,
          salesOrg: state.salesOrg,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: optionOf(failureOrSuccess),
                isConfirming: false,
              ),
            );
          },
          (stockInfoList) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption: none(),
                isConfirming: false,
                orderHistoryDetails: e.orderHistoryDetails.copyWithStock(
                  stockInfoList: stockInfoList,
                  orderHistoryDetailsOrderItem:
                      e.orderHistoryDetails.orderHistoryDetailsOrderItem,
                  priceAggregate: e.priceAggregate,
                  salesOrganisationConfigs: state.salesOrgConfig,
                ),
              ),
            );
          },
        );
      },
      updateIsExpanded: (e) async =>
          emit(state.copyWith(isExpanded: e.isExpanded)),
    );
  }
}
