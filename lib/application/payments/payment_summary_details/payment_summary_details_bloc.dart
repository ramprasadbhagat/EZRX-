import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/ship_to_info.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_summary_details.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:ezrxmobile/domain/payments/repository/i_payment_summary_details_repository.dart';
import 'package:ezrxmobile/presentation/payments/payment_advice_created/widgets/create_payment_invoice_pdf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_summary_details_event.dart';
part 'payment_summary_details_state.dart';
part 'payment_summary_details_bloc.freezed.dart';

class PaymentSummaryDetailsBloc
    extends Bloc<PaymentSummaryDetailsEvent, PaymentSummaryDetailsState> {
  final IPaymentSummaryDetailsRepository paymentItemRepository;
  final INewPaymentRepository newPaymentRepository;
  final IDeviceRepository deviceRepository;
  PaymentSummaryDetailsBloc({
    required this.paymentItemRepository,
    required this.newPaymentRepository,
    required this.deviceRepository,
  }) : super(PaymentSummaryDetailsState.initial()) {
    on<PaymentSummaryDetailsEvent>(_onEvent);
  }
  Future<void> _onEvent(
    PaymentSummaryDetailsEvent event,
    Emitter<PaymentSummaryDetailsState> emit,
  ) async {
    await event.map(
      initialized: (event) async => emit(
        PaymentSummaryDetailsState.initial().copyWith(
          customerCodeInfo: event.customerCodeInfo,
          salesOrganization: event.salesOrganization,
          user: event.user,
          shipToInfo: event.shipToInfo,
        ),
      ),
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
            customerCodeInfo: state.customerCodeInfo,
            salesOrganization: state.salesOrganization,
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
                  const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(),
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
            const PaymentSummaryDetailsEvent.fetchPaymentSummaryList(),
          );
        }
      },
      fetchPaymentSummaryList: (event) async {
        emit(state.copyWith(isListLoading: true));
        final failureOrSuccess = await paymentItemRepository.fetchPaymentList(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganization: state.salesOrganization,
          paymentSummaryDetails: state.paymentSummaryDetails,
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
          (paymentItemList) {
            add(const PaymentSummaryDetailsEvent.fetchAdvice());
            emit(
              state.copyWith(
                paymentItemList: paymentItemList,
                failureOrSuccessOption: none(),
                isListLoading: false,
              ),
            );
          },
        );
      },
      saveAdvice: (e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isSavingAdvice: true,
          ),
        );
        final failureOrSuccessPermission =
            await deviceRepository.getSavePermission();
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              isSavingAdvice: false,
            ),
          ),
          (success) async {
            final failureOrSuccessSave = await newPaymentRepository.saveFile(
              pdfData: await CreatePaymentInvoicePdf().createInvoicePdf(
                paymentInvoiceInfoPdf: state.paymentInvoiceInfoPdf,
                shipToInfo: state.shipToInfo,
                salesOrganisation: state.salesOrganization,
              ),
            );

            failureOrSuccessSave.fold(
              (failure) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(failureOrSuccessSave),
                    isSavingAdvice: false,
                  ),
                );
              },
              (success) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: none(),
                    isSavingAdvice: false,
                  ),
                );
              },
            );
          },
        );
      },
      fetchAdvice: (_) async {
        emit(state.copyWith(isFetchingAdvice: true));
        final paymentSummaryDetails = state.paymentSummaryDetails;
        final customerPaymentInfo = CustomerPaymentInfo.empty().copyWith(
          paymentBatchAdditionalInfo:
              paymentSummaryDetails.paymentBatchAdditionalInfo.getValue(),
          paymentID: paymentSummaryDetails.paymentID.getValue(),
          accountingDocExternalReference:
              paymentSummaryDetails.accountingDocExternalReference,
        );
        final failureOrSuccess =
            await newPaymentRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganization,
          user: state.user,
          paymentInfo: customerPaymentInfo,
        );
        failureOrSuccess.fold(
          (failure) => {
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetchingAdvice: false,
            ),
          },
          (invoiceInfoPdf) {
            emit(
              state.copyWith(
                paymentInvoiceInfoPdf: invoiceInfoPdf,
                isFetchingAdvice: false,
              ),
            );
          },
        );
      },
      deleteAdvice: (_) async {
        emit(
          state.copyWith(
            isDeletingPayment: true,
          ),
        );

        final failureOrSuccess =
            await paymentItemRepository.deletePaymentAdvice(
          salesOrganization: state.salesOrganization,
          customerCodeInfo: state.customerCodeInfo,
          shipToInfo: state.shipToInfo,
          paymentSummaryDetails: state.paymentSummaryDetails,
        );

        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              isDeletingPayment: false,
              failureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          ),
          (deleteResponse) => emit(
            state.copyWith(
              isDeletingPayment: false,
              failureOrSuccessOption: none(),
            ),
          ),
        );
      },
    );
  }
}
