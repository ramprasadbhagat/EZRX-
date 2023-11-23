// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationDataDto _$$_NotificationDataDtoFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationDataDto(
      id: json['id'] as int? ?? 0,
      type: json['type'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      isRead: json['isRead'] as bool,
      returnRequestId: json['returnRequestNumber'] as String? ?? '',
      orderNumber: json['orderNumber'] as String? ?? '',
      paymentNumber: json['paymentNumber'] as String? ?? '',
      saleDocument: json['saleDocument'] as String? ?? '',
    );

Map<String, dynamic> _$$_NotificationDataDtoToJson(
        _$_NotificationDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'isRead': instance.isRead,
      'returnRequestNumber': instance.returnRequestId,
      'orderNumber': instance.orderNumber,
      'paymentNumber': instance.paymentNumber,
      'saleDocument': instance.saleDocument,
    };
