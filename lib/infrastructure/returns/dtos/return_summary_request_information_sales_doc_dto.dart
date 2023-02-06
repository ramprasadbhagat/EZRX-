import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc_credit_notes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_sales_doc_credit_notes_dto.dart';

part 'return_summary_request_information_sales_doc_dto.freezed.dart';
part 'return_summary_request_information_sales_doc_dto.g.dart';

@freezed
class SalesDocDto with _$SalesDocDto {
  const SalesDocDto._();

  const factory SalesDocDto({
    @JsonKey(name: 'invoiceNo', defaultValue: '') required String invoiceNo,
    @JsonKey(name: 'invoiceDate', defaultValue: '') required String invoiceDate,
    @JsonKey(name: 'bapiSalesDoc', defaultValue: '')
        required String bapiSalesDoc,
    @JsonKey(name: 'ezrxNumber', defaultValue: '') required String ezrxNumber,
    @JsonKey(name: 'creditNotes', defaultValue: [])
        required List<CreditNotesDto> creditNotes,
  }) = _SalesDocDto;
  factory SalesDocDto.fromDomain(SalesDoc salesDoc) {
    return SalesDocDto(
      invoiceNo: salesDoc.invoiceNo,
      invoiceDate: salesDoc.invoiceDate,
      bapiSalesDoc: salesDoc.bapiSalesDoc,
      ezrxNumber: salesDoc.ezrxNumber,
      creditNotes: salesDoc.creditNotes
          .map((e) => CreditNotesDto.fromDomain(e))
          .toList(),
    );
  }
  SalesDoc toDomain() {
    return SalesDoc(
      invoiceNo: invoiceNo,
      invoiceDate: invoiceDate,
      bapiSalesDoc: bapiSalesDoc,
      ezrxNumber: ezrxNumber,
      creditNotes: creditNotes.map((e) => e.toDomain()).toList(),
    );
  }

  factory SalesDocDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDocDtoFromJson(json);
}
