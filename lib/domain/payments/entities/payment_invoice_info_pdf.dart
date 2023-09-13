import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/payments/entities/payment_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_invoice_info_pdf.freezed.dart';

@freezed
class PaymentInvoiceInfoPdf with _$PaymentInvoiceInfoPdf {
  const PaymentInvoiceInfoPdf._();

  const factory PaymentInvoiceInfoPdf({
    required DateTimeStringValue valueDate,
    required String paymentID,
    required String zzAdvice,
    required String paymentDue,
    required String paymentMethod,
    required String customerName,
    required String payer,
    required String qrCode,
    required String paymentBatchAdditionalInfo,
    required List<PaymentItem> paymentItems,
    required String salesDistrict,
    required String footer,
    required String headerLogoPath,
    required String pleaseNote,
    required String header,
  }) = _PaymentInvoiceInfoPdf;

  factory PaymentInvoiceInfoPdf.empty() => PaymentInvoiceInfoPdf(
        valueDate: DateTimeStringValue(''),
        paymentID: '',
        zzAdvice: '',
        paymentDue: '',
        paymentMethod: '',
        customerName: '',
        payer: '',
        qrCode: '',
        paymentBatchAdditionalInfo: '',
        paymentItems: <PaymentItem>[],
        salesDistrict: '',
        footer: '',
        headerLogoPath: '',
        pleaseNote: '',
        header: '',
      );
}
