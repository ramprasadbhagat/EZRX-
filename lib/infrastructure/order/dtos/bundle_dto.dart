import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/domain/order/value/value_objects.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/material_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'bundle_dto.freezed.dart';
part 'bundle_dto.g.dart';

@freezed
class BundleDto with _$BundleDto {
  const BundleDto._();
  @HiveType(typeId: 15, adapterName: 'BundleDtoAdapter')
  const factory BundleDto({
    @JsonKey(name: 'bundleName')
    @HiveField(18, defaultValue: '')
        required String bundleName,
    @JsonKey(name: 'bundleCode')
    @HiveField(19, defaultValue: '')
        required String bundleCode,
    @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
    @HiveField(20, defaultValue: <BundleInfoDto>[])
        required List<BundleInfoDto> bundleInformation,
    @JsonKey(name: 'materials', readValue: handleEmptyMaterialList)
    @HiveField(21, defaultValue: <MaterialDto>[])
        required List<MaterialDto> materials,
  }) = _BundleDto;

  Bundle toDomain() {
    return Bundle(
      materials: materials.map((e) => e.toDomain()).toList(),
      bundleName: BundleName(bundleName),
      bundleCode: bundleCode,
      bundleInformation: bundleInformation.map((e) => e.toDomain()).toList(),
    );
  }

  factory BundleDto.fromDomain(Bundle bundle) {
    return BundleDto(
      materials:
          bundle.materials.map((e) => MaterialDto.fromDomain(e)).toList(),
      bundleName: bundle.bundleName.getOrDefaultValue(''),
      bundleCode: bundle.bundleCode,
      bundleInformation: bundle.bundleInformation
          .map((e) => BundleInfoDto.fromDomain(e))
          .toList(),
    );
  }

  factory BundleDto.fromJson(Map<String, dynamic> json) =>
      _$BundleDtoFromJson(json);
}

List handleEmptyMaterialList(Map json, String key) {
  if (json[key] == null || json[key].isEmpty) {
    return [];
  }

  return json[key];
}
