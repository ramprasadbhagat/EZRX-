// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_right_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccessRightDto _$$_AccessRightDtoFromJson(Map<String, dynamic> json) =>
    _$_AccessRightDto(
      users: json['Users'] as bool? ?? false,
      orders: json['Orders'] as bool? ?? false,
      promos: json['Promos'] as bool? ?? false,
      hCPHUB: json['HCPHUB'] as bool? ?? false,
      products: json['Products'] as bool? ?? false,
      services: json['Services'] as bool? ?? false,
      analytics: json['Analytics'] as bool? ?? false,
      loyaltyScheme: json['LoyaltyScheme'] as bool? ?? false,
    );

Map<String, dynamic> _$$_AccessRightDtoToJson(_$_AccessRightDto instance) =>
    <String, dynamic>{
      'Users': instance.users,
      'Orders': instance.orders,
      'Promos': instance.promos,
      'HCPHUB': instance.hCPHUB,
      'Products': instance.products,
      'Services': instance.services,
      'Analytics': instance.analytics,
      'LoyaltyScheme': instance.loyaltyScheme,
    };
