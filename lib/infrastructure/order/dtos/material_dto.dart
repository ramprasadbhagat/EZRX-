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
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
    @HiveField(14, defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
    @HiveField(15, defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
    @HiveField(16, defaultValue: ['0'])
        required List<String> taxes,
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
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
    @HiveField(22, defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'ean', defaultValue: '')
    @HiveField(23, defaultValue: '')
        required String ean,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
    @HiveField(17, defaultValue: <BundleDto>[])
        required List<BundleDto> bundles,

    // new field from v3
    @JsonKey(name: 'Code', defaultValue: '')
    @HiveField(24, defaultValue: '')
        required String code,
    @JsonKey(name: 'Name', defaultValue: '')
    @HiveField(25, defaultValue: '')
    @HiveField(26, defaultValue: '')
        required String name,
    @JsonKey(name: 'PrincipalCode', defaultValue: '')
    @HiveField(27, defaultValue: '')
        required String principalCode,
    @JsonKey(name: 'MaterialNumber', defaultValue: '')
    @HiveField(28, defaultValue: '')
        required String materialNumber,
    @HiveField(29, defaultValue: '')
    @JsonKey(name: 'materialDescription', defaultValue: '')
    @HiveField(30, defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Manufactured', defaultValue: '')
    @HiveField(31, defaultValue: '')
        required String manufactured,
    @JsonKey(name: 'IsFavourite', defaultValue: false)
    @HiveField(32, defaultValue: false)
        required bool isFavourite,
    @JsonKey(name: 'Type', defaultValue: '')
    @HiveField(33, defaultValue: '')
        required String type,
    @JsonKey(name: 'HidePrice', defaultValue: false)
    @HiveField(34, defaultValue: false)
        required bool hidePrice,
    @JsonKey(name: 'DataTotalCount', defaultValue: 0)
    @HiveField(35, defaultValue: 0)
        required int dataTotalCount,
    @JsonKey(name: 'DataTotalHidden', defaultValue: 0)
    @HiveField(36, defaultValue: 0)
        required int dataTotalHidden,
    @JsonKey(name: 'IsGimmick', defaultValue: false)
    @HiveField(37, defaultValue: false)
        required bool isGimmick,
    @JsonKey(name: 'Data', defaultValue: <MaterialDataDto>[])
    @HiveField(38, defaultValue: [])
        required List<MaterialDataDto> data,
    @JsonKey(name: 'BundleInformation', readValue: _nullCheck)
    @HiveField(39, defaultValue: _emptyConstBundleDto)
        required BundleDto bundle,
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
      principalName:
          materialInfo.principalData.principalName.getOrDefaultValue(''),
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
      genericMaterialName: materialInfo.genericMaterialName,
      ean: materialInfo.ean,
      code: '',
      data:
          materialInfo.data.map((e) => MaterialDataDto.fromDomain(e)).toList(),
      dataTotalCount: 0,
      dataTotalHidden: 0,
      isFavourite: false,
      isGimmick: false,
      manufactured: '',
      name: '',
      type: '',
      bundle: BundleDto.fromDomain(materialInfo.bundle),
    );
  }

  MaterialInfo toDomain() {
    return MaterialInfo(
      materialNumber: _getMaterialNumber,
      materialDescription: materialDescription,
      governmentMaterialCode: governmentMaterialCode,
      therapeuticClass: therapeuticClass,
      itemBrand: itemBrand,
      principalData: PrincipalData(
        principalName: PrincipalName(principalName),
        principalCode: PrincipalCode(principalCode),
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
      genericMaterialName: genericMaterialName,
      ean: ean,
      data: data.map((e) => e.toDomain()).toList(),
      dataTotalCount: dataTotalCount,
      dataTotalHidden: DataTotalHidden(dataTotalHidden),
      isFavourite: isFavourite,
      isGimmick: isGimmick,
      manufactured: manufactured,
      name: name,
      principalCode: principalCode,
      type: MaterialInfoType(type),
      stockInfos: [],
      bundle: bundle.toDomain(),
    );
  }

  MaterialNumber get _getMaterialNumber => materialNumber.isEmpty
      ? MaterialNumber(code)
      : MaterialNumber(materialNumber);

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

Map<String, dynamic> _nullCheck(Map json, String key) => json[key] ?? {};

@freezed
class MaterialDataDto with _$MaterialDataDto {
  const MaterialDataDto._();
  @HiveType(typeId: 3, adapterName: 'MaterialDataDtoAdapter')
  factory MaterialDataDto({
    @JsonKey(name: 'Code', defaultValue: '')
    @HiveField(1, defaultValue: '')
        required String code,
    @JsonKey(name: 'Manufactured', defaultValue: '')
    @HiveField(2, defaultValue: '')
        required String manufactured,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
    @HiveField(3, defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
    @HiveField(4, defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'GenericMaterialName', defaultValue: '')
    @HiveField(5, defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'MaterialImageURL', defaultValue: '')
    @HiveField(6, defaultValue: '')
        required String materialImageURL,
    @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
    @HiveField(7, defaultValue: '')
        required String governmentMaterialCode,
  }) = _MaterialDataDto;

  factory MaterialDataDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDataDtoFromJson(json);

  MaterialData toDomain() => MaterialData(
        code: MaterialNumber(code),
        manufactured: manufactured,
        materialDescription: materialDescription,
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: governmentMaterialCode,
        materialImageURL: materialImageURL,
      );

  factory MaterialDataDto.fromDomain(MaterialData materialData) =>
      MaterialDataDto(
        code: materialData.code.getOrCrash(),
        manufactured: materialData.manufactured,
        materialDescription: materialData.materialDescription,
        defaultMaterialDescription: materialData.defaultMaterialDescription,
        genericMaterialName: materialData.genericMaterialName,
        governmentMaterialCode: materialData.governmentMaterialCode,
        materialImageURL: materialData.materialImageURL,
      );
}

@freezed
class MaterialResponseDto with _$MaterialResponseDto {
  const MaterialResponseDto._();
  factory MaterialResponseDto({
    @JsonKey(name: 'Count', defaultValue: 0) required int count,
    @JsonKey(name: 'Products', defaultValue: <MaterialDto>[])
        required List<MaterialDto> products,
  }) = _MaterialResponseDto;

  factory MaterialResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialResponseDtoFromJson(json);

  MaterialResponse toDomain() => MaterialResponse(
        count: count,
        products: products.map((e) => e.toDomain()).toList(),
      );
}

const _emptyConstBundleDto = BundleDto(
  bonusEligible: false,
  bundleCode: '',
  bundleInformation: [],
  bundleName: '',
  conditions: '',
  materials: [],
);
