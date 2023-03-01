// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_summary_request_items_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReturnSummaryRequestItemsDto _$$_ReturnSummaryRequestItemsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_ReturnSummaryRequestItemsDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      status: json['status'] as String? ?? '',
      materialName: json['materialName'] as String? ?? '',
      returnQty: json['returnQty'] as String? ?? '',
      unitPrice: json['unitPrice'] as String? ?? '',
      total: json['total'] as String? ?? '',
    );

Map<String, dynamic> _$$_ReturnSummaryRequestItemsDtoToJson(
        _$_ReturnSummaryRequestItemsDto instance) =>
    <String, dynamic>{
      'materialNumber': instance.materialNumber,
      'status': instance.status,
      'materialName': instance.materialName,
      'returnQty': instance.returnQty,
      'unitPrice': instance.unitPrice,
      'total': instance.total,
    };
