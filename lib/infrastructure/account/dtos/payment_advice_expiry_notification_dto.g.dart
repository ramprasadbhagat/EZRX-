// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_advice_expiry_notification_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PaymentAdviceExpiryNotificationDto
    _$$_PaymentAdviceExpiryNotificationDtoFromJson(Map<String, dynamic> json) =>
        _$_PaymentAdviceExpiryNotificationDto(
          day: json['day'] as String,
          disabled: json['disabled'] as bool? ?? false,
        );

Map<String, dynamic> _$$_PaymentAdviceExpiryNotificationDtoToJson(
        _$_PaymentAdviceExpiryNotificationDto instance) =>
    <String, dynamic>{
      'day': instance.day,
      'disabled': instance.disabled,
    };
