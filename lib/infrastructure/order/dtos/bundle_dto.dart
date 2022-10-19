import 'package:ezrxmobile/domain/order/entities/bundle.dart';
import 'package:ezrxmobile/infrastructure/order/dtos/bundle_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bundle_dto.freezed.dart';
part 'bundle_dto.g.dart';

@freezed
class BundleDto with _$BundleDto {
  const BundleDto._();

  const factory BundleDto({
    @JsonKey(name: 'bundleName') required String bundleName,
    @JsonKey(name: 'bundleCode') required String bundleCode,
    @JsonKey(name: 'bundleInformation', defaultValue: <BundleInfoDto>[])
        required List<BundleInfoDto> bundleInformation,
  }) = _BundleDto;

  Bundle toDomain() {
    return Bundle(
      bundleName: bundleName,
      bundleCode: bundleCode,
      bundleInformation: bundleInformation.map((e) => e.toDomain()).toList(),
    );
  }

  factory BundleDto.fromDomain(Bundle bundle) {
    return BundleDto(
      bundleName: bundle.bundleName,
      bundleCode: bundle.bundleCode,
      bundleInformation: bundle.bundleInformation
          .map((e) => BundleInfoDto.fromDomain(e))
          .toList(),
    );
  }

  factory BundleDto.fromJson(Map<String, dynamic> json) =>
      _$BundleDtoFromJson(json);
}
