part of 'download_payment_attachments_bloc.dart';

@freezed
class DownloadPaymentAttachmentEvent with _$DownloadPaymentAttachmentEvent {
  const factory DownloadPaymentAttachmentEvent.initialized({
    required CustomerCodeInfo customerCodeInfo,
    required SalesOrganisation salesOrganization,
  }) = _Initialized;
  const factory DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl({
    required AllInvoicesFilter queryObject,
  }) = _FetchAllInvoiceUrl;

  const factory DownloadPaymentAttachmentEvent.fetchAllCreditUrl({
    required AllCreditsFilter queryObject,
  }) = _FetchAllCreditUrl;

  const factory DownloadPaymentAttachmentEvent.fetchFullSummaryUrl({
    required FullSummaryFilter queryObject,
  }) = _FetchFullSummaryUrl;

  const factory DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl() =
      _FetchPaymentSummaryUrl;

  const factory DownloadPaymentAttachmentEvent.downloadPaymentAttachment({
    required DownloadPaymentAttachment files,
  }) = _DownloadPaymentAttachment;

  const factory DownloadPaymentAttachmentEvent.downloadSOA({
    required SoaData soaData,
  }) = _DownloadSOA;
  const factory DownloadPaymentAttachmentEvent.downloadEInvoice({
    required DownloadPaymentAttachment eInvoice,
  }) = _DownloadEInvoice;

  const factory DownloadPaymentAttachmentEvent.downloadECredit({
    required String eCredit,
  }) = _DownloadECredit;
}
