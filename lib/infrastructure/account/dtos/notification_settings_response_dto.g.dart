// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_settings_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationSettingsResponseDto _$$_NotificationSettingsResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_NotificationSettingsResponseDto(
      orderConfirmation: json['orderConfirmation'] as bool? ?? false,
      paymentConfirmation: json['paymentConfirmation'] as bool? ?? false,
      ereturnConfirmation: json['ereturnConfirmation'] as bool? ?? false,
    );

Map<String, dynamic> _$$_NotificationSettingsResponseDtoToJson(
        _$_NotificationSettingsResponseDto instance) =>
    <String, dynamic>{
      'orderConfirmation': instance.orderConfirmation,
      'paymentConfirmation': instance.paymentConfirmation,
      'ereturnConfirmation': instance.ereturnConfirmation,
    };
