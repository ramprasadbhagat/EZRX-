// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordDtoImpl _$$ForgotPasswordDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordDtoImpl(
      success: json['success'] as bool? ?? false,
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$ForgotPasswordDtoImplToJson(
        _$ForgotPasswordDtoImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'email': instance.email,
    };
