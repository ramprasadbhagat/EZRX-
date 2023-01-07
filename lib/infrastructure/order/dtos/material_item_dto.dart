import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_item_dto.freezed.dart';
part 'material_item_dto.g.dart';

@freezed
class MaterialItemDto with _$MaterialItemDto {
  const MaterialItemDto._();

  const factory MaterialItemDto({
    @JsonKey(name: 'bundleName', defaultValue: '')
        required String bundleName,
    @JsonKey(name: 'bundleCode', defaultValue: '')
        required String bundleCode,
    @JsonKey(name: 'materials', defaultValue: <MaterialDto>[])
        required List<MaterialDto> materials,
    @JsonKey(name: 'qty', defaultValue: 0)
        required int qty,
    @JsonKey(name: 'hidePrice', defaultValue: false)
        required bool hidePrice,
    @JsonKey(name: 'additionalBonus', defaultValue: <MaterialItemBonusDto>[])
        required List<MaterialItemBonusDto> bonuses,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(
      name: 'priceOverride',
      defaultValue: 0,
      readValue: doubleFormatCheck,
      includeIfNull: false,
      toJson: overrideTojson,
    )
        required double overridenPrice,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'type', defaultValue: '')
        required String type,
    @JsonKey(name: 'comment', defaultValue: '')
        required String comment,
    @JsonKey(name: 'batchNumber', defaultValue: '')
        required String batchNumber,
    @JsonKey(
      name: 'zdp8Override',
      readValue: doubleFormatCheck,
      defaultValue: 0,
    )
        required double zdp8Override,
    @JsonKey(name: 'remarks', defaultValue: '')
        required String remarks,
    @JsonKey(name: 'bundleInformation', defaultValue: [])
        required List<BundleInfoDto> bundleInformation,
    @JsonKey(name: 'totalQuantity', defaultValue: 0)
        required int totalQuantity,
  }) = _MaterialItemDto;

  MaterialItem toDomain() {
    return MaterialItem(
      bundleName: bundleName,
      bundleCode: bundleCode,
      defaultMaterialDescription: defaultMaterialDescription,
      qty: qty,
      type: MaterialItemType(type),
      comment: comment,
      hidePrice: hidePrice,
      batchNumber: batchNumber,
      zdp8Override: Zdp8OverrideValue(zdp8Override),
      bonuses: bonuses.map((e) => e.toDomain()).toList(),
      materialGroup2: MaterialGroup.two(materialGroup2),
      materialGroup4: MaterialGroup.four(materialGroup4),
      materialNumber: MaterialNumber(materialNumber),
      overridenPrice: PriceOverrideValue(overridenPrice),
      unitOfMeasurement: unitOfMeasurement,
      itemRegistrationNumber: itemRegistrationNumber,
      materialDescription: materialDescription,
      remarks: remarks,
      bundleInformation: bundleInformation.map((e) => e.toDomain()).toList(),
      materials: materials.map((e) => e.toDomain()).toList(),
      totalQuantity: totalQuantity,
    );
  }

  factory MaterialItemDto.fromDomain(MaterialItem materialItem) {
    return MaterialItemDto(
      bundleCode: materialItem.bundleCode,
      bundleName: materialItem.bundleName,
      materials:
          materialItem.materials.map((e) => MaterialDto.fromDomain(e)).toList(),
      batchNumber: materialItem.batchNumber,
      bonuses: materialItem.bonuses
          .map((e) => MaterialItemBonusDto.fromDomain(e))
          .toList(),
      comment: materialItem.comment,
      defaultMaterialDescription: materialItem.defaultMaterialDescription,
      hidePrice: materialItem.hidePrice,
      itemRegistrationNumber: materialItem.itemRegistrationNumber,
      materialDescription: materialItem.materialDescription,
      materialGroup2: materialItem.materialGroup2.getOrCrash(),
      materialGroup4: materialItem.materialGroup4.getOrCrash(),
      materialNumber: materialItem.materialNumber.getValue(),
      overridenPrice: materialItem.overridenPrice.getOrDefaultValue(0),
      qty: materialItem.qty,
      type: materialItem.type.getValue(),
      unitOfMeasurement: materialItem.unitOfMeasurement,
      zdp8Override: materialItem.zdp8Override.getOrDefaultValue(0),
      remarks: materialItem.remarks,
      bundleInformation: materialItem.bundleInformation
          .map((e) => BundleInfoDto.fromDomain(e))
          .toList(),
      totalQuantity: materialItem.totalQuantity,
    );
  }

  factory MaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemDtoFromJson(json);
}

bool boolStringFormatCheck(Map json, String key) =>
    json[key] == '' ? false : json[key];

Map<String, dynamic> materialItemOverride(Map json, String key) =>
    json[key] ?? {};

int intFormatCheck(Map json, String key) => json[key] is int ? json[key] : 0;
double doubleFormatCheck(Map json, String key) =>
    double.tryParse('${json[key]}') ?? 0;

dynamic overrideTojson(double priceOverride) =>
    priceOverride != 0 ? priceOverride : null;
