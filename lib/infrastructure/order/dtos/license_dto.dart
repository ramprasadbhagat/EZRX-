import 'package:ezrxmobile/domain/order/entities/license_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'license_dto.freezed.dart';
part 'license_dto.g.dart';

@freezed
class LicenseDto with _$LicenseDto {
  const LicenseDto._();
  const factory LicenseDto({
    @JsonKey(name: 'licenceType') required String licenceType,
    @JsonKey(name: 'licenseDescription') required String licenseDescription,
    @JsonKey(name: 'licenseNumber') required String licenseNumber,
    @JsonKey(name: 'validFrom', defaultValue: '', readValue: dateTimeStringFormatCheck)
        required String validFrom,
    @JsonKey(name: 'validTo', defaultValue: '', readValue: dateTimeStringFormatCheck)
        required String validTo,
  }) = _licenseDto;

  factory LicenseDto.fromDomain(LicenseInfo licenseInfo) {
    return LicenseDto(
      licenceType: licenseInfo.licenceType,
      licenseDescription: licenseInfo.licenseDescription,
      licenseNumber: licenseInfo.licenseNumber,
      validFrom: licenseInfo.validFrom,
      validTo: licenseInfo.validTo,
    );
  }

  LicenseInfo toDomain() {
    return LicenseInfo(
      licenceType: licenceType,
      licenseDescription: licenseDescription,
      licenseNumber: licenseNumber,
      validFrom: validFrom,
      validTo: validTo,
    );
  }

  factory LicenseDto.fromJson(Map<String, dynamic> json) =>
      _$LicenseDtoFromJson(json);
}

String dateTimeStringFormatCheck(Map json, String key) =>
    (json[key] ?? '').isNotEmpty
        ? DateFormat('yMMMMd').format(DateTime.parse(json[key]))
        : '';
