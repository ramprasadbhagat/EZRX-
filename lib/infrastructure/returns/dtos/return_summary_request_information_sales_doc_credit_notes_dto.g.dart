// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_information_sales_doc_credit_notes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditNotesDto _$$_CreditNotesDtoFromJson(Map<String, dynamic> json) =>
    _$_CreditNotesDto(
      creditNoteId: json['creditNoteId'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) => MaterialsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_CreditNotesDtoToJson(_$_CreditNotesDto instance) =>
    <String, dynamic>{
      'creditNoteId': instance.creditNoteId,
      'materials': instance.materials.map((e) => e.toJson()).toList(),
    };
