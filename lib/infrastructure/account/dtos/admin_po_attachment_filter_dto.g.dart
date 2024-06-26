// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_po_attachment_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminPoAttachmentFilterDtoImpl _$$AdminPoAttachmentFilterDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminPoAttachmentFilterDtoImpl(
      orderNumber: json['orderNumber'] as String? ?? '',
      exRxNo: json['exRxNo'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$AdminPoAttachmentFilterDtoImplToJson(
        _$AdminPoAttachmentFilterDtoImpl instance) =>
    <String, dynamic>{
      'orderNumber': valueOrNullToJson(instance.orderNumber),
      'exRxNo': valueOrNullToJson(instance.exRxNo),
      'salesOrg': valueOrNullToJson(instance.salesOrg),
      'soldTo': valueOrNullToJson(instance.soldTo),
      'toDate': valueOrNullToJson(instance.toDate),
      'fromDate': valueOrNullToJson(instance.fromDate),
    };
