import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_info_dto.freezed.dart';
part 'sales_district_info_dto.g.dart';

@freezed
class SalesDistrictInfoDto with _$SalesDistrictInfoDto {
  const SalesDistrictInfoDto._();
  const factory SalesDistrictInfoDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrict,
    @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
        required String salesDistrictLabel,
  }) = _SalesDistrictInfoDto;

  SalesDistrictInfo toDomain() {
    return SalesDistrictInfo(
      id: id,
      salesDistrict: salesDistrict,
      salesDistrictLabel: salesDistrictLabel,
    );
  }

  factory SalesDistrictInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDistrictInfoDtoFromJson(json);
}
