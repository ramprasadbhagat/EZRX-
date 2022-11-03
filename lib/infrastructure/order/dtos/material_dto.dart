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
    @HiveField(0)
    required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
    @HiveField(1)
    required String materialDescription,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
    @HiveField(2)
    required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
    @HiveField(3)
    required String therapeuticClass,
    @JsonKey(name: 'itemBrand', defaultValue: '')
    @HiveField(4)
    required String itemBrand,
    @JsonKey(name: 'principalName', defaultValue: '')
    @HiveField(5)
    required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
    @HiveField(6)
    required String principalCode,
    @JsonKey(name: 'taxClassification', defaultValue: '')
    @HiveField(7)
    required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
    @HiveField(8)
    required String itemRegistrationNumber,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
    @HiveField(9)
    required String unitOfMeasurement,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
    @HiveField(10)
    required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
    @HiveField(11)
    required String materialGroup4,
    @JsonKey(name: 'isSampleMaterial', defaultValue: false)
    @HiveField(12)
    required bool isSampleMaterial,
    @JsonKey(name: 'hidePrice', defaultValue: false)
    @HiveField(13)
    required bool hidePrice,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    @HiveField(14)
    required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    @HiveField(15)
    required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', defaultValue: <String>[])
    @HiveField(16)
    required List<String> taxes,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
    @HiveField(17)
    required List<BundleDto> bundles,
  }) = _MaterialDto;

  factory MaterialDto.fromDomain(MaterialInfo materialInfo) {
    return MaterialDto(
      materialNumber: materialInfo.materialNumber.getOrCrash(),
      materialDescription: materialInfo.materialDescription,
      governmentMaterialCode: materialInfo.governmentMaterialCode,
      therapeuticClass: materialInfo.therapeuticClass,
      itemBrand: materialInfo.itemBrand,
      principalName: materialInfo.principalData.principalName,
      principalCode: materialInfo.principalData.principalCode,
      taxClassification: materialInfo.taxClassification.getOrCrash(),
      itemRegistrationNumber: materialInfo.itemRegistrationNumber,
      unitOfMeasurement: materialInfo.unitOfMeasurement,
      materialGroup2: materialInfo.materialGroup2.getOrCrash(),
      materialGroup4: materialInfo.materialGroup4.getOrCrash(),
      isSampleMaterial: materialInfo.isSampleMaterial,
      hidePrice: materialInfo.hidePrice,
      hasValidTenderContract: materialInfo.hasValidTenderContract,
      hasMandatoryTenderContract: materialInfo.hasMandatoryTenderContract,
      taxes: materialInfo.taxes.map((e) => e.toString()).toList(),
      bundles:
      materialInfo.bundles.map((e) => BundleDto.fromDomain(e)).toList(),
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
        principalCode: principalCode,
      ),
      taxClassification:  MaterialTaxClassification(taxClassification),
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
      defaultMaterialDescription: '',
    );
  }

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}
