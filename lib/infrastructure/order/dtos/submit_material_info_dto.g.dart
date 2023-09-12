// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_material_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubmitMaterialInfoDto _$$_SubmitMaterialInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SubmitMaterialInfoDto(
      materialNumber: json['materialNumber'] as String? ?? '',
      qty: json['qty'] as int? ?? 0,
      bonuses: (json['bonuses'] as List<dynamic>?)
              ?.map((e) => SubmitMaterialItemBonusDto.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
      comment: json['Comment'] as String? ?? '',
      parentId: json['ParentID'] as String? ?? '',
      materialItemOverride: MaterialItemOverrideDto.fromJson(
          materialItemOverrideread(json, 'override') as Map<String, dynamic>),
      productType: json['ProductType'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      tax: (json['tax'] as num?)?.toDouble() ?? 0,
      mrp: (json['Mrp'] as num?)?.toDouble() ?? 0,
      promoStatus: json['PromoStatus'] as bool? ?? false,
      promoType: json['PromoType'] as String? ?? '',
      batch: json['batch'] as String? ?? '',
    );

Map<String, dynamic> _$$_SubmitMaterialInfoDtoToJson(
    _$_SubmitMaterialInfoDto instance) {
  final val = <String, dynamic>{
    'materialNumber': instance.materialNumber,
    'qty': instance.qty,
    'bonuses': instance.bonuses.map((e) => e.toJson()).toList(),
    'Comment': instance.comment,
    'ParentID': instance.parentId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('override', overrideTojson(instance.materialItemOverride));
  val['ProductType'] = instance.productType;
  val['price'] = instance.price;
  val['tax'] = instance.tax;
  val['Mrp'] = instance.mrp;
  val['PromoStatus'] = instance.promoStatus;
  val['PromoType'] = instance.promoType;
  writeNotNull('batch', overrideBatchJson(instance.batch));
  return val;
}
