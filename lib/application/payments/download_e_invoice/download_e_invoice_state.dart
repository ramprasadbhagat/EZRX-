part of 'download_e_invoice_bloc.dart';

@freezed
class DownloadEInvoiceState with _$DownloadEInvoiceState {
  const DownloadEInvoiceState._();
  const factory DownloadEInvoiceState({
    required bool isFetching,
    required Option<Either<ApiFailure, dynamic>> failureOrSuccessOption,
    required DownloadPaymentAttachment eInvoice,
  }) = _DownloadEInvoiceState;

  factory DownloadEInvoiceState.initial() => DownloadEInvoiceState(
        isFetching: false,
        failureOrSuccessOption: none(),
        eInvoice: DownloadPaymentAttachment.empty(),
      );
  bool get isEligibileForEInvoiceButton => isFetching && eInvoice.url.isEmpty;
}
