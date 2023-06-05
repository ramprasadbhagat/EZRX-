import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/repository/i_invoice_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoices_details_event.dart';
part 'invoices_details_state.dart';
part 'invoice_details_bloc.freezed.dart';

class InvoiceDetailsBloc
    extends Bloc<InvoiceDetailsEvent, InvoiceDetailsState> {
  final IInvoiceDetailsRepository invoiceDetailsRepository;
  InvoiceDetailsBloc({
    required this.invoiceDetailsRepository,
  }) : super(InvoiceDetailsState.initial()) {
    on<InvoiceDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    InvoiceDetailsEvent event,
    Emitter<InvoiceDetailsState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async =>
          emit(InvoiceDetailsState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await invoiceDetailsRepository.getInvoiceDetails(
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          invoiceItem: e.invoiceItem,
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
          (data) {
            emit(
              state.copyWith(
                details: data,
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
