import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';

import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';

import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_repository.dart';

part 'payment_summary_event.dart';
part 'payment_summary_state.dart';
part 'payment_summary_bloc.freezed.dart';

int _pageSize = 20;

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
        emit(state.copyWith(
          isFetching: true,
          canLoadMorePaymentSummary: true,
          paymentSummaryList: [],
          failureOrSuccessOption: none(),
        ));

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganization: e.salesOrganization,
          offset: state.paymentSummaryList.length,
          pageSize: _pageSize,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ));
          },
          (paymentSummary) => emit(state.copyWith(
            paymentSummaryList: paymentSummary,
            isFetching: false,
            failureOrSuccessOption: none(),
          )),
        );
      },
      loadMorePaymentSummary: (e) async {
        if (state.isFetching || !state.canLoadMorePaymentSummary) return;

        emit(state.copyWith(
          isFetching: true,
          failureOrSuccessOption: none(),
        ));

        final failureOrSuccess =
            await paymentSummaryRepository.fetchPaymentSummaryList(
          customerCodeInfo: e.customerCodeInfo,
          salesOrganization: e.salesOrganization,
          offset: state.paymentSummaryList.length,
          pageSize: _pageSize,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ));
          },
          (paymentSummary) {
            final loadedPaymentSummaryList =
                List<PaymentSummaryDetails>.from(state.paymentSummaryList)
                  ..addAll(paymentSummary);
            emit(state.copyWith(
              paymentSummaryList: loadedPaymentSummaryList,
              isFetching: false,
              canLoadMorePaymentSummary: paymentSummary.length >= _pageSize,
              failureOrSuccessOption: none(),
            ));
          },
        );
      },
    );
  }
}
