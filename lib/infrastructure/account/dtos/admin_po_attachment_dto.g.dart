// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_po_attachment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPoAttachmentDtoImpl _$$AdminPoAttachmentDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminPoAttachmentDtoImpl(
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

Map<String, dynamic> _$$AdminPoAttachmentDtoImplToJson(
        _$AdminPoAttachmentDtoImpl instance) =>
    <String, dynamic>{
      'salesOrderNumber': valueOrNullToJson(instance.salesOrderNumber),
      'ezrxReferenceNumber': valueOrNullToJson(instance.ezrxReferenceNumber),
      'createdBy': valueOrNullToJson(instance.createdBy),
      'createdTime': valueOrNullToJson(instance.createdTime),
      'documentUrl': valueOrNullToJson(instance.documentUrl),
      'documentName': valueOrNullToJson(instance.documentName),
      'salesOrg': valueOrNullToJson(instance.salesOrg),
      'soldToCode': valueOrNullToJson(instance.soldToCode),
      'shipToCode': valueOrNullToJson(instance.shipToCode),
      'tempOrderNumber': valueOrNullToJson(instance.tempOrderNumber),
    };
