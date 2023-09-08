import 'package:ezrxmobile/domain/core/product_images/entities/product_images.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/order/entities/country_data.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/entities/request_counter_offer_details.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_dto.freezed.dart';

part 'material_dto.g.dart';

@freezed
class MaterialDto with _$MaterialDto {
  const MaterialDto._();

  const factory MaterialDto({
    @JsonKey(name: 'governmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
    @JsonKey(name: 'therapeuticClass', defaultValue: '')
        required String therapeuticClass,
    @JsonKey(name: 'itemBrand', defaultValue: '')
        required String itemBrand,
    @JsonKey(name: 'principalName', defaultValue: '')
        required String principalName,
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
    @JsonKey(name: 'hasValidTenderContract', defaultValue: false)
        required bool hasValidTenderContract,
    @JsonKey(name: 'hasMandatoryTenderContract', defaultValue: false)
        required bool hasMandatoryTenderContract,
    @JsonKey(name: 'taxes', defaultValue: ['0'], readValue: handleEmptyTaxList)
        required List<String> taxes,
    @JsonKey(name: 'defaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'isFOCMaterial', defaultValue: false)
        required bool isFOCMaterial,
    @JsonKey(name: 'Quantity', defaultValue: 0, readValue: _validateQantity)
        required int quantity,
    @JsonKey(name: 'remarks', defaultValue: '')
        required String remarks,
    @JsonKey(name: 'genericMaterialName', defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'ean', defaultValue: '')
        required String ean,
    @JsonKey(name: 'BundleInformation', readValue: _nullCheck)
        required BundleDto bundle,

    // new field from v3
    @JsonKey(name: 'Code', defaultValue: '')
        required String code,
    @JsonKey(name: 'Name', defaultValue: '')
        required String name,
    @JsonKey(
      name: 'PrincipalCode',
      defaultValue: '',
      readValue: _principalCodeReadValue,
    )
        required String principalCode,
    @JsonKey(
      name: 'MaterialNumber',
      defaultValue: '',
      readValue: _materialNumberReadValue,
    )
        required String materialNumber,
    @JsonKey(name: 'materialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'Manufactured', defaultValue: '')
        required String manufactured,
    @JsonKey(name: 'IsFavourite', defaultValue: false)
        required bool isFavourite,
    @JsonKey(name: 'Type', defaultValue: '')
        required String type,
    @JsonKey(name: 'HidePrice', defaultValue: false)
        required bool hidePrice,
    @JsonKey(name: 'DataTotalCount', defaultValue: 0)
        required int dataTotalCount,
    @JsonKey(name: 'DataTotalHidden', defaultValue: 0)
        required int dataTotalHidden,
    @JsonKey(name: 'IsGimmick', defaultValue: false)
        required bool isGimmick,
    @JsonKey(name: 'Data', defaultValue: <MaterialDataDto>[])
        required List<MaterialDataDto> data,
    @JsonKey(name: 'bundles', defaultValue: <BundleDto>[])
        required List<BundleDto> bundles,
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
      unitOfMeasurement: materialInfo.unitOfMeasurement.getOrDefaultValue(''),
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
      unitOfMeasurement: StringValue(unitOfMeasurement),
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
      type: MaterialInfoType(type),
      stockInfos: [],
      bundle: bundle.toDomain(),
      productImages:
          data.isNotEmpty ? data.first.toProductImage() : ProductImages.empty(),
      countryData: CountryData.empty(),
      parentID: '',
      counterOfferDetails: RequestCounterOfferDetails.empty(),
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
String _materialNumberReadValue(Map json, String key) =>
    json[key] ?? json['materialNumber'] ?? '';

String _principalCodeReadValue(Map json, String key) =>
    json[key] ?? json['principalCode'] ?? '';

@freezed
class MaterialDataDto with _$MaterialDataDto {
  const MaterialDataDto._();

  factory MaterialDataDto({
    @JsonKey(name: 'Code', defaultValue: '', readValue: materialNumberReadValue)
        required String code,
    @JsonKey(name: 'Manufactured', defaultValue: '')
        required String manufactured,
    @JsonKey(name: 'MaterialDescription', defaultValue: '')
        required String materialDescription,
    @JsonKey(name: 'DefaultMaterialDescription', defaultValue: '')
        required String defaultMaterialDescription,
    @JsonKey(name: 'GenericMaterialName', defaultValue: '')
        required String genericMaterialName,
    @JsonKey(name: 'GovernmentMaterialCode', defaultValue: '')
        required String governmentMaterialCode,
  }) = _MaterialDataDto;

  factory MaterialDataDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDataDtoFromJson(json);

  MaterialData toDomain() => MaterialData(
        materialNumber: MaterialNumber(code),
        manufactured: manufactured,
        materialDescription: materialDescription,
        defaultMaterialDescription: defaultMaterialDescription,
        genericMaterialName: genericMaterialName,
        governmentMaterialCode: governmentMaterialCode,
      );

  factory MaterialDataDto.fromDomain(MaterialData materialData) =>
      MaterialDataDto(
        code: materialData.materialNumber.getOrCrash(),
        manufactured: materialData.manufactured,
        materialDescription: materialData.materialDescription,
        defaultMaterialDescription: materialData.defaultMaterialDescription,
        genericMaterialName: materialData.genericMaterialName,
        governmentMaterialCode: materialData.governmentMaterialCode,
      );

  ProductImages toProductImage() => ProductImages.empty();
}

String materialNumberReadValue(Map json, String key) =>
    json[key] ?? json['MaterialCode'];

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
