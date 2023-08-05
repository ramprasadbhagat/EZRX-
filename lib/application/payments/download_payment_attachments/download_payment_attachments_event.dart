part of 'download_payment_attachments_bloc.dart';

@freezed
class DownloadPaymentAttachmentEvent with _$DownloadPaymentAttachmentEvent {
  const factory DownloadPaymentAttachmentEvent.fetchAllInvoiceUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllInvoicesFilter queryObject,
  }) = _FetchAllInvoiceUrl;

  const factory DownloadPaymentAttachmentEvent.fetchAllCreditUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
    required AllCreditsFilter queryObject,
  }) = _FetchAllCreditUrl;

  const factory DownloadPaymentAttachmentEvent.fetchPaymentSummaryUrl({
    required SalesOrganisation salesOrganization,
    required CustomerCodeInfo customerCodeInfo,
  }) = _FetchPaymentSummaryUrl;

  const factory DownloadPaymentAttachmentEvent.downloadPaymentAttachment({
    required DownloadPaymentAttachment files,
  }) = _DownloadPaymentAttachment;

  const factory DownloadPaymentAttachmentEvent.downloadSOA({
    required SoaData soaData,
  }) = _DownloadSOA;
}
