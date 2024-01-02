import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/customer_code_info.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:ezrxmobile/domain/payments/repository/i_e_invoice_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'download_e_invoice_event.dart';
part 'download_e_invoice_state.dart';
part 'download_e_invoice_bloc.freezed.dart';

class DownloadEInvoiceBloc
    extends Bloc<DownloadEInvoiceEvent, DownloadEInvoiceState> {
  final IEInvoiceRepository repository;
  DownloadEInvoiceBloc({required this.repository})
      : super(DownloadEInvoiceState.initial()) {
    on<DownloadEInvoiceEvent>(_onEvent);
  }

  Future<void> _onEvent(
    DownloadEInvoiceEvent event,
    Emitter<DownloadEInvoiceState> emit,
  ) async {
    await event.map(
      initialized: (_) async => emit(DownloadEInvoiceState.initial()),
      fetch: (_Fetch e) async {
        emit(
          state.copyWith(
            isFetching: true,
            failureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccess = await repository.getEInvoice(
          customerCodeInfo: e.customerCodeInfo,
          salesOrg: e.salesOrg,
          invoiceNumber: e.invoiceNumber,
        );
        failureOrSuccess.fold(
          (failure) => emit(
            state.copyWith(
              failureOrSuccessOption: optionOf(failureOrSuccess),
              isFetching: false,
            ),
          ),
          (eInvoice) => emit(
            state.copyWith(
              failureOrSuccessOption: none(),
              isFetching: false,
              eInvoice: eInvoice,
            ),
          ),
        );
      },
    );
  }
}
