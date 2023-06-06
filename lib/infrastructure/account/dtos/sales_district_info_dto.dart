import 'package:ezrxmobile/domain/account/entities/sales_district_info.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_district_info_dto.freezed.dart';
part 'sales_district_info_dto.g.dart';

@freezed
class SalesDistrictInfoDto with _$SalesDistrictInfoDto {
  const SalesDistrictInfoDto._();
  const factory SalesDistrictInfoDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id,
    @JsonKey(name: 'salesDistrict', defaultValue: '')
        required String salesDistrictHeader,
    @JsonKey(name: 'salesDistrictLabel', defaultValue: '')
        required String salesDistrictLabel,
  }) = _SalesDistrictInfoDto;

  SalesDistrictInfo toDomain() {
    return SalesDistrictInfo(
      id: id,
      salesDistrictHeader: StringValue(salesDistrictHeader),
      salesDistrictLabel: StringValue(salesDistrictLabel),
      isDeleteInProgress: false,
    );
  }

  factory SalesDistrictInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SalesDistrictInfoDtoFromJson(json);
}
