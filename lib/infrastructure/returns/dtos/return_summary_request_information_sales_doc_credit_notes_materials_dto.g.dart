// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_information_sales_doc_credit_notes_materials_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditNotesDto _$$_CreditNotesDtoFromJson(Map<String, dynamic> json) =>
    _$_CreditNotesDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      lineNumber: json['lineNumber'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      qty: (json['qty'] as num?)?.toDouble() ?? 0.0,
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$_CreditNotesDtoToJson(_$_CreditNotesDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'lineNumber': instance.lineNumber,
      'materialDescription': instance.materialDescription,
      'qty': instance.qty,
      'value': instance.value,
    };
