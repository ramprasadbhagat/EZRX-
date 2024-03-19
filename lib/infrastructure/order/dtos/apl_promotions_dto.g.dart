// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apl_promotions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AplPromotionsDto _$$_AplPromotionsDtoFromJson(Map<String, dynamic> json) =>
    _$_AplPromotionsDto(
      discountValue: (json['discountValue'] as num?)?.toDouble() ?? 0,
      discountTypeValue: json['discountTypeValue'] as String? ?? '',
    );

Map<String, dynamic> _$$_AplPromotionsDtoToJson(_$_AplPromotionsDto instance) =>
    <String, dynamic>{
      'discountValue': instance.discountValue,
      'discountTypeValue': instance.discountTypeValue,
    };
