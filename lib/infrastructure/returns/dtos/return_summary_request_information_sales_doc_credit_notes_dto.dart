import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc_credit_notes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ezrxmobile/infrastructure/returns/dtos/return_summary_request_information_sales_doc_credit_notes_materials_dto.dart';
part 'return_summary_request_information_sales_doc_credit_notes_dto.freezed.dart';
part 'return_summary_request_information_sales_doc_credit_notes_dto.g.dart';

@freezed
class CreditNotesDto with _$CreditNotesDto {
  const CreditNotesDto._();

  const factory CreditNotesDto({
    @JsonKey(name: 'creditNoteId', defaultValue: '')
        required String creditNoteId,
    @JsonKey(name: 'materials', defaultValue: [])
        required List<MaterialsDto> materials,
  }) = _CreditNotesDto;

  factory CreditNotesDto.fromDomain(CreditNotes creditNotes) {
    return CreditNotesDto(
      creditNoteId: creditNotes.creditNoteId,
      materials:
          creditNotes.materials.map((e) => MaterialsDto.fromDomain(e)).toList(),
    );
  }
  CreditNotes toDomain() {
    return CreditNotes(
      creditNoteId: creditNoteId,
      materials: materials.map((e) => e.toDomain()).toList(),
    );
  }

  factory CreditNotesDto.fromJson(Map<String, dynamic> json) =>
      _$CreditNotesDtoFromJson(json);
}
