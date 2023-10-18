// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceComboDealRequestDto _$$_PriceComboDealRequestDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceComboDealRequestDto(
      isEligible: json['Eligible'] as bool? ?? false,
      flexibleGroup: json['FlexibleGroup'] as String? ?? '',
      salesDeal: json['SalesDeal'] as String? ?? '',
      category: json['Category'] == null
          ? PriceComboDealCategoryRequestDto.empty
          : PriceComboDealCategoryRequestDto.fromJson(
              json['Category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PriceComboDealRequestDtoToJson(
        _$_PriceComboDealRequestDto instance) =>
    <String, dynamic>{
      'Eligible': instance.isEligible,
      'FlexibleGroup': instance.flexibleGroup,
      'SalesDeal': instance.salesDeal,
      'Category': instance.category.toJson(),
    };

_$_PriceComboDealCategoryRequestDto
    _$$_PriceComboDealCategoryRequestDtoFromJson(Map<String, dynamic> json) =>
        _$_PriceComboDealCategoryRequestDto(
          type: json['Type'] as String? ?? '',
          value: (json['Value'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              [],
        );

Map<String, dynamic> _$$_PriceComboDealCategoryRequestDtoToJson(
        _$_PriceComboDealCategoryRequestDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Value': instance.value,
    };
