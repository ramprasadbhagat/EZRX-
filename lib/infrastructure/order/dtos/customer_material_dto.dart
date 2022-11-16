import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_material_dto.freezed.dart';
part 'customer_material_dto.g.dart';

@freezed
class CustomerMaterialDto with _$CustomerMaterialDto {
  const CustomerMaterialDto._();
  const factory CustomerMaterialDto({
    @JsonKey(name: 'Taxes', defaultValue: []) required List<String> taxes,
    @JsonKey(name: 'Taxm1', defaultValue: '') required String taxm1,
    @JsonKey(name: 'TaxClassification', defaultValue: '')
        required String taxClassification,
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
        required String materialNumber,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'PrincipalName', defaultValue: '')
        required String principalName,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'TherapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'ItemBrand', defaultValue: '') required String itemBrand,
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'hidePrice', defaultValue: false) required bool hidePrice,
    @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'IsSampleMaterial', defaultValue: false)
        required bool isSampleMaterial,
    @JsonKey(name: 'ItemRegistrationNumber', defaultValue: '')
        required String itemRegistrationNumber,
    @JsonKey(name: 'UnitOfMeasurement', defaultValue: '')
        required String unitOfMeasurement,
    @JsonKey(name: 'MaterialGroup2', defaultValue: '')
        required String materialGroup2,
    @JsonKey(name: 'MaterialGroup4', defaultValue: '')
        required String materialGroup4,
    @JsonKey(name: 'IsFOCMaterial', defaultValue: false)
        required bool isFOCMaterial,    
  }) = _CustomerMaterialDto;

  MaterialInfo toDomain() => MaterialInfo(
        materialNumber: MaterialNumber(materialNumber),
        materialDescription: materialDescription,
        defaultMaterialDescription: defaultMaterialDescription,
        governmentMaterialCode: governmentMaterialCode,
        therapeuticClass: therapeuticClass,
        itemBrand: itemBrand,
        principalData: PrincipalData(
          principalCode: principalCode,
          principalName: principalName,
        ),
        itemRegistrationNumber: itemRegistrationNumber,
        unitOfMeasurement: unitOfMeasurement,
        materialGroup2: MaterialGroup.two(
          materialGroup2,
        ),
        materialGroup4: MaterialGroup.four(
          materialGroup4,
        ),
        isSampleMaterial: isSampleMaterial,
        hidePrice: hidePrice,
        hasValidTenderContract: hasValidTenderContract,
        hasMandatoryTenderContract: hasMandatoryTenderContract,
        taxClassification: MaterialTaxClassification(taxClassification),
        taxes: taxes,
        bundles: [],
        isFOCMaterial: isFOCMaterial,
      );

  factory CustomerMaterialDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerMaterialDtoFromJson(json);
}
