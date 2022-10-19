import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_dto.freezed.dart';
part 'material_dto.g.dart';

@freezed
class MaterialDto with _$MaterialDto {
  const MaterialDto._();
  const factory MaterialDto({
    @JsonKey(name: 'materialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'itemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'principalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'taxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'unitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'materialGroup2', defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'materialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'isSampleMaterial', defaultValue: false)
        required bool isSampleMaterial,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', defaultValue: <String>[])
        required List<String> taxes,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
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
      taxClassification: materialInfo.taxClassification,
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
      taxClassification: taxClassification,
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
    );
  }

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}
