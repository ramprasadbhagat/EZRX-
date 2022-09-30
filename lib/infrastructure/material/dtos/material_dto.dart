import 'package:ezrxmobile/domain/material/entities/material_info.dart';
import 'package:ezrxmobile/domain/material/entities/principal_data.dart';
import 'package:ezrxmobile/domain/material/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_dto.freezed.dart';
part 'material_dto.g.dart';

@freezed
class MaterialDto with _$MaterialDto {
  const MaterialDto._();
  const factory MaterialDto({
    @JsonKey(name: 'materialNumber') required String materialNumber,
    @JsonKey(name: 'materialDescription') required String materialDescription,
    @JsonKey(name: 'governmentMaterialCode')
        required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass') required String therapeuticClass,
    @JsonKey(name: 'itemBrand') required String itemBrand,
    @JsonKey(name: 'principalName') required String principalName,
    @JsonKey(name: 'principalCode') required String principalCode,
    @JsonKey(name: 'taxClassification') required String taxClassification,
    @JsonKey(name: 'itemRegistrationNumber')
        required String itemRegistrationNumber,
    @JsonKey(name: 'unitOfMeasurement') required String unitOfMeasurement,
    @JsonKey(name: 'materialGroup2') required String materialGroup2,
    @JsonKey(name: 'materialGroup4') required String materialGroup4,
    @JsonKey(name: 'isSampleMaterial') required bool isSampleMaterial,
    @JsonKey(name: 'hidePrice') required bool hidePrice,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes') required List<String> taxes,
  }) = _MaterialDto;

  factory MaterialDto.fromDomain(MaterialInfo materialInfo) {
    return MaterialDto(
      materialNumber: materialInfo.materialCode.getOrCrash(),
      materialDescription: materialInfo.materialDescription,
      governmentMaterialCode: materialInfo.governmentMaterialCode,
      therapeuticClass: materialInfo.therapeuticClass,
      itemBrand: materialInfo.itemBrand,
      principalName: materialInfo.principalData.principalName,
      principalCode: materialInfo.principalData.principalCode,
      taxClassification: materialInfo.taxClassification,
      itemRegistrationNumber: materialInfo.itemRegistrationNumber,
      unitOfMeasurement: materialInfo.unitOfMeasurement,
      materialGroup2: materialInfo.materialGroup2,
      materialGroup4: materialInfo.materialGroup4,
      isSampleMaterial: materialInfo.isSampleMaterial,
      hidePrice: materialInfo.hidePrice,
      hasValidTenderContract: materialInfo.hasValidTenderContract,
      hasMandatoryTenderContract: materialInfo.hasMandatoryTenderContract,
      taxes: materialInfo.taxes.map((e) => e.toString()).toList(),
    );
  }

  MaterialInfo toDomain() {
    return MaterialInfo(
      materialCode: MaterialCode(materialNumber),
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
      materialGroup2: materialGroup2,
      materialGroup4: materialGroup4,
      isSampleMaterial: isSampleMaterial,
      hidePrice: hidePrice,
      hasValidTenderContract: hasValidTenderContract,
      hasMandatoryTenderContract: hasMandatoryTenderContract,
      taxes: taxes.map((e) => e).toList(),
    );
  }

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}
