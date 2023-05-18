import 'package:ezrxmobile/domain/payments/entities/customer_document_header.dart';
import 'package:ezrxmobile/infrastructure/payments/dtos/credit_and_invoice_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_document_header_dto.freezed.dart';
part 'customer_document_header_dto.g.dart';

@freezed
class CustomerDocumentHeaderDto with _$CustomerDocumentHeaderDto {
  const CustomerDocumentHeaderDto._();
  factory CustomerDocumentHeaderDto({
    @JsonKey(
      name: 'documentHeaderList',
      defaultValue: <CreditAndInvoiceItemDto>[],
    )
        required List<CreditAndInvoiceItemDto> invoices,
    @JsonKey(
      name: 'totalCount',
      defaultValue: 0,
    )
        required int totalCount,
  }) = _CustomerDocumentHeaderDto;

  CustomerDocumentHeader toDomain() {
    return CustomerDocumentHeader(
      invoices: invoices.map((e) => e.toDomain()).toList(),
      totalCount: totalCount,
    );
  }

  factory CustomerDocumentHeaderDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDocumentHeaderDtoFromJson(json);
}
