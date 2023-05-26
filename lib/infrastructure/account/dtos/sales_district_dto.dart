import 'package:ezrxmobile/domain/account/entities/sales_district.dart';
import 'package:ezrxmobile/infrastructure/account/dtos/sales_district_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
part 'sales_district_dto.freezed.dart';
part 'sales_district_dto.g.dart';

@freezed
class SalesDistrictDto with _$SalesDistrictDto {
  const SalesDistrictDto._();
  const factory SalesDistrictDto({
    @JsonKey(name: 'salesOrg', defaultValue: '') required String salesOrg,
    @JsonKey(name: 'salesDistricts', defaultValue: <SalesDistrictInfoDto>[])
        required List<SalesDistrictInfoDto> salesDistrictInfo,
  }) = _SalesDistrictDto;

  SalesDistrict toDomain() {
    return SalesDistrict(
      salesOrg: SalesOrg(salesOrg),
      salesDistrictInfo: salesDistrictInfo.map((e) => e.toDomain()).toList(),
    );
  }

  factory SalesDistrictDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDistrictDtoFromJson(json);
}
