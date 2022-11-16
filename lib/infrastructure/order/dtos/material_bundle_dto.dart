import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/domain/order/entities/principal_data.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_bundle_dto.freezed.dart';
part 'material_bundle_dto.g.dart';

@freezed
class MaterialBundleDto with _$MaterialBundleDto {
  const MaterialBundleDto._();

  const factory MaterialBundleDto({
    @JsonKey(name: 'MaterialNumber') required String materialNumber,
    @JsonKey(name: 'Bundles', defaultValue: <BundleDto>[])
        required List<BundleDto> bundles,
  }) = _MaterialBundleDto;

  factory MaterialBundleDto.fromDomain(MaterialInfo materialBundleInfo) {
    return MaterialBundleDto(
      materialNumber: materialBundleInfo.materialNumber.getOrCrash(),
      bundles: materialBundleInfo.bundles
          .map((e) => BundleDto.fromDomain(e))
          .toList(),
    );
  }

  MaterialInfo toDomain() {
    return MaterialInfo(
      materialNumber: MaterialNumber(materialNumber),
      bundles: bundles.map((e) => e.toDomain()).toList(),
      materialDescription: '',
      governmentMaterialCode: '',
      therapeuticClass: '',
      itemBrand: '',
      principalData: const PrincipalData(
        principalName: '',
        principalCode: '',
      ),
      taxClassification:  MaterialTaxClassification(''),
      itemRegistrationNumber: '',
      unitOfMeasurement: '',
      materialGroup2: MaterialGroup.two(''),
      materialGroup4: MaterialGroup.four(''),
      isSampleMaterial: false,
      hidePrice: false,
      hasValidTenderContract: false,
      hasMandatoryTenderContract: false,
      taxes: [],
      defaultMaterialDescription: '',
      isFOCMaterial: false,
    );
  }

  factory MaterialBundleDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialBundleDtoFromJson(json);
}
