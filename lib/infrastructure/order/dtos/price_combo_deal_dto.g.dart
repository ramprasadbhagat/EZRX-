// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_combo_deal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PriceComboDealDto _$$_PriceComboDealDtoFromJson(Map<String, dynamic> json) =>
    _$_PriceComboDealDto(
      isEligible: json['eligible'] as bool? ?? false,
      flexibleGroup: json['flexibleGroup'] as String? ?? '',
      salesDeal: json['salesDeal'] as String? ?? '',
      category: json['category'] == null
          ? PriceComboDealCategoryDto.empty
          : PriceComboDealCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PriceComboDealDtoToJson(
        _$_PriceComboDealDto instance) =>
    <String, dynamic>{
      'eligible': instance.isEligible,
      'flexibleGroup': instance.flexibleGroup,
      'salesDeal': instance.salesDeal,
      'category': instance.category.toJson(),
    };

_$_PriceComboDealCategoryDto _$$_PriceComboDealCategoryDtoFromJson(
        Map<String, dynamic> json) =>
    _$_PriceComboDealCategoryDto(
      type: json['type'] as String? ?? '',
      value:
          (json['value'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$$_PriceComboDealCategoryDtoToJson(
        _$_PriceComboDealCategoryDto instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
