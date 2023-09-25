import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_details_event.dart';
part 'payment_summary_details_state.dart';
part 'payment_summary_details_bloc.freezed.dart';

class PaymentSummaryDetailsBloc
    extends Bloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState> {
  final IPaymentSummaryDetailsRepository paymentItemRepository;
  PaymentSummaryDetailsBloc({required this.paymentItemRepository})
      : super(PaymentSummaryDetailsState.initial()) {
    on<PaymentSummaryDetailsEvent>(_onEvent);
  }
  Future<void> _onEvent(
    PaymentSummaryDetailsEvent event,
    Emitter<PaymentSummaryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(PaymentSummaryDetailsState.initial()),
      fetchPaymentSummaryDetailsInfo: (event) async {
        if (!event.paymentSummaryDetails.paymentBatchAdditionalInfo.isValid()) {
          emit(
            state.copyWith(
              isDetailFetching: true,
              failureOrSuccessOption: none(),
            ),
          );
          final failureOrSuccess =
              await paymentItemRepository.fetchPaymentSummaryDetailsInfo(
            customerCodeInfo: event.customerCodeInfo,
            salesOrganization: event.salesOrganization,
            paymentId: event.paymentSummaryDetails.paymentID,
          );
          failureOrSuccess.fold(
            (failure) {
              emit(
                state.copyWith(
                  failureOrSuccessOption: optionOf(failureOrSuccess),
                  isDetailFetching: false,
                ),
              );
            },
            (paymentSummaryDetails) {
              emit(
                state.copyWith(
                  paymentSummaryDetails: paymentSummaryDetails,
                  isDetailFetching: false,
                ),
              );
              if (paymentSummaryDetails.paymentBatchAdditionalInfo.isValid()) {
                add(
                  PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
                    customerCodeInfo: event.customerCodeInfo,
                    salesOrganization: event.salesOrganization,
                    paymentSummaryDetails: paymentSummaryDetails,
                  ),
                );
              }
            },
          );
        } else {
          emit(
            state.copyWith(
              paymentSummaryDetails: event.paymentSummaryDetails,
            ),
          );
          add(
            PaymentSummaryDetailsEvent.fetchPaymentSummaryList(
              customerCodeInfo: event.customerCodeInfo,
              salesOrganization: event.salesOrganization,
              paymentSummaryDetails: event.paymentSummaryDetails,
            ),
          );
        }
      },
      fetchPaymentSummaryList: (event) async {
        emit(state.copyWith(isListLoading: true));
        final failureOrSuccess = await paymentItemRepository.fetchPaymentList(
          customerCodeInfo: event.customerCodeInfo,
          salesOrganization: event.salesOrganization,
          paymentSummaryDetails: event.paymentSummaryDetails,
        );
        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isListLoading: false,
              ),
            );
          },
          (paymentItemList) => emit(
            state.copyWith(
              paymentItemList: paymentItemList,
              failureOrSuccessOption: none(),
              isListLoading: false,
            ),
          ),
        );
      },
    );
  }
}
