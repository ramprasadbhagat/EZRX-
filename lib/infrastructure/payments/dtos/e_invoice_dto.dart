import 'package:ezrxmobile/domain/payments/entities/download_payment_attachments.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_invoice_dto.freezed.dart';
part 'e_invoice_dto.g.dart';

@freezed
class EInvoiceDto with _$EInvoiceDto {
  const EInvoiceDto._();
  factory EInvoiceDto({
    @JsonKey(name: 'name', defaultValue: '') required String name,
  }) = _EInvoiceDto;

  factory EInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$EInvoiceDtoFromJson(json);

  DownloadPaymentAttachment toDomain() => DownloadPaymentAttachment(url: name);
}
