import 'package:ezrxmobile/domain/banner/entities/ez_reach_banner.dart';
import 'package:ezrxmobile/domain/order/entities/material_item.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/banner/dtos/ez_reach_banner_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_item_bonus_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/tender_contract_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/order/entities/tender_contract.dart';
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
    @JsonKey(name: 'tenderContract', readValue: tenderContractOverride)
        required TenderContractDto tenderContractDto,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'tenderOrderReason', defaultValue: '')
        required String tenderOrderReason,
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
    @JsonKey(name: 'banner', readValue: bannerOverride)
        required EZReachBannerDto banner,
  }) = _MaterialItemDto;

  MaterialItem toDomain() {
    return MaterialItem(
      banner: banner.toDomain(),
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
      tenderContract: tenderContractDto.toDomain(),
      hasValidTenderContract: hasValidTenderContract,
      tenderOrderReason: TenderContractReason(tenderOrderReason),
    );
  }

  factory MaterialItemDto.fromDomain(MaterialItem materialItem) {
    return MaterialItemDto(
      banner: EZReachBannerDto.fromDomain(materialItem.banner),
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
      tenderContractDto:
          TenderContractDto.fromDomain(materialItem.tenderContract),
      hasValidTenderContract: materialItem.hasValidTenderContract,
      tenderOrderReason: materialItem.tenderOrderReason.getOrDefaultValue(''),
    );
  }

  factory MaterialItemDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialItemDtoFromJson(json);
}

Map<String, dynamic> tenderContractOverride(Map json, String key) =>
    json[key] ?? TenderContractDto.fromDomain(TenderContract.empty()).toJson();

double doubleFormatCheck(Map json, String key) =>
    double.tryParse('${json[key]}') ?? 0;

dynamic overrideTojson(double priceOverride) =>
    priceOverride != 0 ? priceOverride : null;

Map<String, dynamic> bannerOverride(Map json, String key) =>
    json[key] ?? EZReachBannerDto.fromDomain(EZReachBanner.empty()).toJson();
