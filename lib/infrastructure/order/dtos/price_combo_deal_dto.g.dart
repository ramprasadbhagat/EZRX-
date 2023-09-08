// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceComboDealDto _$$_PriceComboDealDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceComboDealDto(
      isEligible: json['Eligible'] as bool? ?? false,
      flexibleGroup: json['FlexibleGroup'] as String? ?? '',
      salesDeal: json['SalesDeal'] as String? ?? '',
      category: json['Category'] == null
          ? PriceComboDealCategoryDto.empty
          : PriceComboDealCategoryDto.fromJson(
              json['Category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PriceComboDealDtoToJson(
        _$_PriceComboDealDto instance) =>
    <String, dynamic>{
      'Eligible': instance.isEligible,
      'FlexibleGroup': instance.flexibleGroup,
      'SalesDeal': instance.salesDeal,
      'Category': instance.category.toJson(),
    };

_$_PriceComboDealCategoryDto _$$_PriceComboDealCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceComboDealCategoryDto(
      type: json['Type'] as String? ?? '',
      value:
          (json['Value'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_PriceComboDealCategoryDtoToJson(
        _$_PriceComboDealCategoryDto instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'Value': instance.value,
    };
