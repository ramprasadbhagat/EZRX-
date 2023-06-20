// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_details_order_header_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryDetailsOrderHeadersDto
    _$$_OrderHistoryDetailsOrderHeadersDtoFromJson(Map<String, dynamic> json) =>
        _$_OrderHistoryDetailsOrderHeadersDto(
          totalTax: (json['TotalTax'] as num?)?.toDouble() ?? 0.0,
          requestedDeliveryDate: json['RequestedDeliveryDate'] as String? ?? '',
          type: json['Type'] as String? ?? '',
          telephoneNumber: json['TelephoneNumber'] as String? ?? '',
          orderValue: (json['OrderValue'] as num?)?.toDouble() ?? 0.0,
          createdDate: json['CreatedDate'] as String? ?? '',
          eZRXNumber: json['EZRXNumber'] as String? ?? '',
          orderBy: json['OrderBy'] as String? ?? '',
          referenceNotes: json['ReferenceNotes'] as String? ?? '',
          orderReason: json['OrderReason'] as String? ?? '',
          companyName: json['CompanyName'] as String? ?? '',
          hasPOAttachment: json['HasPOAttachment'] as bool? ?? false,
          itmDescription: json['ItmDescription'] as String? ?? '',
          materialCount: json['MaterialCount'] as int? ?? 0,
          createdTime: json['CreatedTime'] as String? ?? '',
          orderNumber: json['OrderNumber'] as String? ?? '',
          pOReference: json['POReference'] as String? ?? '',
          shipTo: json['ShipTo'] as String? ?? '',
          soldTo: json['SoldTo'] as String? ?? '',
        );

Map<String, dynamic> _$$_OrderHistoryDetailsOrderHeadersDtoToJson(
        _$_OrderHistoryDetailsOrderHeadersDto instance) =>
    <String, dynamic>{
      'TotalTax': instance.totalTax,
      'RequestedDeliveryDate': instance.requestedDeliveryDate,
      'Type': instance.type,
      'TelephoneNumber': instance.telephoneNumber,
      'OrderValue': instance.orderValue,
      'CreatedDate': instance.createdDate,
      'EZRXNumber': instance.eZRXNumber,
      'OrderBy': instance.orderBy,
      'ReferenceNotes': instance.referenceNotes,
      'OrderReason': instance.orderReason,
      'CompanyName': instance.companyName,
      'HasPOAttachment': instance.hasPOAttachment,
      'ItmDescription': instance.itmDescription,
      'MaterialCount': instance.materialCount,
      'CreatedTime': instance.createdTime,
      'OrderNumber': instance.orderNumber,
      'POReference': instance.pOReference,
      'ShipTo': instance.shipTo,
      'SoldTo': instance.soldTo,
    };
