// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_document_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerDocumentDetailDto _$$_CustomerDocumentDetailDtoFromJson(
        Map<String, dynamic> json) =>
    _$_CustomerDocumentDetailDto(
      billingDocumentItem: json['billingDocumentItem'] as String? ?? '',
      salesDocumentItemType: json['salesDocumentItemType'] as String? ?? '',
      materialNumber: json['material'] as String? ?? '',
      billingDocumentItemText: json['billingDocumentItemText'] as String? ?? '',
      billingQuantity: json['billingQuantity'] as String? ?? '',
      billingQuantityUnit: json['billingQuantityUnit'] as String? ?? '',
      salesMeasureISOUnit: json['salesMeasureISOUnit'] as String? ?? '',
      referenceSDDocument: json['referenceSDDocument'] as String? ?? '',
      referenceSDDocumentItem: json['referenceSDDocumentItem'] as String? ?? '',
      referenceSDDocumentCategory:
          json['referenceSDDocumentCategory'] as String? ?? '',
      grossAmount: (json['grossAmount'] as num?)?.toDouble() ?? 0.0,
      netAmount: (json['netAmount'] as num?)?.toDouble() ?? 0.0,
      taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
      batchNumber: json['batchNumber'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      principalName: json['principalName'] as String? ?? '',
    );

Map<String, dynamic> _$$_CustomerDocumentDetailDtoToJson(
        _$_CustomerDocumentDetailDto instance) =>
    <String, dynamic>{
      'billingDocumentItem': instance.billingDocumentItem,
      'salesDocumentItemType': instance.salesDocumentItemType,
      'material': instance.materialNumber,
      'billingDocumentItemText': instance.billingDocumentItemText,
      'billingQuantity': instance.billingQuantity,
      'billingQuantityUnit': instance.billingQuantityUnit,
      'salesMeasureISOUnit': instance.salesMeasureISOUnit,
      'referenceSDDocument': instance.referenceSDDocument,
      'referenceSDDocumentItem': instance.referenceSDDocumentItem,
      'referenceSDDocumentCategory': instance.referenceSDDocumentCategory,
      'grossAmount': instance.grossAmount,
      'netAmount': instance.netAmount,
      'taxAmount': instance.taxAmount,
      'batchNumber': instance.batchNumber,
      'expiryDate': instance.expiryDate,
      'principalName': instance.principalName,
    };
