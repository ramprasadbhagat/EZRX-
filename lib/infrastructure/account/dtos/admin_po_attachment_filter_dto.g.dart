// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_po_attachment_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminPoAttachmentFilterDto _$$_AdminPoAttachmentFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AdminPoAttachmentFilterDto(
      orderNumber: json['orderNumber'] as String? ?? '',
      exRxNo: json['exRxNo'] as String? ?? '',
      salesOrg: json['salesOrg'] as String? ?? '',
      soldTo: json['soldTo'] as String? ?? '',
      toDate: json['toDate'] as String? ?? '',
      fromDate: json['fromDate'] as String? ?? '',
    );

Map<String, dynamic> _$$_AdminPoAttachmentFilterDtoToJson(
        _$_AdminPoAttachmentFilterDto instance) =>
    <String, dynamic>{
      'orderNumber': overrideToJson(instance.orderNumber),
      'exRxNo': overrideToJson(instance.exRxNo),
      'salesOrg': overrideToJson(instance.salesOrg),
      'soldTo': overrideToJson(instance.soldTo),
      'toDate': overrideToJson(instance.toDate),
      'fromDate': overrideToJson(instance.fromDate),
    };
