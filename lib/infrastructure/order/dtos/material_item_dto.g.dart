// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MaterialItemDto _$$_MaterialItemDtoFromJson(Map<String, dynamic> json) =>
    _$_MaterialItemDto(
      bundleName: json['bundleName'] as String? ?? '',
      bundleCode: json['bundleCode'] as String? ?? '',
      materials: (json['materials'] as List<dynamic>?)
              ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
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
      tenderContractDto: TenderContractDto.fromJson(
          tenderContractOverride(json, 'tenderContract')
              as Map<String, dynamic>),
      hasValidTenderContract: json['hasValidTenderContract'] as bool? ?? false,
      tenderOrderReason: json['tenderOrderReason'] as String? ?? '',
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
      bundleInformation: (json['bundleInformation'] as List<dynamic>?)
              ?.map((e) => BundleInfoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalQuantity: json['totalQuantity'] as int? ?? 0,
      banner: BannerDto.fromJson(
          bannerOverride(json, 'banner') as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MaterialItemDtoToJson(_$_MaterialItemDto instance) {
  final val = <String, dynamic>{
    'bundleName': instance.bundleName,
    'bundleCode': instance.bundleCode,
    'materials': instance.materials.map((e) => e.toJson()).toList(),
    'qty': instance.qty,
    'hidePrice': instance.hidePrice,
    'additionalBonus': instance.bonuses.map((e) => e.toJson()).toList(),
    'materialGroup2': instance.materialGroup2,
    'materialGroup4': instance.materialGroup4,
    'materialNumber': instance.materialNumber,
    'tenderContract': instance.tenderContractDto.toJson(),
    'hasValidTenderContract': instance.hasValidTenderContract,
    'tenderOrderReason': instance.tenderOrderReason,
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
  val['bundleInformation'] =
      instance.bundleInformation.map((e) => e.toJson()).toList();
  val['totalQuantity'] = instance.totalQuantity;
  val['banner'] = instance.banner.toJson();
  return val;
}
