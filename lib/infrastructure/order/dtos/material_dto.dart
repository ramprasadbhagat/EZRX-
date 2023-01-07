import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'material_dto.freezed.dart';
part 'material_dto.g.dart';

@freezed
class MaterialDto with _$MaterialDto {
  const MaterialDto._();

  @HiveType(typeId: 3, adapterName: 'MaterialDtoAdapter')
  const factory MaterialDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
    @HiveField(0, defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    @HiveField(2, defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
    @HiveField(3, defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'itemBrand', defaultValue: '')
    @HiveField(4, defaultValue: '')
        required String itemBrand,
    @JsonKey(name: 'principalName', defaultValue: '')
    @HiveField(5, defaultValue: '')
        required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
    @HiveField(6, defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'taxClassification', defaultValue: '')
    @HiveField(7, defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    @HiveField(8, defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
    @HiveField(9, defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
    @HiveField(10, defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
    @HiveField(11, defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'isSampleMaterial', defaultValue: false)
    @HiveField(12, defaultValue: false)
        required bool isSampleMaterial,
    @JsonKey(name: 'hidePrice', defaultValue: false)
    @HiveField(13, defaultValue: false)
        required bool hidePrice,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    @HiveField(14, defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    @HiveField(15, defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
    @HiveField(16, defaultValue: ['0'])
        required List<String> taxes,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
    @HiveField(17, defaultValue: <BundleDto>[])
        required List<BundleDto> bundles,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
    @HiveField(18, defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
    @HiveField(19, defaultValue: false)
        required bool isFOCMaterial,
    @JsonKey(name: 'quantity', defaultValue: 0, readValue: _validateQantity)
    @HiveField(20, defaultValue: 0)
        required int quantity,
    @JsonKey(name: 'remarks', defaultValue: '')
    @HiveField(21, defaultValue: '')
        required String remarks,
  }) = _MaterialDto;

  factory MaterialDto.fromDomain(MaterialInfo materialInfo) {
    return MaterialDto(
      quantity: materialInfo.quantity,
      defaultMaterialDescription: materialInfo.defaultMaterialDescription,
      materialNumber: materialInfo.materialNumber.getOrDefaultValue(''),
      materialDescription: materialInfo.materialDescription,
      governmentMaterialCode: materialInfo.governmentMaterialCode,
      therapeuticClass: materialInfo.therapeuticClass,
      itemBrand: materialInfo.itemBrand,
      principalName: materialInfo.principalData.principalName,
      principalCode:
          materialInfo.principalData.principalCode.getOrDefaultValue(''),
      taxClassification: materialInfo.taxClassification.getOrDefaultValue(''),
      itemRegistrationNumber: materialInfo.itemRegistrationNumber,
      unitOfMeasurement: materialInfo.unitOfMeasurement,
      materialGroup2: materialInfo.materialGroup2.getOrDefaultValue(''),
      materialGroup4: materialInfo.materialGroup4.getOrDefaultValue(''),
      isSampleMaterial: materialInfo.isSampleMaterial,
      hidePrice: materialInfo.hidePrice,
      hasValidTenderContract: materialInfo.hasValidTenderContract,
      hasMandatoryTenderContract: materialInfo.hasMandatoryTenderContract,
      taxes: materialInfo.taxes.map((e) => e.toString()).toList(),
      bundles:
          materialInfo.bundles.map((e) => BundleDto.fromDomain(e)).toList(),
      isFOCMaterial: materialInfo.isFOCMaterial,
      remarks: materialInfo.remarks,
    );
  }

  MaterialInfo toDomain() {
    return MaterialInfo(
      materialNumber: MaterialNumber(materialNumber),
      materialDescription: materialDescription,
      governmentMaterialCode: governmentMaterialCode,
      therapeuticClass: therapeuticClass,
      itemBrand: itemBrand,
      principalData: PrincipalData(
        principalName: principalName,
        principalCode: PrincipleCode(principalCode),
      ),
      taxClassification: MaterialTaxClassification(taxClassification),
      itemRegistrationNumber: itemRegistrationNumber,
      unitOfMeasurement: unitOfMeasurement,
      materialGroup2: MaterialGroup.two(materialGroup2),
      materialGroup4: MaterialGroup.four(materialGroup4),
      isSampleMaterial: isSampleMaterial,
      hidePrice: hidePrice,
      hasValidTenderContract: hasValidTenderContract,
      hasMandatoryTenderContract: hasMandatoryTenderContract,
      taxes: taxes.map((e) => e).toList(),
      bundles: bundles.map((e) => e.toDomain()).toList(),
      defaultMaterialDescription: defaultMaterialDescription,
      isFOCMaterial: isFOCMaterial,
      quantity: quantity,
      remarks: remarks,
    );
  }

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}

List handleEmptyTaxList(Map json, String key) {
  if (json[key] == null || json[key].isEmpty) {
    return ['0'];
  }

  return json[key];
}

int _validateQantity(Map json, String key) {
  return (json[key] ?? 0) > 0
      ? json[key]
      : (json['qty'] ?? 0) > 0
          ? json['qty']
          : 0;
}
