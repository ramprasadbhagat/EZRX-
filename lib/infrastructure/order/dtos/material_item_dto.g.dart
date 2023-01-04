// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemDto _$$_MaterialItemDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialItemDto(
      qty: json['qty'] as int? ?? 0,
      hidePrice: json['hidePrice'] as bool? ?? false,
      bonuses: (json['additionalBonus'] as List<dynamic>?)
              ?.map((e) =>
                  MaterialItemBonusDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materialGroup2: json['materialGroup2'] as String? ?? '',
      materialGroup4: json['materialGroup4'] as String? ?? '',
      materialNumber: json['materialNumber'] as String? ?? '',
      overridenPrice:
          (doubleFormatCheck(json, 'priceOverride') as num?)?.toDouble() ?? 0,
      unitOfMeasurement: json['unitOfMeasurement'] as String? ?? '',
      itemRegistrationNumber: json['itemRegistrationNumber'] as String? ?? '',
      defaultMaterialDescription:
          json['defaultMaterialDescription'] as String? ?? '',
      materialDescription: json['materialDescription'] as String? ?? '',
      type: json['type'] as String? ?? '',
      comment: json['comment'] as String? ?? '',
      batchNumber: json['batchNumber'] as String? ?? '',
      zdp8Override:
          (doubleFormatCheck(json, 'zdp8Override') as num?)?.toDouble() ?? 0,
      remarks: json['remarks'] as String? ?? '',
      bundleName: json['BundleName'] as String? ?? '',
      bundleCode: json['BundleCode'] as String? ?? '',
      bundleInformation: (json['BundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalQuantity: json['totalQuantity'] as int? ?? 0,
    );

Map<String, dynamic> _$$_MaterialItemDtoToJson(_$_MaterialItemDto instance) {
  final val = <String, dynamic>{
    'qty': instance.qty,
    'hidePrice': instance.hidePrice,
    'additionalBonus': instance.bonuses.map((e) => e.toJson()).toList(),
    'materialGroup2': instance.materialGroup2,
    'materialGroup4': instance.materialGroup4,
    'materialNumber': instance.materialNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('priceOverride', overrideTojson(instance.overridenPrice));
  val['unitOfMeasurement'] = instance.unitOfMeasurement;
  val['itemRegistrationNumber'] = instance.itemRegistrationNumber;
  val['defaultMaterialDescription'] = instance.defaultMaterialDescription;
  val['materialDescription'] = instance.materialDescription;
  val['type'] = instance.type;
  val['comment'] = instance.comment;
  val['batchNumber'] = instance.batchNumber;
  val['zdp8Override'] = instance.zdp8Override;
  val['remarks'] = instance.remarks;
  val['BundleName'] = instance.bundleName;
  val['BundleCode'] = instance.bundleCode;
  val['BundleInformation'] =
      instance.bundleInformation.map((e) => e.toJson()).toList();
  val['materials'] = instance.materials.map((e) => e.toJson()).toList();
  val['totalQuantity'] = instance.totalQuantity;
  return val;
}
