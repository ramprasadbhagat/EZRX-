// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginDto _$$_LoginDtoFromJson(Map<String, dynamic> json) => _$_LoginDto(
      access: _convertAccessToken(json, 'eZRxJWT') as String,
      refresh: _convertRefreshToken(json, 'eZRxRefreshJWT') as String,
      user: json['user'] == null
          ? UserDto.emptyUserDto
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginDtoToJson(_$_LoginDto instance) =>
    <String, dynamic>{
      'eZRxJWT': instance.access,
      'eZRxRefreshJWT': instance.refresh,
      'user': instance.user.toJson(),
    };
