// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditPaymentMethodDto _$$_EditPaymentMethodDtoFromJson(
        Map<String, dynamic> json) =>
    _$_EditPaymentMethodDto(
      success: json['success'] as bool? ?? false,
      action: json['action'] as String? ?? '',
    );

Map<String, dynamic> _$$_EditPaymentMethodDtoToJson(
        _$_EditPaymentMethodDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'action': instance.action,
    };
