import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/credit_and_invoice_item.dart';
import 'package:ezrxmobile/domain/payments/entities/customer_document_detail.dart';
import 'package:ezrxmobile/domain/payments/repository/i_credit_and_invoice_details_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_and_invoice_details_event.dart';
part 'credit_and_invoice_details_state.dart';
part 'credit_and_invoice_details_bloc.freezed.dart';

class CreditAndInvoiceDetailsBloc
    extends Bloc<CreditAndInvoiceDetailsEvent, CreditAndInvoiceDetailsState> {
  final ICreditAndInvoiceDetailsRepository creditAndInvoiceDetailsRepository;
  CreditAndInvoiceDetailsBloc({
    required this.creditAndInvoiceDetailsRepository,
  }) : super(CreditAndInvoiceDetailsState.initial()) {
    on<CreditAndInvoiceDetailsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    CreditAndInvoiceDetailsEvent event,
    Emitter<CreditAndInvoiceDetailsState> emit,
  ) async {
    await event.map(
      initialized: (_Initialized e) async =>
          emit(CreditAndInvoiceDetailsState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
          salesOrganisation: e.salesOrganisation,
          customerCodeInfo: e.customerCodeInfo,
          creditAndInvoiceItem: e.creditAndInvoiceItem,
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
