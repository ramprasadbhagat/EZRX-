// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_po_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminPoAttachmentDto _$$_AdminPoAttachmentDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AdminPoAttachmentDto(
      salesOrderNumber: json['salesOrderNumber'] as String? ?? '',
      ezrxReferenceNumber: json['ezrxReferenceNumber'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      createdTime: json['createdTime'] as String? ?? '',
      documentUrl: json['documentUrl'] as String? ?? '',
      documentName: json['documentName'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      soldToCode: json['soldToCode'] as String? ?? '',
      shipToCode: json['shipToCode'] as String? ?? '',
      tempOrderNumber: json['tempOrderNumber'] as String? ?? '',
    );

Map<String, dynamic> _$$_AdminPoAttachmentDtoToJson(
        _$_AdminPoAttachmentDto instance) =>
    <String, dynamic>{
      'salesOrderNumber': overrideToJson(instance.salesOrderNumber),
      'ezrxReferenceNumber': overrideToJson(instance.ezrxReferenceNumber),
      'createdBy': overrideToJson(instance.createdBy),
      'createdTime': overrideToJson(instance.createdTime),
      'documentUrl': overrideToJson(instance.documentUrl),
      'documentName': overrideToJson(instance.documentName),
      'salesOrg': overrideToJson(instance.salesOrg),
      'soldToCode': overrideToJson(instance.soldToCode),
      'shipToCode': overrideToJson(instance.shipToCode),
      'tempOrderNumber': overrideToJson(instance.tempOrderNumber),
    };
