

import 'package:ezrxmobile/domain/returns/entities/return_summary_request_information_sales_doc_credit_notes_materials.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_summary_request_information_sales_doc_credit_notes_materials_dto.freezed.dart';
part 'return_summary_request_information_sales_doc_credit_notes_materials_dto.g.dart';

@freezed
class MaterialsDto with _$MaterialsDto {
  const MaterialsDto._();

  const factory MaterialsDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'lineNumber', defaultValue: '') required String lineNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'qty', defaultValue: 0.0) required double qty,
    @JsonKey(name: 'value', defaultValue: 0.0) required double value,
  }) = _CreditNotesDto;

  factory MaterialsDto.fromDomain(Materials materials) {
    return MaterialsDto(
      materialNumber: materials.materialNumber,
      lineNumber: materials.lineNumber,
      materialDescription: materials.materialDescription,
      qty: materials.qty,
      value: materials.value,
    );
  }
  Materials toDomain() {
    return Materials(
      materialNumber: materialNumber,
      lineNumber: lineNumber,
      materialDescription: materialDescription,
      qty: qty,
      value: value,
    );
  }

  factory MaterialsDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialsDtoFromJson(json);
}
