// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ForgotPasswordDto _$$_ForgotPasswordDtoFromJson(Map<String, dynamic> json) =>
    _$_ForgotPasswordDto(
      success: json['success'] as bool? ?? false,
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$_ForgotPasswordDtoToJson(
        _$_ForgotPasswordDto instance) =>
    <String, dynamic>{
      'success': instance.success,
      'email': instance.email,
    };
