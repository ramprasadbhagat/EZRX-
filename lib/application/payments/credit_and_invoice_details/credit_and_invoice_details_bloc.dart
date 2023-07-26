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
    on(_onEvent);
  }

  Future<void> _onEvent(
    CreditAndInvoiceDetailsEvent event,
    Emitter<CreditAndInvoiceDetailsState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(CreditAndInvoiceDetailsState.initial()),
      fetch: (value) async {
        emit(
          state.copyWith(
            isLoading: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess =
            await creditAndInvoiceDetailsRepository.getCreditAndInvoiceDetails(
          salesOrganisation: value.salesOrganisation,
          customerCodeInfo: value.customerCodeInfo,
          creditAndInvoiceItem: value.creditAndInvoiceItem,
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
                failureOrSuccessOption: optionOf(failureOrSuccess),
                isLoading: false,
              ),
            );
          },
        );
      },
    );
  }
}
