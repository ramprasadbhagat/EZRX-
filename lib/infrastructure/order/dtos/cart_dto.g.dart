// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartDto _$$_CartDtoFromJson(Map<String, dynamic> json) => _$_CartDto(
      cartProducts: (json['ezRxItems'] as List<dynamic>?)
              ?.map((e) => CartProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      cartCustomerCode: json['customerCode'] as String? ?? '',
      cartShipToCustomerCode: json['shipToCustomerCode'] as String? ?? '',
    );

Map<String, dynamic> _$$_CartDtoToJson(_$_CartDto instance) =>
    <String, dynamic>{
      'ezRxItems': instance.cartProducts.map((e) => e.toJson()).toList(),
      'customerCode': instance.cartCustomerCode,
      'shipToCustomerCode': instance.cartShipToCustomerCode,
    };
