// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_configuration_list_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FavouriteDto _$$_FavouriteDtoFromJson(Map<String, dynamic> json) =>
    _$_FavouriteDto(
      salesOrg: json['salesOrg'] as String? ?? '',
      principalCode: json['principalCode'] as String? ?? '',
      monthsBeforeExpiry: json['monthsBeforeExpiry'] as String? ?? '',
      monthsAfterExpiry: json['monthsAfterExpiry'] as String? ?? '',
      uuid: json['uuid'] as String? ?? '',
      returnsAllowed: json['returnsAllowed'] as bool? ?? false,
      principalName: json['principalName'] as String? ?? '',
    );

Map<String, dynamic> _$$_FavouriteDtoToJson(_$_FavouriteDto instance) =>
    <String, dynamic>{
      'salesOrg': instance.salesOrg,
      'principalCode': instance.principalCode,
      'monthsBeforeExpiry': instance.monthsBeforeExpiry,
      'monthsAfterExpiry': instance.monthsAfterExpiry,
      'uuid': instance.uuid,
      'returnsAllowed': instance.returnsAllowed,
      'principalName': instance.principalName,
    };
