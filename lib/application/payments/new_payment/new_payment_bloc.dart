import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/account/entities/user.dart';
import 'package:ezrxmobile/domain/core/device/repository/i_device_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_open_item.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_info.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_invoice_info_pdf.dart';
import 'package:ezrxmobile/domain/payments/repository/i_new_payment_repository.dart';
import 'package:ezrxmobile/domain/payments/value/value_object.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_payment_bloc.freezed.dart';
part 'new_payment_event.dart';
part 'new_payment_state.dart';

class NewPaymentBloc extends Bloc<NewPaymentEvent, NewPaymentState> {
  final INewPaymentRepository newPaymentRepository;
  final IDeviceRepository deviceRepository;

  NewPaymentBloc({
    required this.newPaymentRepository,
    required this.deviceRepository,
  }) : super(NewPaymentState.initial()) {
    on(_onEvent);
  }

  Future<void> _onEvent(
    NewPaymentEvent event,
    Emitter<NewPaymentState> emit,
  ) async {
    await event.map(
      initialized: (_initialized e) async {
        emit(
          NewPaymentState.initial().copyWith(
            user: e.user,
            customerCodeInfo: e.customerCodeInfo,
            salesOrganisation: e.salesOrganisation,
            isFetchingPaymentMethod: true,
          ),
        );

        final failureOrSuccess = await newPaymentRepository.fetchPaymentMethods(
          salesOrganisation: state.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingPaymentMethod: false,
              ),
            );
          },
          (paymentMethods) {
            emit(
              state.copyWith(
                paymentMethods: paymentMethods,
                isFetchingPaymentMethod: false,
                selectedPaymentMethod:
                    paymentMethods.firstOrNull ?? PaymentMethodValue(''),
              ),
            );
          },
        );
      },
      updateAllInvoices: (_SelectAllInvoices e) {
        emit(
          state.copyWith(
            selectedInvoices: e.items,
          ),
        );
      },
      toggleInvoice: (_ToggleInvoice e) {
        if (e.selected) {
          emit(
            state.copyWith(
              selectedInvoices:
                  List<CustomerOpenItem>.from(state.selectedInvoices)
                    ..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedInvoices:
                  List<CustomerOpenItem>.from(state.selectedInvoices)
                    ..remove(e.item),
            ),
          );
        }
      },
      updateAllCredits: (_SelectAllCredits e) {
        emit(
          state.copyWith(
            selectedCredits: e.items,
          ),
        );
      },
      toggleCredit: (_ToggleCredit e) {
        if (e.selected) {
          emit(
            state.copyWith(
              selectedCredits:
                  List<CustomerOpenItem>.from(state.selectedCredits)
                    ..add(e.item),
            ),
          );
        } else {
          emit(
            state.copyWith(
              selectedCredits:
                  List<CustomerOpenItem>.from(state.selectedCredits)
                    ..remove(e.item),
            ),
          );
        }
      },
      pay: (_Pay e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isLoading: true,
          ),
        );

        final failureOrSuccess = await newPaymentRepository.pay(
          salesOrganisation: state.salesOrganisation,
          customerCodeInfo: state.customerCodeInfo,
          paymentMethod: state.selectedPaymentMethod.getValue(),
          customerOpenItems: state.selectedInvoices,
          user: state.user,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
          (paymentInfo) {
            emit(
              state.copyWith(
                paymentInfo: paymentInfo,
                failureOrSuccessOption: none(),
                isLoading: false,
              ),
            );
          },
        );
      },
      updatePaymentGateway: (_UpdatePaymentGateway e) async {
        if (state.salesOrganisation.salesOrg.needUpdatePaymentGateway) {
          await newPaymentRepository.updatePaymentGateway(
            salesOrganisation: state.salesOrganisation,
            uri: e.paymentUrl,
          );
        }
      },
      fetchInvoiceInfoPdf: (_FetchInvoiceInfoPdf e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isFetchingInvoiceInfoPdf: true,
          ),
        );
        final failureOrSuccess =
            await newPaymentRepository.getPaymentInvoiceInfoPdf(
          customerCodeInfo: state.customerCodeInfo,
          salesOrganisation: state.salesOrganisation,
          user: state.user,
          paymentInfo: state.paymentInfo,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(
              state.copyWith(
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isFetchingInvoiceInfoPdf: false,
              ),
            );
          },
          (invoiceInfoPdf) {
            emit(
              state.copyWith(
                paymentInvoiceInfoPdf: invoiceInfoPdf,
                isFetchingInvoiceInfoPdf: false,
              ),
            );
          },
        );
      },
      saveInvoicePdf: (_SaveInvoicePdf e) async {
        emit(
          state.copyWith(
            failureOrSuccessOption: none(),
            isSavingInvoicePdf: true,
          ),
        );
        final failureOrSuccessPermission =
            await deviceRepository.getSavePermission();
        await failureOrSuccessPermission.fold(
          (failure) async => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccessPermission),
              isSavingInvoicePdf: false,
            ),
          ),
          (success) async {
            final failureOrSuccessSave = await newPaymentRepository.saveFile(
              pdfData: e.dataInvoicePdf,
            );

            failureOrSuccessSave.fold(
              (failure) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: optionOf(failureOrSuccessSave),
                    isSavingInvoicePdf: false,
                  ),
                );
              },
              (success) {
                emit(
                  state.copyWith(
                    failureOrSuccessOption: none(),
                    isSavingInvoicePdf: false,
                  ),
                );
              },
            );
          },
        );
      },
      updatePaymentMethodSelected: (_UpdatePaymentMethodSelected e) {
        emit(
          state.copyWith(
            selectedPaymentMethod: e.paymentMethodSelected,
          ),
        );
      },
    );
  }
}
