// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_information_sales_doc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SalesDocDto _$$_SalesDocDtoFromJson(Map<String, dynamic> json) =>
    _$_SalesDocDto(
      invoiceNo: json['invoiceNo'] as String? ?? '',
      invoiceDate: json['invoiceDate'] as String? ?? '',
      bapiSalesDoc: json['bapiSalesDoc'] as String? ?? '',
      ezrxNumber: json['ezrxNumber'] as String? ?? '',
      creditNotes: (json['creditNotes'] as List<dynamic>?)
              ?.map((e) => CreditNotesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_SalesDocDtoToJson(_$_SalesDocDto instance) =>
    <String, dynamic>{
      'invoiceNo': instance.invoiceNo,
      'invoiceDate': instance.invoiceDate,
      'bapiSalesDoc': instance.bapiSalesDoc,
      'ezrxNumber': instance.ezrxNumber,
      'creditNotes': instance.creditNotes.map((e) => e.toJson()).toList(),
    };
