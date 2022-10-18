// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history_basic_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderHistoryBasicInfoDto _$$_OrderHistoryBasicInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_OrderHistoryBasicInfoDto(
      soldTo: json['SoldTo'] as String,
      shipTo: json['ShipTo'] as String,
      companyName: json['CompanyName'] as String,
    );

Map<String, dynamic> _$$_OrderHistoryBasicInfoDtoToJson(
        _$_OrderHistoryBasicInfoDto instance) =>
    <String, dynamic>{
      'SoldTo': instance.soldTo,
      'ShipTo': instance.shipTo,
      'CompanyName': instance.companyName,
    };
