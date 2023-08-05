import 'package:ezrxmobile/domain/payments/entities/payment_summary_details_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

part 'payment_summary_event.dart';
part 'payment_summary_state.dart';
part 'payment_summary_bloc.freezed.dart';

int _pageSize = 24;

class PaymentSummaryBloc
    extends Bloc<PaymentSummaryEvent, PaymentSummaryState> {
  final IPaymentSummaryRepository paymentSummaryRepository;

  PaymentSummaryBloc({required this.paymentSummaryRepository})
      : super(PaymentSummaryState.initial()) {
    on<PaymentSummaryEvent>(_onEvent);
  }

  Future<void> _onEvent(
    PaymentSummaryEvent event,
    Emitter<PaymentSummaryState> emit,
  ) async {
    await event.map(
      fetchPaymentSummaryList: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            canLoadMorePaymentSummary: true,
            paymentSummaryDetailsResponse:
                PaymentSummaryDetailsResponse.empty(),
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganization: e.salesOrganization,
          offset: state.paymentSummaryDetailsResponse.paymentSummaryList.length,
          pageSize: _pageSize,
          paymentSummaryDetails: state.paymentSummaryDetailsResponse,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (paymentSummaryDetailsResponse) => emit(
            state.copyWith(
              paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
              isFetching: false,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
      loadMorePaymentSummary: (e) async {
        if (state.isFetching || !state.canLoadMorePaymentSummary) return;

        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganization: e.salesOrganization,
          offset: state.paymentSummaryDetailsResponse.paymentSummaryList.length,
          pageSize: _pageSize,
          paymentSummaryDetails: state.paymentSummaryDetailsResponse,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (paymentSummaryDetailsResponse) => emit(
            state.copyWith(
              paymentSummaryDetailsResponse: paymentSummaryDetailsResponse,
              isFetching: false,
              canLoadMorePaymentSummary:
                  paymentSummaryDetailsResponse.paymentSummaryList.length >=
                      _pageSize,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
    );
  }
}
